#ifndef __DCSBIOS_EXPORTSTREAMLISTENER_H
#define __DCSBIOS_EXPORTSTREAMLISTENER_H

#include "Arduino.h"

namespace DcsBios {
	class ExportStreamListener {
		protected:
			uint16_t firstAddressOfInterest;
			uint16_t lastAddressOfInterest;
		public:
			virtual void onDcsBiosWrite(unsigned int address __attribute__((unused)), unsigned int value __attribute__((unused))) {}
			virtual void onConsistentData() {}
			ExportStreamListener* nextExportStreamListener;
			inline uint16_t getFirstAddressOfInterest() { return firstAddressOfInterest; }
			inline uint16_t getLastAddressOfInterest() { return lastAddressOfInterest; }
			
			static ExportStreamListener* firstExportStreamListener;
			ExportStreamListener(uint16_t firstAddressOfInterest, uint16_t lastAddressOfInterest) {
				this->firstAddressOfInterest = firstAddressOfInterest & ~(0x01);
				this->lastAddressOfInterest = lastAddressOfInterest & ~(0x01);
				
				// nothing in the list? insert self as first element.
				if (firstExportStreamListener == NULL) {
					firstExportStreamListener = this;
					nextExportStreamListener = NULL;
					return;
				}
				
				// insert into list of export stream listeners,
				// keep list ordered ascending by lastAddressOfInterest, then ascending firstAddressOfInterest
				ExportStreamListener** prevNextPtr = &firstExportStreamListener;
				ExportStreamListener* nextESL = firstExportStreamListener;
				
				while (nextESL && ((nextESL->getLastAddressOfInterest() < this->lastAddressOfInterest) ||
								   (nextESL->getLastAddressOfInterest() == this->lastAddressOfInterest && nextESL->getFirstAddressOfInterest() < this->firstAddressOfInterest))) {
					prevNextPtr = &(nextESL->nextExportStreamListener);
					nextESL = nextESL->nextExportStreamListener;
				}
				this->nextExportStreamListener = nextESL;
				*prevNextPtr = this;
				
			}
			static void loopAll() {
				ExportStreamListener* el = firstExportStreamListener;
				while (el) {
					el->loop();
					el = el->nextExportStreamListener;
				}
			}
			virtual void loop() {}
	};

	class Int16Buffer : public ExportStreamListener {
		private:
			volatile unsigned int data;
			volatile unsigned char flags;
			enum FLAGS {
				DIRTY = (1<<0),
				RECEIVED_DATA_BEFORE = (1<<2)
			};
		public:
			Int16Buffer(unsigned int address) : ExportStreamListener(address, address), flags(0) {
			
			}
			virtual void onDcsBiosWrite(unsigned int address __attribute__((unused)), unsigned int data) {
				if (this->flags == 0) {
					// first update ever
					this->data = data;
					this->flags = DIRTY | RECEIVED_DATA_BEFORE;
				} else {
					// regular update, only accept if data has changed
					if (this->data != data) {
						this->data = data;
						this->flags = DIRTY | RECEIVED_DATA_BEFORE;
					}
				}
			}
			bool hasUpdatedData() { return (this->flags & DIRTY); }
			unsigned int getData() {
				uint16_t ret;
				noInterrupts();
				ret = data;
				flags &= ~(DIRTY); // clear dirty bit
				interrupts();
				
				return ret;
			}
	};
	
	class IntegerBuffer : public Int16Buffer {
		private:
			unsigned int mask;
			unsigned char shift;
			void (*callback)(unsigned int);
		public:
			IntegerBuffer(unsigned int address, unsigned int mask, unsigned char shift, void (*callback)(unsigned int)) : Int16Buffer(address) {
				this->mask = mask;
				this->shift = shift;
				this->callback = callback;
			}
			unsigned int getData() {
				return ((this->Int16Buffer::getData()) & mask) >> shift;
			}
			virtual void loop() {
				if (hasUpdatedData()) {
					if (callback) {
						callback(getData());
					}
				}
			}
	};
	
	
	template < unsigned int LENGTH >
	class StringBuffer : public ExportStreamListener {
		private:
			char receivingBuffer[LENGTH+1];
			char userBuffer[LENGTH+1];
			volatile bool receivingDirty;
			bool userDirty;
			void (*callback)(char*);
			void setChar(unsigned int index, unsigned char value) {
				// DCS-BIOS will occasionally send data even if it did not change
				if (receivingBuffer[index] == value) return;
				
				receivingBuffer[index] = value;
				receivingDirty = true;
			}
		public:
			StringBuffer(unsigned int address, void (*callback)(char*)) : ExportStreamListener(address, address+LENGTH) {
				memset(receivingBuffer, ' ', LENGTH-1);
				receivingBuffer[LENGTH] = '\0';
				userBuffer[LENGTH] = '\0';
				
				receivingDirty = false;
				userDirty = false;
				this->callback = callback;
			}
			virtual void onDcsBiosWrite(unsigned int address, unsigned int data) {
				unsigned int index = address - firstAddressOfInterest;
				setChar(index, ((char*)&data)[0] );
				index++;
				if (LENGTH > index) {
					setChar(index, ((char*)&data)[1] );
				}
			}
			virtual void onConsistentData() {
				if (receivingDirty) {
					noInterrupts();
					memcpy(userBuffer, receivingBuffer, LENGTH);
					receivingDirty = false;
					userDirty = true;
					interrupts();
				}
			}
			bool hasUpdatedData() {
				return userDirty;
			}
			char* getData() {
				userDirty = false;
				return userBuffer;
			}
			virtual void loop() {
				if (hasUpdatedData()) {
					if (callback) {
						callback(getData());
					}
				}
			}
	};

}

#endif
