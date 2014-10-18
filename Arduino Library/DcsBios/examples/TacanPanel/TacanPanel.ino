#include <DcsBios.h>
#include <Wire.h>
#include <LedControl.h>

DcsBios::ProtocolParser parser;

DcsBios::Switch2 tacanTestButton("TACAN_TEST_BTN", A6);
DcsBios::ActionButton xyToggleButton("TACAN", "XY", 9);
byte modeSelectorPins[] = {2,3,4,5,6};
DcsBios::RotarySwitch modeSelector("TACAN_MODE", modeSelectorPins, 5);
DcsBios::Potentiometer volumeKnob("TACAN_VOL", A0);
DcsBios::RotaryEncoder khzKnob("TACAN", "-1", "+1", A1, A2);
DcsBios::RotaryEncoder mhzKnob("TACAN", "-10", "+10", 7, 8);
DcsBios::LED tacanTestLED("TACAN_TEST", A3);


LedControl lc=LedControl(11,12,10,1);

void setup() {
  Serial.begin(500000);
  Wire.begin(9);
  
  lc.shutdown(0,false);
  lc.setIntensity(0,8);
  lc.clearDisplay(0); 
  
  lc.setDigit(0,0,8,false);
  lc.setDigit(0,1,5,false);
  lc.setDigit(0,2,5,false);
  lc.setDigit(0,3,4,false);
}

void loop() {
  while(Serial.available()) {
    parser.processChar(Serial.read());
  }
  
  DcsBios::PollingInput::pollInputs();
}

void onDcsBiosMessage(const char* msg, const char* arg) {
  if (strcmp(msg, "TACAN_CHANNEL") == 0) {
    lc.setChar(0, 0, arg[0], false);
    lc.setChar(0, 1, arg[1], false);
    lc.setChar(0, 2, arg[2], false);
    if (arg[3] == 'X') {
      lc.setDigit(0, 3, 4, false);
    } else {
      lc.setChar(0, 3, ' ', false);
      lc.setLed(0, 3, 1, true);
      lc.setLed(0, 3, 2, true);
      lc.setLed(0, 3, 6, true);
    }
  }
}

void sendDcsBiosMessage(const char* msg, const char* arg) {
  Wire.beginTransmission(8);
  Wire.write(msg);
  Wire.write(' ');
  Wire.write(arg);
  Wire.write('\n');
  Wire.endTransmission();  
}
