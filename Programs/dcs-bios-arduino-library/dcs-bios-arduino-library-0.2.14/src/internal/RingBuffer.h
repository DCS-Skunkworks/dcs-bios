#ifndef __DCSBIOS_RINGBUFFER_H
	
namespace DcsBios {
	template<unsigned int SIZE>
	class RingBuffer {
		volatile uint8_t buffer[SIZE];
		volatile uint8_t writepos;
		volatile uint8_t readpos;
		
		public:
		RingBuffer() : writepos(0), readpos(0) {}
		volatile bool complete = false;
		__attribute__((always_inline)) void put(uint8_t c) { buffer[writepos] = c; writepos = ++writepos % SIZE; }
		__attribute__((always_inline)) bool isEmpty() { return readpos == writepos; }
		__attribute__((always_inline)) bool isNotEmpty() { return readpos != writepos; }
		__attribute__((always_inline)) uint8_t get() { uint8_t ret = buffer[readpos]; readpos = ++readpos % SIZE; return ret; }
		__attribute__((always_inline)) uint8_t getLength() { return (uint8_t)(writepos - readpos) % SIZE; }
		__attribute__((always_inline)) void clear() { readpos = 0; writepos = 0; }
	};
}

#define __DCSBIOS_RINGBUFFER_H
#endif
