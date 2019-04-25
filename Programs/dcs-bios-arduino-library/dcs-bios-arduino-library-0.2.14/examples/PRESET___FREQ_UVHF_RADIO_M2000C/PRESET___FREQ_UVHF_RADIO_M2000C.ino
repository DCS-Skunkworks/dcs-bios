
/*
  Tell DCS-BIOS to use a serial connection and use the default Arduino Serial
  library. This will work on the vast majority of Arduino-compatible boards,
  but you can get corrupted data if you have too many or too slow outputs
  (e.g. when you have multiple character displays), because the receive
  buffer can fill up if the sketch spends too much time updating them.
  
  If you can, use the IRQ Serial connection instead.
*/
#define DCSBIOS_DEFAULT_SERIAL

#include "DcsBios.h"
#include <LedControl.h> //on inclus la librairie pour commander le MAX7219


/*display declaration 
 pin 10 is connected to the DataIn 
 pin 11 is connected to the CLK 
 pin 12 is connected to LOAD 
 to one MAX7219
*/
LedControl lc=LedControl(10,11,12,1);

void onUvhfTensPresetChange(unsigned int vhfTens) {
unsigned int tens;
if (vhfTens == 0){tens=0;}
else if (vhfTens == 6553){tens=1;}
else if (vhfTens == 13107){tens=2;}
lc.setDigit(0,5,tens,false);
}
DcsBios::IntegerBuffer uvhfTensPresetBuffer(0x6120, 0xffff, 0, onUvhfTensPresetChange);


void onUvhfOnesPresetChange(unsigned int vhfOnes) {
unsigned int ones;
if (vhfOnes == 0){ones=0;}
else if (vhfOnes == 6553){ones=1;}
else if (vhfOnes == 13107){ones=2;}
else if (vhfOnes == 19660){ones=3;}
else if (vhfOnes == 26214){ones=4;}
else if (vhfOnes == 32767){ones=5;}
else if (vhfOnes == 39321){ones=6;}
else if (vhfOnes == 45874){ones=7;}
else if (vhfOnes == 52428){ones=8;}
else if (vhfOnes == 58981){ones=9;}
lc.setDigit(0,6,ones,false);
}
DcsBios::IntegerBuffer uvhfOnesPresetBuffer(0x611e, 0xffff, 0, onUvhfOnesPresetChange);


/* Fonctions pour les encodeurs */
DcsBios::RotaryEncoder uvhfPresetKnob("UVHF_PRESET_KNOB", "DEC", "INC", 6, 7);


void onVhfFrequencyChange(char* newValue) {
  char hundredths = newValue[0];
  char tenths = newValue[1];
  char ones = newValue[2];
  char tens = newValue[3];
  char hundreds = newValue[4];

  lc.setChar(0,0,hundredths,false);
  lc.setChar(0,1,tenths,false);
  lc.setChar(0,2,ones,true);
  lc.setChar(0,3,tens,false);
  lc.setChar(0,4,hundreds,false);
}
DcsBios::StringBuffer<6> vhfFrequencyBuffer(0x6122, onVhfFrequencyChange);

void setup() {
  DcsBios::setup();
  lc.shutdown(0, false);
  lc.setIntensity(0,9); 
}

void loop() {
  DcsBios::loop();
}

