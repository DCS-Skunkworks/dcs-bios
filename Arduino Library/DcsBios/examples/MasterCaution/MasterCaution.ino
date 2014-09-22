
/*
 DCS BIOS Example: Master Caution Light
 
 This turns the LED on digital pin 13 into an A-10C master caution light.
 Adapted from the EthernetUDP example shipped with the Arduino distribution.
 */

#include <SPI.h>         // needed for Arduino versions later than 0018
#include <Ethernet.h>
#include <EthernetUdp.h>
#include <DcsBios.h>

// Enter a MAC address and IP address for your controller below.
// The IP address will be dependent on your local network:
byte mac[] = {  
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xEF };
IPAddress ip(192, 168, 1, 177);

unsigned int localPort = 7777;      // local port to listen on

// An EthernetUDP instance to let us send and receive packets over UDP
EthernetUDP Udp;

DcsBios bios;

void setup() {
  pinMode(13, OUTPUT);
  
  // start the Ethernet and UDP:
  Ethernet.begin(mac,ip);
  Udp.begin(localPort);
}

void loop() {
  // if there's data available, read a packet
  int packetSize = Udp.parsePacket();
  if(packetSize)
  {   
    for (int i=0; i<packetSize; i++) {
      bios.processChar(Udp.read());
    }
  }
}

void onDcsBiosMessage(char* msg, char* arg) {
  if (strcmp(msg, "MASTER_CAUTION") == 0) {
    if (arg[0] == '1') {
      digitalWrite(13, 1);
    } else {
      digitalWrite(13, 0); 
    }
  }
}

