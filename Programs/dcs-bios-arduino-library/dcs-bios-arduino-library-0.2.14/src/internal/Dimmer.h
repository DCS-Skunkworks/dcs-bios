#ifndef __DCSBIOS_DIMMER_H
#define __DCSBIOS_DIMMER_H

#include "Arduino.h"
#include "ExportStreamListener.h"

namespace DcsBios {

	class Dimmer : public Int16Buffer {
		private:
			void onDcsBiosFrameSync();
			char pin_;
		public:
			Dimmer(unsigned int address, char pin) : Int16Buffer(address){
				pin_ = pin;
			}
			virtual void loop() {
				if (hasUpdatedData()) {
					analogWrite(pin_, getData()/255);
					} 
				}
			};

}

#endif