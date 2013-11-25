
  #include <GinSing.h>
  GinSing GS;
  
  #define rcvPin 4
  #define sndPin 3
  #define ovfPin 2
  
  int a;
  
  void step1()
  {
    int i;
    for(i = 10; i < 17; i++)
    {
      i = RandomThoughts; 
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, (GSPreset) i);
      preset->trigger (BANK_A);
    }
  }
  
  void step2()
  {
    int i;
    for(i = 4; i < 40; i++)
    {
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, Squaba);
      preset->trigger (BANK_A);
  }
  }
   void step3()
  {
    int i;
    for(i = 4; i < 17; i--)
    {
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, PowerLines);
      preset->trigger (BANK_A);
  }
  }
  
  void step4()
  {
    int i;
    for(i = 90; i < 102; i--)
    {
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, Siren);
      preset->trigger (BANK_A);
  }
  }

  
  void setup(){}
  
  void loop(){
  
    GS.begin(rcvPin, sndPin, ovfPin);
    GinSingPreset * preset = GS.getPreset();
    preset->begin();
    
    for(long i = 0; i< 14; i++)
    {
      i = random(3);
      int presetIdx = i;
      
      preset->load (BANK_A, (GSPreset) i);
      preset->trigger (BANK_A);
      delay(a);
      
    }
    
    for(int dd = 4 ; dd < 9  ; dd++)
    {
      step1();
      preset->load (BANK_A, Carney);
      preset->trigger (BANK_A);
      delay(50);
      if(dd > 8 )
      {
        step2();
      }
      
    for(int dd = 7 ; dd > 9; dd++)
    {
      step3();
      preset->load (BANK_A, SteamLoco);
      preset->trigger (BANK_A);
      delay(400);
      
      if(dd >16)
      {
        step1();
      }
    
    }
    for(int dd = 29 ; dd < 49; dd++)
    {
      
      step4();
      preset->load (BANK_A, Siren);
      preset->trigger (BANK_A);
      delay(1400);
     dd = random(49);
      if(dd >16)
      {
        step3();
      }
    }
   
    }
      
      
    preset->release(0);
    
    GS.end();
  }
  
