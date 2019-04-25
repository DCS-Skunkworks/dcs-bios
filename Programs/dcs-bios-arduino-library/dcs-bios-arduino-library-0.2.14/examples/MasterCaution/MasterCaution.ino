/* use '#define DCSBIOS_DEFAULT_SERIAL' instead if your Arduino board
 *  does not feature an ATMega328 or ATMega2650 controller.
 */
#define DCSBIOS_IRQ_SERIAL
#include "DcsBios.h"

/* Declare a Master Caution Reset button on pin 10 */
DcsBios::Switch2Pos ufcMasterCaution("UFC_MASTER_CAUTION", 10);
/* Make the LED connected to pin 13 into a Master Caution Light */
DcsBios::LED masterCaution(0x1012, 0x0800, 13);

void setup() {
  DcsBios::setup();
}

void loop() {
  DcsBios::loop();
}

