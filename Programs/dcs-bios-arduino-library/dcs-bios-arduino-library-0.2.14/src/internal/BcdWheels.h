#ifndef __DCSBIOS_BCDWHEELS_H
#define __DCSBIOS_BCDWHEELS_H

#include "Arduino.h"

namespace DcsBios {

class BcdWheel : PollingInput {
		private:
			char* msg_;
			char pinA_;
			char pinB_;
			char pinC_;
			char pinD_;
			char lastState_;
			char readState() {
				int total = 0;
				if (digitalRead(pinA_) == LOW) {total+=1;}
				if (digitalRead(pinB_) == LOW) {total+=2;}
				if (digitalRead(pinC_) == LOW) {total+=4;}
				if (digitalRead(pinD_) == LOW) {total+=8;}
		
				return total;
			}
			void pollInput() {
				char state = readState();
				if (state != lastState_) {
					if (state == 0)
						if (tryToSendDcsBiosMessage(msg_, "0"))
							lastState_ = state;
					if (state == 1)
						if (tryToSendDcsBiosMessage(msg_, "0.1"))
							lastState_ = state;
					if (state == 2)
						if (tryToSendDcsBiosMessage(msg_, "0.2"))
							lastState_ = state;
					if (state == 3)
						if (tryToSendDcsBiosMessage(msg_, "0.3"))
							lastState_ = state;
					if (state == 4)
						if (tryToSendDcsBiosMessage(msg_, "0.4"))
							lastState_ = state;
					if (state == 5)
						if (tryToSendDcsBiosMessage(msg_, "0.5"))
							lastState_ = state;
					if (state == 6)
						if (tryToSendDcsBiosMessage(msg_, "0.6"))
							lastState_ = state;
					if (state == 7)
						if (tryToSendDcsBiosMessage(msg_, "0.7"))
							lastState_ = state;
					if (state == 8)
						if (tryToSendDcsBiosMessage(msg_, "0.8"))
							lastState_ = state;	
					if (state == 9)
						if (tryToSendDcsBiosMessage(msg_, "0.9"))
							lastState_ = state;	
				}
			}
		public:
			BcdWheel(char* msg, char pinA, char pinB, char pinC, char pinD){
				msg_ = msg;
				pinA_ = pinA;
				pinB_ = pinB;
				pinC_ = pinC;
				pinD_ = pinD;
				pinMode(pinA_, INPUT_PULLUP);
				pinMode(pinB_, INPUT_PULLUP);
				pinMode(pinC_, INPUT_PULLUP);
				pinMode(pinD_, INPUT_PULLUP);
				lastState_ = readState();
			}
	};

	class RadioPreset : PollingInput {
		private:
			char* msg_;
			char pinA_;
			char pinB_;
			char pinC_;
			char pinD_;
			char pinE_;
			char lastState_;
			char readState() {
				int total = 0;
				if (digitalRead(pinA_) == LOW) {total+=1;}
				if (digitalRead(pinB_) == LOW) {total+=2;}
				if (digitalRead(pinC_) == LOW) {total+=4;}
				if (digitalRead(pinD_) == LOW) {total+=8;}
				if (digitalRead(pinE_) == LOW) {total+=16;}
		
				return total;
			}
			void pollInput() {
				char state = readState();
				if (state != lastState_) {
					if (state == 0)
						if (tryToSendDcsBiosMessage(msg_, "0"))
							lastState_ = state;
					if (state == 1)
						if (tryToSendDcsBiosMessage(msg_, "0.05"))
							lastState_ = state;
					if (state == 2)
						if (tryToSendDcsBiosMessage(msg_, "0.1"))
							lastState_ = state;
					if (state == 3)
						if (tryToSendDcsBiosMessage(msg_, "0.15"))
							lastState_ = state;
					if (state == 4)
						if (tryToSendDcsBiosMessage(msg_, "0.2"))
							lastState_ = state;
					if (state == 5)
						if (tryToSendDcsBiosMessage(msg_, "0.25"))
							lastState_ = state;
					if (state == 6)
						if (tryToSendDcsBiosMessage(msg_, "0.3"))
							lastState_ = state;
					if (state == 7)
						if (tryToSendDcsBiosMessage(msg_, "0.35"))
							lastState_ = state;
					if (state == 8)
						if (tryToSendDcsBiosMessage(msg_, "0.4"))
							lastState_ = state;
					if (state == 9)
						if (tryToSendDcsBiosMessage(msg_, "0.45"))
							lastState_ = state;
					if (state == 10)
						if (tryToSendDcsBiosMessage(msg_, "0.5"))
							lastState_ = state;
					if (state == 11)
						if (tryToSendDcsBiosMessage(msg_, "0.55"))
							lastState_ = state;
					if (state == 12)
						if (tryToSendDcsBiosMessage(msg_, "0.6"))
							lastState_ = state;
					if (state == 13)
						if (tryToSendDcsBiosMessage(msg_, "0.65"))
							lastState_ = state;
					if (state == 14)
						if (tryToSendDcsBiosMessage(msg_, "0.7"))
							lastState_ = state;
					if (state == 15)
						if (tryToSendDcsBiosMessage(msg_, "0.75"))
							lastState_ = state;
					if (state == 16)
						if (tryToSendDcsBiosMessage(msg_, "0.8"))
							lastState_ = state;
					if (state == 17)
						if (tryToSendDcsBiosMessage(msg_, "0.85"))
							lastState_ = state;
					if (state == 18)
						if (tryToSendDcsBiosMessage(msg_, "0.9"))
							lastState_ = state;
					if (state == 19)
						if (tryToSendDcsBiosMessage(msg_, "0.95"))
							lastState_ = state;
					if (state == 20)
						if (tryToSendDcsBiosMessage(msg_, "1"))
							lastState_ = state;	
		}
			}
		public:
			RadioPreset(char* msg, char pinA, char pinB, char pinC, char pinD, char pinE){
				msg_ = msg;
				pinA_ = pinA;
				pinB_ = pinB;
				pinC_ = pinC;
				pinD_ = pinD;
				pinE_ = pinE;
				pinMode(pinA_, INPUT_PULLUP);
				pinMode(pinB_, INPUT_PULLUP);
				pinMode(pinC_, INPUT_PULLUP);
				pinMode(pinD_, INPUT_PULLUP);
				pinMode(pinE_, INPUT_PULLUP);
				lastState_ = readState();
			}
	};
}
#endif