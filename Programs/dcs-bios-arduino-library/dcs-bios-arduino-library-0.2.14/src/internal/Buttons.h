#ifndef __DCSBIOS_BUTTONS_H
#define __DCSBIOS_BUTTONS_H

#include "Arduino.h"

namespace DcsBios {
	class ActionButton : PollingInput {
		private:
			const char* msg_;
			const char* arg_;
			char pin_;
			char lastState_;
			void pollInput() {
				char state = digitalRead(pin_);
				if (state != lastState_) {
					if (lastState_ == HIGH && state == LOW) {
						while(!tryToSendDcsBiosMessage(msg_, arg_));
					}
					lastState_ = state;
				}
			}
		public:
			ActionButton(const char* msg, const char* arg, char pin) {
				msg_ = msg;
				arg_ = arg;
				pin_ = pin;
				pinMode(pin_, INPUT_PULLUP);
				lastState_ = digitalRead(pin_);
			}
	};

  //New Matrix-Compatible Button class
  //This class expects a char array that saves the state of all buttons in a button matrix
	class MatActionButton : PollingInput {
		private:
			const char* msg_;
			const char* arg_;
			char lastState_;
      //removed variable for pin, added variables for row and col, as well as pointer to the array
			char row;
			char col;
			char* matrix;

      //pollInput now reads the state from the array instead of from a physical pin
			void pollInput() {
				char state = *matrix[row][col];
				if (state != lastState_) {
					if (lastState_ == HIGH && state == LOW) {
						while(!tryToSendDcsBiosMessage(msg_, arg_));
					}
					lastState_ = state;
				}
			}

		public:
      //init now expects row and column, as well as an array pointer, instead of a pin
			ActionButton(const char* msg, const char* arg, char argRow, char argCol, char* argMatrix) {
				msg_ = msg;
				arg_ = arg;
				pin_ = pin;
				row = argRow;
				col = argCol;
				matrix = argMatrix;

				lastState_ = *matrix[row][col];
			}
	};
}

#endif
