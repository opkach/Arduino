
  // Christopher Konopka
  // opkach@gmail.com
  // twitter: _opkach
  // soundcloud: opkach
  
  // GinSing_SineENV Example
  
  // This is an example of how to perform ADSR to a Waveform using the GinSing module. Some of the example phrases
  //   are copied from the website since it was easier to do that then completely reword every sentence. All I did was 
  //   take apart the _5_synthmode example from ginsingsound.com and break it down into smaller sections to gain a better 
  //   understanding of the specific syntax that is used for this module. The excerpt below is the explaination of the
  //   GinSing FM function from the _5_synthmode preset.
  
  // Enjoy!
  
  // ADSR is an acronym for [A]ttack, [D]ecay, [S]ustain, [R]elease. You can make any oscillator use ADSR whenever you use the trigger()/release()
  // methods. You can also use ADSR on each of the two bank mixers in the GinSingMaster class. ADSR is a time-based volume control, often called
  // an envelope. When you first call trigger(), the envelope will start at zero volume and proceed to an initial amplitude over a specified
  // amount of time. These two initial values are called attack time, and attack Amplitude. After the attack time has finished, the decay amplitude
  // stage begins over the specified decay time. Likewise, after the decay stage has completed, you enter the sustain stage. The sustain stage is
  // unique in that it will hold the the decay ampltidue until you call release() and therefore has no actual time or amplitude value. When you do 
  // call release(), you transition into the release stage and move towards the release value over the course of the release time. This 4 stage 
  // amplitude envelope can be used to simulate amplitude variations commonly found in real world oscilations, such as plucked strings, percussive
  // instruments, and so on. Note that when you use envelopes you can't specify the output amplitude as in the previous examples.

//=================================================================================================================================================== 

  // Header File
  #include <GinSing.h>
  
  GinSing GS;       // This class is created to access all of the data that is supplied from the module
  GinSingSynth *s;  // This pointer points to the synth mode interface
  
  #define rcvPin 4  // Receiving pin (4 or 12)
  #define sndPin 3  // Transmitting pin (3 or 11)
  #define ovfPin 2  // Overflow control pin (2 or 10)
 
//===================================================================================================================================================
 
  void setup()
  {
   
    GS.begin(rcvPin, sndPin, ovfPin);   // Start device
   
   s = GS.getSynth();                   // This part fetches the synth mode interface
   s->begin ();                         // Synth Mode begins
   
                          // Waveform Function
   
   GS.end();                            // Ends the device's current action
  }
  
//===================================================================================================================================================

  
  
//===================================================================================================================================================

  void loop()
  {
       waveform();
  }
  
//===================================================================================================================================================
void waveform()
       {
    s->selectBank    (BANK_A);                                          // Select Bank A
    s->setPatch      (OSC_1_TO_MIXER);                                  // Send OSC_1 to the mixer
    
    s->setFrequency  (OSC_1, 120.0f);                                   // Select Frequency
    s->setAmplitude  (OSC_1, 1.0f);                                     // Select Amplitude
    s->setWaveform   (OSC_1, SINE);                                     // Select Waveform

    s->setEnvelope  ( OSC_1 ,                                           // Set Envelope for the chosen Oscillator
                    /* ATTACK  */  AT_800MS , 0.2f ,                    // Attack Parameter based on milliseconds (reach .2 Volume in 800 milliseconds
                    /* DECAY   */  DR_2MS   , 0.6f ,                    // Decay Parameter (drop amplitude 60% Volume in 575 milliseconds)
                    /* SUSTAIN */                                       // Sustain Parameter (No parameters needed - just sustain the decay value until released)
                    /* RELEASE */  DR_10MS  , 0.8f );                   // Release Parameter (fade out to 80% volumed in 10 milliseconds
      
    for(int  loopIdx = 0; loopIdx < 4; loopIdx++)                       // Use a for loop to reinterate the sound
      {
        
        s->trigger(OSC_1);                                              // Start to trigger the sound
          delay(1000);                                                  
        
        s->release(OSC_1);                                              // Start the release stage
          delay(500);                                                   
      }
      
 
    s->setAmplitude  (OSC_1, 0.0f);                                     // Turn OFF for 1 second
       delay(1000);
  }  
