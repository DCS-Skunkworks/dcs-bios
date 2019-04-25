/*
  The following #define tells DCS-BIOS that this is a RS-485 slave device.
  It also sets the address of this slave device. The slave address should be
  between 1 and 126 and must be unique among all devices on the same bus.
*/
#define DCSBIOS_RS485_SLAVE 1

/*
  The Arduino pin that is connected to the
  /RE and DE pins on the RS-485 transceiver.
*/
#define TXENABLE_PIN 2

#include "DcsBios.h"

/* paste code snippets from the reference documentation here */

void setup() {
  DcsBios::setup();
}

void loop() {
  DcsBios::loop();
}
