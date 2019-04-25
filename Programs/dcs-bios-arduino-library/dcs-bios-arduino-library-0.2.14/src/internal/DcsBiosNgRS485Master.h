#ifndef _DCSBIOS_NG_RS485_MASTER_H_
#define _DCSBIOS_NG_RS485_MASTER_H_

#if not (defined(__AVR_ATmega2560__) || defined(__AVR_ATmega1280__))
    #error The RS485Master sketch requires an Arduino Mega!
#endif

#include "Arduino.h"
#include <stdint.h>

#include "RingBuffer.h"

#define UART1_TXEN_PORT PORTE
#define UART1_TXEN_DDR DDRE
#define UART1_TXEN_PIN 4

#define UART2_TXEN_PORT PORTE
#define UART2_TXEN_DDR DDRE
#define UART2_TXEN_PIN 5

#define UART3_TXEN_PORT PORTG
#define UART3_TXEN_DDR DDRG
#define UART3_TXEN_PIN 5

#define uart1_txen_setup() UART1_TXEN_DDR |= (1<<UART1_TXEN_PIN)
#define uart1_set_txen() UART1_TXEN_PORT |= (1<<UART1_TXEN_PIN)
#define uart1_clear_txen() UART1_TXEN_PORT &= (1<<UART1_TXEN_PIN)

#define uart2_txen_setup() UART2_TXEN_PORT |= (1<<UART2_TXEN_PIN)
#define uart2_set_txen() UART2_TXEN_PORT |= (1<<UART2_TXEN_PIN)
#define uart2_clear_txen() UART2_TXEN_PORT &= (1<<UART2_TXEN_PIN)

#define uart3_txen_setup() UART3_TXEN_PORT |= (1<<UART3_TXEN_PIN)
#define uart3_set_txen() UART3_TXEN_PORT |= (1<<UART3_TXEN_PIN)
#define uart3_clear_txen() UART3_TXEN_PORT &= (1<<UART3_TXEN_PIN)


namespace DcsBios {
	
	extern void eouDetected();
	class EndOfUpdateDetector {
		uint8_t state;
		uint16_t address;
		uint16_t count;
		uint16_t data;
		uint8_t sync_byte_count;
		
		public:
		EndOfUpdateDetector() : state(0) {}
		
		void processChar(uint8_t c) {
  
		  switch(state) {
			case DCSBIOS_STATE_WAIT_FOR_SYNC:
				/* do nothing */
				break;
				
			case DCSBIOS_STATE_ADDRESS_LOW:
				address = (unsigned int)c;
				state = DCSBIOS_STATE_ADDRESS_HIGH;
				break;
				
			case DCSBIOS_STATE_ADDRESS_HIGH:
				address = (c << 8) | address;
				if (address != 0x5555) {
					state = DCSBIOS_STATE_COUNT_LOW;
				} else {
					state = DCSBIOS_STATE_WAIT_FOR_SYNC;
				}
				break;
				
			case DCSBIOS_STATE_COUNT_LOW:
				count = (unsigned int)c;
				state = DCSBIOS_STATE_COUNT_HIGH;
				break;
				
			case DCSBIOS_STATE_COUNT_HIGH:
				count = (c << 8) | count;
				state = DCSBIOS_STATE_DATA_LOW;
				break;
				
			case DCSBIOS_STATE_DATA_LOW:
				data = (unsigned int)c;
				count--;
				state = DCSBIOS_STATE_DATA_HIGH;
				break;
				
			case DCSBIOS_STATE_DATA_HIGH:
				data = (c << 8) | data;
				count--;
				if (address == 0xfffe) eouDetected();
				address += 2;
				if (count == 0)
					state = DCSBIOS_STATE_ADDRESS_LOW;
				else
					state = DCSBIOS_STATE_DATA_LOW;
				break;
		  }

		  if (c == 0x55)
			sync_byte_count++;
		  else
			sync_byte_count = 0;
		  
		  if (sync_byte_count == 4) {
			state = DCSBIOS_STATE_ADDRESS_LOW;
			sync_byte_count = 0;
		  }
		}
	};
	
	
	class RS485Master {
	private:
		volatile uint8_t poll_address;
		
		volatile uint8_t scan_address_counter;
		volatile uint8_t poll_address_counter;
		volatile unsigned long rx_start_time;
		void advancePollAddress();

		
		volatile uint8_t *udr;
		volatile uint8_t *ucsra;
		volatile uint8_t *ucsrb;
		volatile uint8_t *ucsrc;
		
		volatile uint8_t *txen_port;
		volatile uint8_t txen_pin_mask;
		volatile uint8_t rxtx_len;
		volatile uint8_t rx_msgtype;
		volatile uint8_t checksum;
	public:
		static RS485Master* firstRS485Master;
		RS485Master* nextRS485Master;
		
		__attribute__((always_inline)) void set_txen() { *ucsrb &= ~((1<<RXEN0) | (1<<RXCIE0)); *txen_port |= txen_pin_mask; *ucsrb |= (1<<TXEN0) | (1<<TXCIE0); };
		__attribute__((always_inline)) void clear_txen() { *ucsrb &= ~((1<<TXEN0) | (1<<TXCIE0)); *txen_port &= ~txen_pin_mask; *ucsrb |= (1<<RXEN0) | (1<<RXCIE0); };
		__attribute__((always_inline)) void tx_byte(uint8_t c) { set_txen(); *udr = c; *ucsra |= (1<<TXC0); };
		__attribute__((always_inline)) void set_udrie() { *ucsrb |= (1<<UDRIE0); }
		__attribute__((always_inline)) void clear_udrie() { *ucsrb &= ~(1<<UDRIE0); }
		DcsBios::RingBuffer<128> exportData;
		DcsBios::RingBuffer<32> messageBuffer;
		volatile bool slave_present[128];
		volatile uint8_t state;
		enum RS485State {
			IDLE,
			POLL_ADDRESS_SENT,
			POLL_MSGTYPE_SENT,
			POLL_DATALENGTH_SENT,
			TIMEOUT_ZEROBYTE_SENT,
			RX_WAIT_DATALENGTH,
			RX_WAIT_MSGTYPE,
			RX_WAIT_DATA,
			RX_WAIT_CHECKSUM,
			TX_ADDRESS_SENT,
			TX_MSGTYPE_SENT,
			TX,
			TX_CHECKSUM_SENT
		};
		
		RS485Master(volatile uint8_t *udr, volatile uint8_t *ucsra, volatile uint8_t *ucsrb, volatile uint8_t *ucsrc, uint8_t txen_pin);
		void __attribute__((always_inline)) rxISR();
		void __attribute__((always_inline)) udreISR();
		void __attribute__((always_inline)) txcISR();
		void loop();
		
	};
	RS485Master* RS485Master::firstRS485Master = NULL;
	
	class MasterPCConnection {
	private:
		volatile uint8_t *udr;
		volatile uint8_t *ucsra;
		volatile uint8_t *ucsrb;
		volatile uint8_t *ucsrc;
		__attribute__((always_inline)) void clear_udrie() { *ucsrb &= ~(1<<UDRIE0); }
		__attribute__((always_inline)) void advanceTxBuffer();
		volatile unsigned long tx_start_time;
	public:
		RS485Master* next_tx_rs485_master;
		__attribute__((always_inline)) void set_udrie() { *ucsrb |= (1<<UDRIE0); }
		MasterPCConnection(volatile uint8_t *udr, volatile uint8_t *ucsra, volatile uint8_t *ucsrb, volatile uint8_t *ucsrc);
		__attribute__((always_inline)) void udreISR();
		__attribute__((always_inline)) void rxISR();
		void checkTimeout();
	};
	
	void setup();
	void loop();
};

#endif // _DCSBIOS_NG_RS485_MASTER_H_
