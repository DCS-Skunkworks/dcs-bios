#ifdef DCSBIOS_RS485_MASTER
#include "DcsBiosNgRS485Master.h"
#include <avr/interrupt.h>
 
 
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

#define s8() sbi(PORTH,5)
#define c8() cbi(PORTH,5)
#define s9() sbi(PORTH,6)
#define c9() cbi(PORTH,6)
#define s10() sbi(PORTB,4)
#define c10() cbi(PORTB,4)
 
 namespace DcsBios {
	//EndOfUpdateDetector eouDetector;
	
	MasterPCConnection uart0(&UDR0, &UCSR0A, &UCSR0B, &UCSR0C);
	
	RS485Master::RS485Master(volatile uint8_t *udr, volatile uint8_t *ucsra, volatile uint8_t *ucsrb, volatile uint8_t *ucsrc, uint8_t txen_pin) :
	udr(udr), ucsra(ucsra), ucsrb(ucsrb), ucsrc(ucsrc) {
		// build a circular, singly-linked list of all RS485Master instances
		if (firstRS485Master == NULL) {
			firstRS485Master = this;
			this->nextRS485Master = this;
			uart0.next_tx_rs485_master = this;
		} else {
			this->nextRS485Master = firstRS485Master->nextRS485Master;
			firstRS485Master->nextRS485Master = this;
		}
		
	
		txen_port = portOutputRegister(digitalPinToPort(txen_pin));
		txen_pin_mask = digitalPinToBitMask(txen_pin);
	
		state = IDLE;
		clear_txen();
		poll_address_counter = 1;
		scan_address_counter = 1;
		uint8_t i;
		slave_present[0] = true; // slave id 0 will not be polled; instead, a non-present slave id will be polled instead to scan for new devices
		for (i=1; i<128; i++) slave_present[i] = false;
	}

	void RS485Master::advancePollAddress() {
		poll_address_counter = (poll_address_counter + 1) % 128; // advance 1 step
		while (!slave_present[poll_address_counter])
			poll_address_counter = (poll_address_counter + 1) % 128; // advance until next present slave id
			
		if (poll_address_counter == 0) {
			// instead of polling slave id 0, scan for a new device
			scan_address_counter = (scan_address_counter + 1) % 128;
			while (slave_present[scan_address_counter])
				scan_address_counter = (scan_address_counter + 1) % 128; // advance to slave id that is not present
			poll_address = scan_address_counter; // scan for this device id
			return;
			// CAVEAT: this will break if every device ID is present on the bus
			// (advancing scan_address_counter will become an infinite loop in this case)
		}
		
		poll_address = poll_address_counter;
	}
	
	void RS485Master::loop() {
		if (state == IDLE) {
			if (exportData.isNotEmpty()) {
				// we have export data to send
				rxtx_len = exportData.getLength();
				noInterrupts(); s8();
				tx_byte(0);
				state = TX_ADDRESS_SENT;
				c8(); interrupts();
				set_udrie();
			} else if (messageBuffer.isEmpty() && !messageBuffer.complete) {
				// message buffer is free, poll a device
				advancePollAddress();
				noInterrupts(); s8();
				tx_byte(poll_address);
				state = POLL_ADDRESS_SENT;
				set_udrie();
				c8(); interrupts();
			} else {
				uart0.checkTimeout();
			}
		}
		
		// timeout for non-existing devices
		if (state == RX_WAIT_DATALENGTH && ((micros() - rx_start_time) > 1000)) {
			slave_present[poll_address] = false;
			noInterrupts(); s8();
			tx_byte(0); // send zero data length on behalf of the non-existing device
			state = TIMEOUT_ZEROBYTE_SENT;
			c8(); interrupts();
		}
		
		if ((state == RX_WAIT_MSGTYPE || state == RX_WAIT_DATA || state == RX_WAIT_CHECKSUM)
		&& ((micros() - rx_start_time) > 5000)) {
			messageBuffer.clear();
			messageBuffer.put('\n');
			noInterrupts(); s8();
			messageBuffer.complete = true;
			uart0.set_udrie();
			state = IDLE;
			c8(); interrupts();
		}
		
	}
	
	void __attribute__((always_inline)) inline RS485Master::udreISR() {
		
		// called when we can load the next byte to be sent into UDR
		switch(state) {
			case POLL_ADDRESS_SENT:
				state = POLL_MSGTYPE_SENT;
				tx_byte(0x0);
			break;
			
			case POLL_MSGTYPE_SENT:
				state = POLL_DATALENGTH_SENT;
				tx_byte(0);
				clear_udrie();
			break;
			
			
			case TX_ADDRESS_SENT:
				state = TX_MSGTYPE_SENT;
				tx_byte(0);
			break;
			
			case TX_MSGTYPE_SENT:
				state = TX;
				tx_byte(rxtx_len);
			break;
			
			case TX:
				if (rxtx_len == 0) {
					//if (exportData.getLength() == 0) exportData.complete = false;
					tx_byte(checksum);
					state = TX_CHECKSUM_SENT;
					clear_udrie();
				} else {
					tx_byte(exportData.get());
					rxtx_len--;
				}
			break;
			
		}
	}
	
	void __attribute__((always_inline)) inline RS485Master::txcISR() {
		//clear_txen();
		switch (state) {
			
			case POLL_DATALENGTH_SENT:
				rx_start_time = micros();
				state = RX_WAIT_DATALENGTH;
				clear_txen();
			break;
			
			case TIMEOUT_ZEROBYTE_SENT:
				state = IDLE;
				clear_txen();
			break;
			
			case TX_CHECKSUM_SENT:
				state = IDLE;
				clear_txen();
			break;
		}
	}
	
	void __attribute__((always_inline)) inline RS485Master::rxISR() {
		volatile uint8_t data = *udr;
		switch(state) {
			case RX_WAIT_DATALENGTH:
				rxtx_len = data;
				slave_present[poll_address] = true;
				if (rxtx_len > 0) {
					state = RX_WAIT_MSGTYPE;
				} else {
					state = IDLE;
				}
			break;
			
			case RX_WAIT_MSGTYPE:
				rx_msgtype = data;
				state = RX_WAIT_DATA;
			break;
			
			case RX_WAIT_DATA:
				messageBuffer.put(data);
				rxtx_len--;
				uart0.set_udrie(); // wake up TX to PC
				if (rxtx_len == 0) {
					state = RX_WAIT_CHECKSUM;
				}
			break;
			
			case RX_WAIT_CHECKSUM:
				// TODO: check checksum here
				messageBuffer.complete = true;
				uart0.set_udrie(); // wake up TX to PC
				state = IDLE;
			break;

		}
	}
	


	
	#ifdef UART1_TXENABLE_PIN
	RS485Master uart1(&UDR1, &UCSR1A, &UCSR1B, &UCSR1C, UART1_TXENABLE_PIN);
	#endif
	#ifdef UART2_TXENABLE_PIN
	RS485Master uart2(&UDR2, &UCSR2A, &UCSR2B, &UCSR2C, UART2_TXENABLE_PIN);
	#endif
	#ifdef UART3_TXENABLE_PIN
	RS485Master uart3(&UDR3, &UCSR3A, &UCSR3B, &UCSR3C, UART3_TXENABLE_PIN);
	#endif
	
	RingBuffer<32>* pc_tx_buffer = NULL;
	
	MasterPCConnection::MasterPCConnection(volatile uint8_t *udr, volatile uint8_t *ucsra, volatile uint8_t *ucsrb, volatile uint8_t *ucsrc)
	: udr(udr), ucsra(ucsra), ucsrb(ucsrb), ucsrc(ucsrc) {
	}
	
	void __attribute__((always_inline)) inline MasterPCConnection::advanceTxBuffer() {
		RS485Master* start = next_tx_rs485_master;
		while(1) {
			next_tx_rs485_master = next_tx_rs485_master->nextRS485Master;
			if (next_tx_rs485_master->messageBuffer.isEmpty() && next_tx_rs485_master->messageBuffer.complete) {
				next_tx_rs485_master->messageBuffer.complete = false;
			}
			if (next_tx_rs485_master->messageBuffer.isNotEmpty()) {
				pc_tx_buffer = &(next_tx_rs485_master->messageBuffer);
				tx_start_time = micros();
				return;
			}
			if (next_tx_rs485_master == start) break;
		}
	}
	
	void MasterPCConnection::checkTimeout() {
		noInterrupts(); s8();
		volatile unsigned long _tx_start_time = tx_start_time;
		c8(); interrupts();
		if (pc_tx_buffer && (micros() - _tx_start_time > 5000)) {
			pc_tx_buffer->clear();
			pc_tx_buffer->put('\n');
			pc_tx_buffer->complete = true;
			set_udrie();
		}
	}
	
	void __attribute__((always_inline)) inline MasterPCConnection::udreISR() {
		if (pc_tx_buffer == NULL) advanceTxBuffer();
		
		// if the buffer is empty, we have nothing to do but wait for more data
		if (pc_tx_buffer->isEmpty()) {
			if (pc_tx_buffer->complete) {
				// except if the buffer was marked as complete, which means we can set the variable to NULL
				// and clear the buffer's complete flag so it's RS485Master can poll the next device
				pc_tx_buffer->complete = false;
				advanceTxBuffer();
				if (pc_tx_buffer == NULL) clear_udrie();
				return;
			} else {
				// waiting for more data in buffer
				clear_udrie();
				return;
			}
		}
		
		// otherwise, we have a character to transmit!
		*ucsra |= (1<<TXC0);
		*udr = pc_tx_buffer->get();
	}
	
	void __attribute__((always_inline)) inline MasterPCConnection::rxISR() {
		volatile uint8_t c = *udr;
		#ifdef UART1_TXENABLE_PIN
		uart1.exportData.put(c);
		#endif
		#ifdef UART2_TXENABLE_PIN
		uart2.exportData.put(c);
		#endif
		#ifdef UART3_TXENABLE_PIN
		uart3.exportData.put(c);
		#endif
	}
	
	
	void setup() {
		pinMode(8, OUTPUT);
		digitalWrite(8, 0);
		pinMode(9, OUTPUT);
		digitalWrite(9, 0);
		pinMode(10, OUTPUT);
		digitalWrite(10, 0);
	
		#ifdef UART1_TXENABLE_PIN
		pinMode(UART1_TXENABLE_PIN, OUTPUT);
		PRR1 &= ~(1<<PRUSART1);
		// init UART1 (RS485 Master)
		UBRR1H = 0;
		UBRR1L = 3;
		UCSR1A = 0;
		UCSR1C = (1<<UCSZ00) | (1<<UCSZ01);
		UCSR1B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0) | (1<<TXCIE0);
		#endif
		
		#ifdef UART2_TXENABLE_PIN
		pinMode(UART2_TXENABLE_PIN, OUTPUT);
		PRR1 &= ~(1<<PRUSART2);
		// init UART1 (RS485 Master)
		UBRR2H = 0;
		UBRR2L = 3;
		UCSR2A = 0;
		UCSR2C = (1<<UCSZ00) | (1<<UCSZ01);
		UCSR2B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0) | (1<<TXCIE0);
		#endif

		#ifdef UART3_TXENABLE_PIN
		pinMode(UART3_TXENABLE_PIN, OUTPUT);
		PRR1 &= ~(1<<PRUSART3);
		// init UART1 (RS485 Master)
		UBRR3H = 0;
		UBRR3L = 3;
		UCSR3A = 0;
		UCSR3C = (1<<UCSZ00) | (1<<UCSZ01);
		UCSR3B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0) | (1<<TXCIE0);
		#endif
		
		
		// init UART0 (PC connection)
		PRR0 &= ~(1<<PRUSART0);
		UBRR0H = 0;
		UBRR0L = 3;
		UCSR0A = 0;
		UCSR0C = (1<<UCSZ00) | (1<<UCSZ01);
		UCSR0B = (1<<RXEN0) | (1<<TXEN0) | (1<<RXCIE0);
		
	}
	
	void loop() {
		#ifdef UART1_TXENABLE_PIN
		uart1.loop();
		#endif
		#ifdef UART2_TXENABLE_PIN
		uart2.loop();
		#endif
		#ifdef UART3_TXENABLE_PIN
		uart3.loop();
		#endif
	}
	/*
	void eouDetected() {
	  // update complete
	  // signal the RS485Master instances to send the exportData buffer no matter how short it is
	  #ifdef UART1_TXENABLE_PIN
	  uart1.exportData.complete = true;
	  #endif
	  #ifdef UART2_TXENABLE_PIN
	  uart2.exportData.complete = true;
	  #endif
	  #ifdef UART3_TXENABLE_PIN
	  uart3.exportData.complete = true;
	  #endif
	}
	*/
	ISR(USART0_UDRE_vect) { s8(); uart0.udreISR(); c8(); }
	ISR(USART0_RX_vect) { s8(); s9(); uart0.rxISR(); c9(); c8(); }
	
	#ifdef UART1_TXENABLE_PIN
	ISR(USART1_UDRE_vect) { s8(); uart1.udreISR(); c8(); }
	ISR(USART1_TX_vect) { s8(); uart1.txcISR(); c8(); }
	ISR(USART1_RX_vect) { s8(); uart1.rxISR(); c8(); }
	#endif

	#ifdef UART2_TXENABLE_PIN
	ISR(USART2_UDRE_vect) { s8(); uart2.udreISR(); c8(); }
	ISR(USART2_TX_vect) { s8(); uart2.txcISR(); c8(); }
	ISR(USART2_RX_vect) { s8(); s10(); uart2.rxISR(); c10(); c8(); }
	#endif
	
	#ifdef UART3_TXENABLE_PIN
	ISR(USART3_UDRE_vect) { s8(); uart3.udreISR(); c8(); }
	ISR(USART3_TX_vect) { s8(); uart3.txcISR(); c8(); }
	ISR(USART3_RX_vect) { s8(); uart3.rxISR(); c8(); }
	#endif
	
}
#endif
