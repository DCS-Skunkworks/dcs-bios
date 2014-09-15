#ifndef __DCSBIOS_H
#define __DCSBIOS_H

#include "Arduino.h"

void onDcsBiosMessage(char* msg, char* args);

#define DCSBIOS_CMD_BUFFER_SIZE 64
#define DCSBIOS_ARG_BUFFER_SIZE 64

#define DCSBIOS_STATE_READ_CMD 0
#define DCSBIOS_STATE_WAIT_FOR_NEWLINE 1
#define DCSBIOS_STATE_READ_ARG 2

class DcsBios {
	private:
		unsigned char state;
		char cmd[DCSBIOS_CMD_BUFFER_SIZE];
		char arg[DCSBIOS_ARG_BUFFER_SIZE];
		unsigned char cmd_pos;
		unsigned char arg_pos;
	public:
		void processChar(char c);
		DcsBios();
};

#endif