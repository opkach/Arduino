
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
    
    for(int i = 1; i < 6; i++)
    {
      Serial.println(i);
      preset->load (BANK_A, PowerLines);
      preset->trigger (BANK_A); 
      a = i*z;
      delay(a);
      if(i ==1 | i == 3)
      {
        preset->load (BANK_A, SteamLoco);
        preset->trigger (BANK_A); 
        delay(a);
        preset->release(0);
      }  
      if(i == 4)
      {
        preset->load (BANK_A, Telly);
        preset->trigger (BANK_A);
        preset->release(7);
        delay(a);
       
      }
    }
    preset->release(0);
    
    GS.end();
  }
