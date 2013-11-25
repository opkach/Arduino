
  #include <GinSing.h>

  GinSing GS;
  GinSingSynth *s;
  
  #define rcvPin 4
  #define sndPin 3
  #define ovfPin 2
  
  void setup()
  {
    
  }
  
  void loop()
  {
    
    int i; // counter
 
    GS.begin(rcvPin, sndPin, ovfPin);
    s = GS.getSynth();
    s->begin();
  
    for(i = 0; i < 190; i++)
    {
       s->selectBank (BANK_A);
       s->setPatch (OSC_1_TO_MIXER);
      
      int freq = Frequency(freq);   
       s->setWaveform (OSC_1, SINE);
       s->setAmplitude (OSC_1, .6f);
       s->setFrequency (OSC_1, freq*2);
   
     if (i > 180)
       {
         s->setPatch (OSC_B1_PWM_OSC_A1 | OSC_1_TO_MIXER);
         s->setWaveform(OSC_1, NOISE);
         s->setFrequency (OSC_1, 140.0f);
         s->setAmplitude(OSC_1, 0.5f);
       }
  }
    
     
    
    
    delay(1000);
    
    s->setFreqDist (OSC_1, 0.0f);
    s->setAmplitude (OSC_1, 0.0f);
    delay(1000);
  }
    
 int Frequency(int freq)
    {
     
      for(int i = 0; i < 99; i++)
      {  
       int freq;
       i = freq;
       return freq;
      }
    }
  
