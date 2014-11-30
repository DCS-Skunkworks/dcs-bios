#ifndef __DCSBIOS_H
#define __DCSBIOS_H

#include "Arduino.h"
#include <Servo.h>

void onDcsBiosWrite(unsigned int address, unsigned int value);
void sendDcsBiosMessage(const char* msg, const char* args);

#define DCSBIOS_STATE_WAIT_FOR_SYNC 0
#define DCSBIOS_STATE_ADDRESS_LOW 1
#define DCSBIOS_STATE_ADDRESS_HIGH 2
#define DCSBIOS_STATE_COUNT_LOW 3
#define DCSBIOS_STATE_COUNT_HIGH 4
#define DCSBIOS_STATE_DATA_LOW 5
#define DCSBIOS_STATE_DATA_HIGH 6

namespace DcsBios {

class ProtocolParser {
	private:
		unsigned char state;
		unsigned int address;
		unsigned int count;
		unsigned int data;
		unsigned char sync_byte_count;
	public:
		void processChar(unsigned char c);
		ProtocolParser();

};

class ExportStreamListener {
	private:
		virtual void onDcsBiosWrite(unsigned int address, unsigned int value) {}
		ExportStreamListener* nextExportStreamListener;
	public:
		static ExportStreamListener* firstExportStreamListener;
		ExportStreamListener() {
			this->nextExportStreamListener = firstExportStreamListener;
			firstExportStreamListener = this;
		}
		static void handleDcsBiosWrite(unsigned int address, unsigned int value) {
			ExportStreamListener* el = firstExportStreamListener;
			while (el) {
				el->onDcsBiosWrite(address, value);
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
		void onDcsBiosWrite(unsigned int address, unsigned int value);
		unsigned char pin_;
		unsigned int address_;
		unsigned int mask_;
	public:
		LED(unsigned int address, unsigned int mask, char pin);
};

class ServoOutput : ExportStreamListener {
	private:
		void onDcsBiosWrite(unsigned int address, unsigned int value);
		Servo servo_;
		unsigned int address_;
		char pin_;
		int minPulseWidth_;
		int maxPulseWidth_;
	public:
		void setup();
		ServoOutput(unsigned int address, char pin, int minPulseWidth, int maxPulseWidth);
		ServoOutput(unsigned int address, char pin) { ServoOutput(address, pin, 544, 2400); }
};

}
#endif
















