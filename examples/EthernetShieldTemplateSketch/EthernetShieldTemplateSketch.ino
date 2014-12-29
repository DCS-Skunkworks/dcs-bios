#include <DcsBios.h>
#include <Servo.h>
#include <SPI.h>         // needed for Arduino versions later than 0018
#include <Ethernet.h>
#include <EthernetUdp.h>

/****
Change these values to the IP address to assign to your Arduino
and the IP address of your DCS computer.

Make sure that the IP address you assign to your Arduino is on
the same network as your DCS host. If you make sure that the first
three numbers are the same, you should be fine.

You will also edit BIOSConfig.lua to send a copy of the export data
to the IP address of your Arduino.
****/
IPAddress arduinoIpAddress(192, 168, 1, 177);
IPAddress dcsHost(192, 168, 1, 2);

// Enter a MAC address for your controller below.
byte mac[] = {  
  0xDE, 0xAD, 0xBE, 0xEF, 0xDC, 0xB0 };

/**** Make your changes after this line ****/




/**** In most cases, you do not have to change anything below this line ****/

/* Instantiate a ProtocolParser object to parse the DCS-BIOS export stream */
DcsBios::ProtocolParser parser;

/* Create an instance of the Udp class */
EthernetUDP Udp;

void setup() {
  Ethernet.begin(mac, arduinoIpAddress);
  Udp.begin(7777);
}

/*
Your main loop needs to pass data from the DCS-BIOS export
stream to the parser object you instantiated above.

It also needs to call DcsBios::PollingInput::pollInputs()
to detect changes in the state of connected controls and
pass them on to DCS.
*/
void loop() {
  // if there's data available, read a packet
  int packetSize = Udp.parsePacket();
  if(packetSize)
  {   
    for (int i=0; i<packetSize; i++) {
      parser.processChar(Udp.read());
    }
  }
  
  // poll inputs
  DcsBios::PollingInput::pollInputs();
}

/*
You need to define
void sendDcsBiosMessage(const char* msg, const char* arg)
so that the string msg, followed by a space, the string arg
and a newline gets sent to the DCS-BIOS import stream.

In this example we send it to the DCS computer in a UDP packet.
*/
void sendDcsBiosMessage(const char* msg, const char* arg) {
  Udp.beginPacket(dcsHost, 7778);
  Udp.write(msg);
  Udp.write(' ');
  Udp.write(arg);
  Udp.write('\n');
  Udp.endPacket();
}

/*
This subroutine gets called every time new data is received
from the export stream (you need to define it even if it
does nothing).

Use this to handle integer outputs which are not covered by the
DcsBios Arduino library.
*/
void onDcsBiosWrite(unsigned int address, unsigned int value) {

}

