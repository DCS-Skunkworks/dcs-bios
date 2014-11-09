#include "DcsBios.h"
#include <stdlib.h>

namespace DcsBios {

PollingInput* PollingInput::firstPollingInput = NULL;
ExportStreamListener* ExportStreamListener::firstExportStreamListener = NULL;

ProtocolParser::ProtocolParser() {
	state = 0;
	cmd_pos = 0;
	arg_pos = 0;
}

void ProtocolParser::processChar(char c) {
  
  switch(state) {
     case DCSBIOS_STATE_READ_CMD:
       if (cmd_pos == DCSBIOS_CMD_BUFFER_SIZE) {
         cmd_pos = 0;
         state = DCSBIOS_STATE_WAIT_FOR_NEWLINE;
       } else {
         if (c == ' ') {
           cmd[cmd_pos++] = '\0';
           state = DCSBIOS_STATE_READ_ARG;
           arg_pos = 0;
         } else {
           cmd[cmd_pos++] = c;
         }
       }
       break;
       
     case DCSBIOS_STATE_WAIT_FOR_NEWLINE:
       if (c == '\n') {
         state = DCSBIOS_STATE_READ_CMD;
         cmd_pos = 0;
       }
       break;
      
     case DCSBIOS_STATE_READ_ARG:
       if (arg_pos == DCSBIOS_ARG_BUFFER_SIZE) {
         arg_pos = 0;
         state = DCSBIOS_STATE_WAIT_FOR_NEWLINE;
       } else {
         if (c == '\n') {
           arg[arg_pos++] = '\0';
           cmd_pos = 0;
           state = DCSBIOS_STATE_READ_CMD;
           onDcsBiosMessage(cmd, arg);
		   ExportStreamListener::handleDcsBiosMessage(cmd, arg);
         } else {
           arg[arg_pos++] = c;
         }
       }
       break;
  }
}

ActionButton::ActionButton(char* msg, char* arg, char pin) {
	msg_ = msg;
	arg_ = arg;
	pin_ = pin;
	pinMode(pin_, INPUT_PULLUP);
	lastState_ = digitalRead(pin_);
}
void ActionButton::pollInput() {
	char state = digitalRead(pin_);
	if (state != lastState_) {
		if (lastState_ == HIGH && state == LOW) {
			sendDcsBiosMessage(msg_, arg_);
		}
	}
	lastState_ = state;
}

Switch2::Switch2(char* msg, char pin) {
	msg_ = msg;
	pin_ = pin;
	pinMode(pin_, INPUT_PULLUP);
	lastState_ = digitalRead(pin_);
}
void Switch2::pollInput() {
	char state = digitalRead(pin_);
	if (state != lastState_) {
		sendDcsBiosMessage(msg_, state == HIGH ? "0" : "1");
	}
	lastState_ = state;
}


Potentiometer::Potentiometer(char* msg, char pin) {
	msg_ = msg;
	pin_ = pin;
	pinMode(pin_, INPUT);
	lastState_ = analogRead(pin_) / 1024.0f;
}
void Potentiometer::pollInput() {
	float state = analogRead(pin_) / 1024.0f;
	if (state != lastState_) {
		char buf[7];
		dtostrf(state, 6, 4, buf);
		sendDcsBiosMessage(msg_, buf);
	}
	lastState_ = state;
}


RotarySwitch::RotarySwitch(char* msg, const byte* pins, char numberOfPins) {
	msg_ = msg;
	pins_ = pins;
	numberOfPins_ = numberOfPins;
	char i;
	for (i=0; i<numberOfPins; i++) {
		pinMode(pins[i], INPUT_PULLUP);
	}
	lastState_ = readState();
}
char RotarySwitch::readState() {
	char i;
	for (i=0; i<numberOfPins_; i++) {
		if (digitalRead(pins_[i]) == LOW) return i;
	}
	return 0;
}
void RotarySwitch::pollInput() {
	char state = readState();
	if (state != lastState_) {
		char buf[7];
		utoa(state, buf, 10);
		sendDcsBiosMessage(msg_, buf);
	}
	lastState_ = state;
}

RotaryEncoder::RotaryEncoder(const char* msg, const char* decArg, const char* incArg, char pinA, char pinB) {
	msg_ = msg;
	decArg_ = decArg;
	incArg_ = incArg;
	pinA_ = pinA;
	pinB_ = pinB;
	pinMode(pinA_, INPUT_PULLUP);
	pinMode(pinB_, INPUT_PULLUP);
	delta_ = 0;
	lastState_ = readState();
}
char RotaryEncoder::readState() {
	return (digitalRead(pinA_) << 1) | digitalRead(pinB_);
}
/*
Rotary Encoder state transitions for one step: 
3 <-> 2 <-> 0 <-> 1 <-> 3
Right: 11 (3) -> 10 (2) -> 00 (0) -> 01 (1) -> 11 (3)
Left:  11 (3) -> 01 (1) -> 00 (0) -> 10 (2) -> 11 (3)    
*/
void RotaryEncoder::pollInput() {
	char state = readState();
	switch(lastState_) {
		case 0:
			if (state == 2) delta_--;
			if (state == 1) delta_++;
			break;
		case 1:
			if (state == 0) delta_--;
			if (state == 3) delta_++;
			break;
		case 2:
			if (state == 3) delta_--;
			if (state == 0) delta_++;
			break;
		case 3:
			if (state == 1) delta_--;
			if (state == 2) delta_++;
			break;
	}
	lastState_ = state;
	
	if (delta_ == 4) {
		sendDcsBiosMessage(msg_, incArg_);
		delta_ = 0;
	}
	if (delta_ == -4) {
		sendDcsBiosMessage(msg_, decArg_);
		delta_ = 0;
	}
}

LED::LED(char* msg, char pin) {
	msg_ = msg;
	pin_ = pin;
	pinMode(pin_, OUTPUT);
	digitalWrite(pin_, LOW);
}
void LED::onDcsBiosMessage(const char* msg, const char* arg) {
	if (strcmp(msg, msg_) == 0) {
		if (arg[0] == '1') {
			digitalWrite(pin_, HIGH);
		} else {
			digitalWrite(pin_, LOW);
		}
	}
}


}