
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
  
    for(i = 0; i < 220; i++)
    {
       s->selectBank (BANK_A);
       s->setPatch (OSC_1_TO_MIXER);
      
      int freq = Frequency(freq);   
       s->setWaveform (OSC_1, SINE);
       s->setAmplitude (OSC_1, .6f);
       s->setFrequency (OSC_1, freq*.043);
       
       s->setEnvelope(OSC_1, AT_5600MS, 1.0f, DR_1500MS, 0.8f, DR_2785MS, 0.5f);
       s->trigger(OSC_1);
       s->release(OSC_1);

     if (i > 170)
       {
         s->setPatch (OSC_2_TO_MIXER | OSC_3_FRQMOD_OSC_1);
         
         s->setWaveform(OSC_2, NOISE);
         s->setFrequency (OSC_2, 320.0f);
         s->setAmplitude (OSC_2, 0.3f);
         
         s->setEnvelope(OSC_2, AT_11200MS, 1.0f, DR_1500MS, 0.8f, DR_4873MS, 0.5f);
         s->trigger(OSC_2);
         s->release(OSC_2);   
         
         s->setWaveform(OSC_3, SAWTOOTH);
         s->setWavemode(OSC_3, POSITIVE);
       
         int ramp = Ramp(ramp);
         s->setFrequency (OSC_3, ramp*2.9);
         s->setAmplitude(OSC_3, 1.0f); 
         
       }
     if (i < 50)
     { 
       for(i = 0; i < 90; i++)
       { 
         s->setWaveform(OSC_1, SAWTOOTH);
         s->setAmplitude (OSC_1, .6f);
         s->setFrequency (OSC_1, i*.9);
         s->setEnvelope(OSC_1, AT_250MS, .6f, DR_1500MS, 0.8f, DR_1500MS, 0.9f);
         s->trigger(OSC_1);
         s->release(OSC_1);
       }
         s->setAmplitude (OSC_1, 0.6f);
         s->setAmpRamp (OSC_1, 0.4f);
     }
  }
    
    s->setFreqDist (OSC_1, 0.9f);
    s->setAmplitude (OSC_1, 0.6f);
    delay(1000);
  }

 int Frequency(int freq)
    { 
      for(int i = 66; i < 129; i++)
      {  
       int freq;
       i = freq;
       return freq;
      }
    }
    
 int Ramp(int ramp)
 {
   for(int i = 0; i > 60; i++)
    {
     int ramp;
     i = ramp;
     return ramp;
    }
 } 
  
