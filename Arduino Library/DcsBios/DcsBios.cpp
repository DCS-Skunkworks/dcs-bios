#include "DcsBios.h"

DcsBios::DcsBios() {
	state = 0;
	cmd_pos = 0;
	arg_pos = 0;
}

void DcsBios::processChar(char c) {
  
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
         } else {
           arg[arg_pos++] = c;
         }
       }
       break;
  }
}