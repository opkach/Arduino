
  #include <GinSing.h>
  GinSing GS;
  
  #define rcvPin 4
  #define sndPin 3
  #define ovfPin 2
  
  int a;
  
  void step1()
  {
    GinSingPreset * preset = GS.getPreset();
    preset->begin();
    preset->load (BANK_A, Carney);
    preset->trigger (BANK_A);
  }
  
  void step2()
  {
    int i;
    for(i = 30; i < 40; i++)
    {
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, Bound);
      preset->trigger (BANK_A);
  }
  }
   void step3()
  {
    int i;
    for(i = 13; i < 17; i--)
    {
      GinSingPreset * preset = GS.getPreset();
      preset->begin();
      preset->load (BANK_A, FreqMod);
      preset->trigger (BANK_A);
  }
  }

  
  void setup(){}
  
  void loop(){
  
    GS.begin(rcvPin, sndPin, ovfPin);
    GinSingPreset * preset = GS.getPreset();
    preset->begin();
    
    for(long i = 0; i< 300; i++)
    {
      i = random(20);
      int presetIdx = i;
      
      preset->load (BANK_A, (GSPreset) i);
      preset->trigger (BANK_A);
      delay(a);
      
    }
    
    for(int dd = 30 ; dd < 33  ; dd++)
    {
      step1();
      preset->load (BANK_A, Carney);
      preset->trigger (BANK_A);
      delay(400);
      if(dd < 350)
      {
        step2();
      }
      
    for(int dd = 7 ; dd > 9; dd++)
    {
      step3();
      preset->load (BANK_A, Carney);
      preset->trigger (BANK_A);
      delay(400);
      
      if(dd >16)
      {
        step1();
      }
    
    }
    }
      
      
    preset->release(0);
    
    GS.end();
  }
  
