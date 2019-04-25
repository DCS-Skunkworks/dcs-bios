/*
  Tell DCS-BIOS this is a RS-485 Master.
  You will need to flash this to a Mega 2560.
*/
#define DCSBIOS_RS485_MASTER

/*
  Define where the TX_ENABLE signals are connected.
  You can connect up to three half-duplex RS-485 transceivers.
  
  Arduino Pin             RS-485 Transceiver Pin
  TXn ------------------- DI (driver input)
  RXn ------------------- RO (Receiver Output)
  UARTn_TXENABLE_PIN ---- /RE, DE (active low receiver enable, driver enable)
  
  If you have less than three transceivers connected, comment out the corresponding
  #define UARTn_TEXENABLE_PIN lines for receivers that are not present.
*/
#define UART1_TXENABLE_PIN 2
#define UART2_TXENABLE_PIN 3
#define UART3_TXENABLE_PIN 4

#include "DcsBios.h"

void setup() {
  DcsBios::setup();
}

void loop() {
  DcsBios::loop();
}

