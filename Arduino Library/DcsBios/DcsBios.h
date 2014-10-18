#ifndef __DCSBIOS_H
#define __DCSBIOS_H

#include "Arduino.h"

void onDcsBiosMessage(const char* msg, const char* args);
void sendDcsBiosMessage(const char* msg, const char* args);

#define DCSBIOS_CMD_BUFFER_SIZE 64
#define DCSBIOS_ARG_BUFFER_SIZE 64

#define DCSBIOS_STATE_READ_CMD 0
#define DCSBIOS_STATE_WAIT_FOR_NEWLINE 1
#define DCSBIOS_STATE_READ_ARG 2

namespace DcsBios {

class ProtocolParser {
	private:
		unsigned char state;
		char cmd[DCSBIOS_CMD_BUFFER_SIZE];
		char arg[DCSBIOS_ARG_BUFFER_SIZE];
		unsigned char cmd_pos;
		unsigned char arg_pos;
	public:
		void processChar(char c);
		ProtocolParser();

};

class ExportStreamListener {
	private:
		virtual void onDcsBiosMessage(const char* msg, const char* args);
		ExportStreamListener* nextExportStreamListener;
	public:
		static ExportStreamListener* firstExportStreamListener;
		ExportStreamListener() {
			this->nextExportStreamListener = firstExportStreamListener;
			firstExportStreamListener = this;
		}
		static void handleDcsBiosMessage(const char* cmd, const char* args) {
			ExportStreamListener* el = firstExportStreamListener;
			while (el) {
				el->onDcsBiosMessage(cmd, args);
				el = el->nextExportStreamListener;
			}
		}
};

class PollingInput {
	private:
		virtual void pollInput();
		PollingInput* nextPollingInput;
	public:
		static PollingInput* firstPollingInput;
		PollingInput() {
			this->nextPollingInput = firstPollingInput;
			firstPollingInput = this;
		}
		static void pollInputs() {
			PollingInput* pi = firstPollingInput;
			while (pi) {
				pi->pollInput();
				pi = pi->nextPollingInput;
			}
		}
};

class ActionButton : PollingInput {
	private:
		void pollInput();
		char* msg_;
		char* arg_;
		char pin_;
		char lastState_;
	public:
		ActionButton(char* msg, char* arg, char pin);
};

class Switch2 : PollingInput {
	private:
		void pollInput();
		char* msg_;
		char pin_;
		char lastState_;
	public:
		Switch2(char* msg, char pin);
};

class RotarySwitch : PollingInput {
	private:
		void pollInput();
		char* msg_;
		const byte* pins_;
		char numberOfPins_;
		char lastState_;
		char readState();
	public:
		RotarySwitch(char* msg_, const byte* pins, char numberOfPins);
};

class Potentiometer : PollingInput {
	private:
		void pollInput();
		char* msg_;
		char pin_;
		float lastState_;
	public:
		Potentiometer(char* msg, char pin);
};

class RotaryEncoder : PollingInput {
	private:
		void pollInput();
		char readState();
		const char* msg_;
		const char* decArg_;
		const char* incArg_;
		char pinA_;
		char pinB_;
		char lastState_;
		signed char delta_;
	public:
		RotaryEncoder(const char* msg, const char* decArg, const char* incArg, char pinA, char pinB);	
};

class LED : ExportStreamListener {
	private:
		void onDcsBiosMessage(const char* msg, const char* args);
		char* msg_;
		char pin_;
	public:
		LED(char* msg, char pin);
};

}
#endif
















