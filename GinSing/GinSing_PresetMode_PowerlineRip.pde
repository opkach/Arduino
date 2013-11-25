
  #include <GinSing.h>
  GinSing GS;
  
  #define rcvPin 4
  #define sndPin 3
  #define ovfPin 2
  
  int z = 100;
  int a;
  void setup(){}
  
  void loop(){
  
    GS.begin(rcvPin, sndPin, ovfPin);
    
    GinSingPreset * preset = GS.getPreset();
    preset->begin();
    
    for(int i = 1; i < 10; i++)
    {
      preset->load (BANK_A, PowerLines);
      preset->trigger (BANK_A); 
      a = i*z;
      Serial.println(a);
      delay(a);
      
    }
    preset->release(0);
    
    GS.end();
  }
