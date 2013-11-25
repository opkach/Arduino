
#include <GinSing.h>
GinSing GS;

#define rcvPin 4
#define sndPin 3
#define ovfPin 2

void setup()
{
}

void loop()
{  

  GS.begin (rcvPin, sndPin, ovfPin);

  GinSingPreset * preset = GS.getPreset();
  preset->begin();

  randomSeed (500000);
  random(3);

  for(int i = 0; i < 3; i++)
  {
    if (i == 0)
    {
      
      int set0 = random (60);
      preset->load (0, (GSPreset) set0);
      preset->trigger(0);

      randDelay(); 
    }

    if (i == 1)
    { 
      int set1 = random (60);      
      preset->load(0, (GSPreset) set1);
      preset->trigger(0);

      randDelay(); 
    }

    if (i == 2)
    {
      int set2 = random (60);
      preset->load(0, (GSPreset) set2);
      preset->trigger(0);

      randDelay(); 
    }

    if (i == 3)
    {
      int set3 = random (60);      
      preset->load(0, (GSPreset) set3);
      preset->trigger(0);
      randDelay(); 
    }
  }  
}


void randDelay()
{
  int  randomdelay[10] = {
    100, 400, 600, 900, 1200, 1500, 1900, 2000, 2500, 3700};
  int r = random(4);
  int randDelay = randomdelay[r];

  delay(randDelay); 
}    

void randSet()
{
  randomSeed(500000);
  int set1 = random (60);

}

