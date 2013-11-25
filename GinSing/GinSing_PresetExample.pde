
  #include <GinSing.h>
  GinSing GS;
  
  #define rcvPin 4
  #define sndPin 3
  #define ovfPin 2
  
  void setup(){}
  
  void loop(){
  
     GS.begin(rcvPin, sndPin, ovfPin);
    
    GinSingPreset * preset = GS.getPreset();
    preset->begin();
    
    preset->load (BANK_A, PowerLines);
    preset->trigger (BANK_A); 
    
    delay(1000);
    
    preset->release(0);
    
    GS.end();
  }
