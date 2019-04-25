
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



/* Fonction permettant la récupération et l'affichage du preset selectionné sur la radio UHF */
void onUhfPresetChange(unsigned int uhfPresetValue) {
unsigned int firstDigit;
unsigned int secondDigit;
if (uhfPresetValue == 0){firstDigit=0;secondDigit=1;}
else if (uhfPresetValue == 6553){firstDigit=0;secondDigit=2;}
else if (uhfPresetValue == 9830){firstDigit=0;secondDigit=3;}
else if (uhfPresetValue == 13107){firstDigit=0;secondDigit=4;}
else if (uhfPresetValue == 16383){firstDigit=0;secondDigit=5;}
else if (uhfPresetValue == 19660){firstDigit=0;secondDigit=6;}
else if (uhfPresetValue == 22937){firstDigit=0;secondDigit=7;}
else if (uhfPresetValue == 26214){firstDigit=0;secondDigit=8;}
else if (uhfPresetValue == 29490){firstDigit=0;secondDigit=9;}
else if (uhfPresetValue == 32767){firstDigit=1;secondDigit=0;}
else if (uhfPresetValue == 36044){firstDigit=1;secondDigit=1;}
else if (uhfPresetValue == 39321){firstDigit=1;secondDigit=2;}
else if (uhfPresetValue == 42597){firstDigit=1;secondDigit=3;}
else if (uhfPresetValue == 45874){firstDigit=1;secondDigit=4;}
else if (uhfPresetValue == 49151){firstDigit=1;secondDigit=5;}
else if (uhfPresetValue == 52428){firstDigit=1;secondDigit=6;}
else if (uhfPresetValue == 55704){firstDigit=1;secondDigit=7;}
else if (uhfPresetValue == 58981){firstDigit=1;secondDigit=8;}
else if (uhfPresetValue == 62258){firstDigit=1;secondDigit=9;}
else if (uhfPresetValue == 65535){firstDigit=2;secondDigit=0;}

lc.setDigit(0,5,firstDigit,false);
lc.setDigit(0,6,secondDigit,false); 
}

DcsBios::IntegerBuffer uhfPresetBuffer(0x6128, 0xffff, 0, onUhfPresetChange);

/* Fonctions pour les encodeurs */
DcsBios::RotaryEncoder uhfPresetKnob("UHF_PRESET_KNOB", "DEC", "INC", 6, 7);


void onUhfFrequencyChange(char* newValue) {
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
DcsBios::StringBuffer<6> uhfFrequencyBuffer(0x612a, onUhfFrequencyChange);

void setup() {
  DcsBios::setup();
  lc.shutdown(0, false);
  lc.setIntensity(0,9); 
}

void loop() {
  DcsBios::loop();
}

