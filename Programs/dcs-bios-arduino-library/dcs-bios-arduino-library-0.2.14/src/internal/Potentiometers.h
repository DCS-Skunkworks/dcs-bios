#ifndef __DCSBIOS_POTS_H
#define __DCSBIOS_POTS_H

#include <math.h>
#include "Arduino.h"
#include "PollingInput.h"

namespace DcsBios {

	template <unsigned int pollInterval = 5, unsigned int hysteresis = 128, unsigned int ewma_divisor = 5>
	class PotentiometerEWMA : PollingInput {
		private:
			void pollInput() {
				unsigned char now = (unsigned char)millis();
				if ((unsigned char)(now - lastPollTime_) < pollInterval) return;
				lastPollTime_ = now;
				
				unsigned int state = map(analogRead(pin_), 0, 1023, 0, 65535);
				accumulator += ((float)state - accumulator) / (float)ewma_divisor;
				state = (unsigned int)accumulator;
				
				if (((lastState_ > state && (lastState_ - state > hysteresis)))
				|| ((state > lastState_) && (state - lastState_ > hysteresis))
				|| ((state > (65535 - hysteresis) && state > lastState_))
				|| ((state < hysteresis && state < lastState_))
				) {
					char buf[6];
					utoa(state, buf, 10);
					if (tryToSendDcsBiosMessage(msg_, buf))
						lastState_ = state;
				}
			}
			const char* msg_;
			char pin_;
			unsigned int lastState_;
			float accumulator;
			unsigned char lastPollTime_;
			
		public:
			PotentiometerEWMA(const char* msg, char pin) {
				msg_ = msg;
				pin_ = pin;
				pinMode(pin_, INPUT);
				lastState_ = (float)map(analogRead(pin_), 0, 1023, 0, 65535);
				lastPollTime_ = (unsigned char)millis();
			}
			
			//////////////////////////////////////////
			//	Inserted Code
			//
			
				void pollInputCurrent() 
					{
						unsigned int state = map(analogRead(pin_), 0, 1023, 0, 65535);
						
						char buf[6];
						utoa(state, buf, 10);
						if (tryToSendDcsBiosMessage(msg_, buf))
							lastState_ = state;
							
						delay(4);	
											
					}
				
				
	};

	typedef PotentiometerEWMA<> Potentiometer;
	
}

#endif
