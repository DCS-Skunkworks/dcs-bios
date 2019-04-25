#ifndef __DCSBIOS_SET_STATE_INPUT_H
#define __DCSBIOS_SET_STATE_INPUT_H

#include "Arduino.h"

namespace DcsBios {

	class SetStateInput : PollingInput {
		private:
			unsigned int (*readState_)();
			const char* msg_;
			unsigned int lastState_;
			bool isFirstPoll_;
		public:
			SetStateInput(const char* msg, unsigned int (*readState)())
			: readState_(readState), msg_(msg), isFirstPoll_(true) {
			}
			
			void pollInput() {
				if (isFirstPoll_) {
					lastState_ = readState_();
					isFirstPoll_ = false;
					return;
				}
				
				unsigned int state = readState_();
				if (state != lastState_) {
					char buf[7];
					utoa(state, buf, 10);
					if (sendDcsBiosMessage(msg_, buf))
						lastState_ = state;
				}
			}
	}
	
}

#endif	