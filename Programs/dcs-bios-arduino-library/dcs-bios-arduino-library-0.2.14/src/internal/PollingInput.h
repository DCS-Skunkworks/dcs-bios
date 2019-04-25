#ifndef __DCSBIOS_POLLINGINPUT_H
#define __DCSBIOS_POLLINGINPUT_H

#include "Arduino.h"

bool tryToSendDcsBiosMessage(const char* msg, const char* args);

static bool messageSentOrQueued;

namespace DcsBios {

	class PollingInput {
		private:
			virtual void pollInput();
			PollingInput* nextPollingInput;
		public:
			static PollingInput* firstPollingInput;
			static void setMessageSentOrQueued() { messageSentOrQueued = true; }
			PollingInput() {
				this->nextPollingInput = firstPollingInput;
				firstPollingInput = this;
			}
			static void pollInputs() {
				PollingInput* pi = firstPollingInput;
				if (!pi) return;
				
				PollingInput* lastSender = NULL;
				do { // step through circular linked list
					messageSentOrQueued = false;
					pi->pollInput();
					if (messageSentOrQueued) {
						lastSender = pi;
					}
					
					// make linked list circular if it is not already
					if (pi->nextPollingInput == NULL) pi->nextPollingInput = firstPollingInput;
					
					pi = pi->nextPollingInput;
				} while (pi != firstPollingInput); // util we get back to the start
				
				if (lastSender && (firstPollingInput != pi)) {
					// if at least two elements in the list and someone queued
					// or send a message, rotate the list to make the next poll
					// start after the input that got to queue the last message
					firstPollingInput = lastSender->nextPollingInput;
				}
			}
	};
	
}

#endif