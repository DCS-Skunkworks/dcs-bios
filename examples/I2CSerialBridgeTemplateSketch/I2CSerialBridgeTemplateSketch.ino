#include <DcsBios.h>
#include <Servo.h>
#include <Wire.h>

/**** Note that you can only add outputs (LEDs, etc) 
      to the Arduino running this sketch.
      Inputs will not work. ****/
/**** Make your changes after this line ****/



/**** In most cases, you do not have to change anything below this line ****/

/* Instantiate a ProtocolParser object to parse the DCS-BIOS export stream */
DcsBios::ProtocolParser parser;

void setup() {
  Serial.begin(500000);
  Wire.begin(8);
  Wire.onReceive(onI2CReceive);
}

void onI2CReceive(int num_bytes) {
   while (Wire.available()) {
      Serial.write(Wire.read());
   }
}

/*
Your main loop needs to pass data from the DCS-BIOS export
stream to the parser object you instantiated above.

*/
void loop() {
  // feed incoming data to the parser
  while (Serial.available()) {
      parser.processChar(Serial.read());
  }
  
  // don't bother polling inputs
  // because we don't support them in this sketch
  // anyway (see sendDcsBiosMessage()).
}

/*
You need to define
void sendDcsBiosMessage(const char* msg, const char* arg)
so that the string msg, followed by a space, the string arg
and a newline gets sent to the DCS-BIOS import stream.

In this example we send it to the serial port, so you need to
run socat to read the data from the serial port and send it
over UDP to DCS-BIOS.

If you are using an Ethernet Shield, you would probably want
to send a UDP packet from this subroutine.
*/
void sendDcsBiosMessage(const char* msg, const char* arg) {
    // we refuse to send anything, because any transmission
    // attempt could be interrupted by a message from the
    // I2C bus, which would corrupt both messages.
    
    // This means the Arduino running this sketch can
    // only be used for outputs, not inputs.
}

/*
This subroutine gets called every time a message is received
from the export stream (you need to define it even if it
does nothing).

Use this to handle outputs which are not covered by the
DcsBios Arduino library (e.g. displays).
*/
void onDcsBiosWrite(unsigned int address, unsigned int value) {

}

