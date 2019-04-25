#ifndef __DCSBIOS_LEDS_H
#define __DCSBIOS_LEDS_H

#include "Arduino.h"
#include "ExportStreamListener.h"

namespace DcsBios {

	class LED : public Int16Buffer {
		private:
			unsigned int mask;
			unsigned char pin;
		public:
			LED(unsigned int address, unsigned int mask, char pin) : Int16Buffer(address), mask(mask), pin(pin) {
				pinMode(pin, OUTPUT);
			}
			virtual void loop() {
				if (hasUpdatedData()) {
					if (getData() & mask) {
						digitalWrite(pin, 1);
					} else {
						digitalWrite(pin, 0);
					}
				}
			}
	};

}

#endif