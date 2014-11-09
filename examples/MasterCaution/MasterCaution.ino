#include <DcsBios.h>

/* Instantiate a ProtocolParser object to parse the DCS-BIOS export stream */
DcsBios::ProtocolParser parser;

/* Declare a Master Caution Reset button on pin 10 */
DcsBios::Switch2 masterCautionBtn("UFC_MASTER_CAUTION", 10);
/* Make the LED connected to pin 13 into a Master Caution Light */
DcsBios::LED masterCautionLED("MASTER_CAUTION", 13);

void setup() {
  Serial.begin(500000);
}

/*
Your main loop needs to pass data from the DCS-BIOS export
stream to the parser object you instantiated above.

It also needs to call DcsBios::PollingInput::pollInputs()
to detect changes in the state of connected controls and
pass them on to DCS.
*/
void loop() {
  // feed incoming data to the parser
  while (Serial.available()) {
      parser.processChar(Serial.read());
  }
  
  // poll inputs
  DcsBios::PollingInput::pollInputs();
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
  Serial.write(msg);
  Serial.write(' ');
  Serial.write(arg);
  Serial.write('\n');
}

/*
This subroutine gets called every time a message is received
from the export stream (you need to define it even if it
does nothing).

Use this to handle outputs which are not covered by the
DcsBios Arduino library (e.g. displays).
*/
void onDcsBiosMessage(const char* msg, const char* arg) {
  
}
