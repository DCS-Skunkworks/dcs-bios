#ifndef __DCSBIOS_SERVOS_H
#define __DCSBIOS_SERVOS_H

#ifdef Servo_h

#include "Arduino.h"
#include "ExportStreamListener.h"
#include <Servo.h>




namespace DcsBios {
	

	
	class ServoOutput : public Int16Buffer {
		private:
			void onDcsBiosFrameSync();
			Servo servo_;
			char pin_;
			int minPulseWidth_;
			int maxPulseWidth_;
			unsigned int (*map_function_)(unsigned int newValue);
		public:
			ServoOutput(unsigned int address, char pin, int minPulseWidth, int maxPulseWidth) : Int16Buffer (address) {
				pin_ = pin;
				minPulseWidth_ = minPulseWidth;
				maxPulseWidth_ = maxPulseWidth;
				map_function_ = NULL;
			}
			ServoOutput(unsigned int address, char pin) : Int16Buffer (address) {
				pin_ = pin;
				minPulseWidth_ = 544;
				maxPulseWidth_ = 2400;
				map_function_ = NULL;
			}
			ServoOutput(unsigned int address, char pin, int minPulseWidth, int maxPulseWidth, unsigned int (*map_function)(unsigned int newValue)) : Int16Buffer(address) {
				pin_ = pin;
				minPulseWidth_ = minPulseWidth;
				maxPulseWidth_ = maxPulseWidth;
				map_function_ = map_function;
			}
			virtual void loop() {
				if (!servo_.attached())
					servo_.attach(pin_, minPulseWidth_, maxPulseWidth_);
				if (hasUpdatedData()) {
					servo_.writeMicroseconds(mapValue(getData()));
				}
			}
			unsigned int mapValue(unsigned int value) {
				if (map_function_) {
					return map_function_(value);
				} else {
					return map(value, 0, 65535, minPulseWidth_, maxPulseWidth_);
				}
			}
	};
}

#endif

#endif