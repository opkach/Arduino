
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
    
    for(int i = 1; i < 20; i++)
    {
      Serial.println(i);
      preset->load (BANK_A, PowerLines);
      preset->trigger (BANK_A); 
      a = i*z;
      delay(a*30);
      if(i ==3 | i == 15)
      {
        preset->load (BANK_A, SteamLoco);
        preset->trigger (BANK_A); 
        delay(a);
        preset->release(28);
      }  
      if(i == 9 | i == 12)
      {
        preset->load (BANK_A, Telly);
        preset->trigger (BANK_A);
        delay(a);
        preset->release(7);
      }
      for (i = 0; i < 14; i--)
      {
        preset->load (BANK_A, RandomThoughts);
        preset->trigger(BANK_A);
        delay(200);
        
        if(i == 3)
        {
        preset->load (BANK_A, SteamLoco);
        preset->trigger(BANK_A);
        delay(3000);
        
        if(i == 9)
        {
          preset->load (BANK_A, Spoles);
          preset->trigger(BANK_A);
          delay (1000);
        }
        }
      }
    }
    preset->release(0);
    
    GS.end();
  }
