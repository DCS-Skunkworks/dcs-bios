#ifndef __DCSBIOS_PROTOCOL_H
#define __DCSBIOS_PROTOCOL_H

#define DCSBIOS_STATE_WAIT_FOR_SYNC 0
#define DCSBIOS_STATE_ADDRESS_LOW 1
#define DCSBIOS_STATE_ADDRESS_HIGH 2
#define DCSBIOS_STATE_COUNT_LOW 3
#define DCSBIOS_STATE_COUNT_HIGH 4
#define DCSBIOS_STATE_DATA_LOW 5
#define DCSBIOS_STATE_DATA_HIGH 6

#include "ExportStreamListener.h"
#include "RingBuffer.h"

namespace DcsBios {

	class ProtocolParser {
		private:
			volatile unsigned char state;
			volatile unsigned int address;
			volatile unsigned int count;
			volatile unsigned int data;
			volatile unsigned char sync_byte_count;
			
			ExportStreamListener* startESL;
			RingBuffer<64> incomingDataBuffer;
			volatile bool processingData;
		public:
			void processChar(unsigned char c);
			void processCharISR(unsigned char c);
			ProtocolParser();
	};
}

#endif