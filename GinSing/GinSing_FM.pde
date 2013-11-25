
  // Christopher Konopka
  // opkach@gmail.com
  // twitter: _opkach
  // soundcloud: opkach
  
  // GinSing_FM Example
  
  // This is an example of how to perform Frequency Modulation using the GinSing module. Some of the example phrases
  //   are copied from the website since it was easier to do that then completely reword every sentence. All I did was 
  //   take apart the _5_synthmode example from ginsingsound.com and break it down into smaller sections to gain a better 
  //   understanding of the specific syntax that is used for this module. The excerpt below is the explaination of the
  //   GinSing FM function from the _5_synthmode preset.
  
  // Enjoy!
  
  // Frequency modulation allows you to change the frequency of one oscillator through the otuput of another. In each bank the #3 oscillator
  //   can be configured to frequency modulate (FM) the #1 oscillator. In this example, we create a base sinewave oscillator (1) and modulate it
  //   through the FM oscillator (3).

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
   
   waveform();                          // Waveform Function
   
   GS.end();                            // Ends the device's current action
  }
  
//===================================================================================================================================================

  void waveform()
  {
      
    s->selectBank    (BANK_A);                                // Select Bank A
    
    s->setPatch      (OSC_1_TO_MIXER | OSC_3_FRQMOD_OSC_1);   // Patch OSC_1 to mixer/Set OSC_3 to frequency modulate OSC_1
    s->setWaveform   (OSC_1, SINE);                           // Waveform Selection
    s->setFrequency  (OSC_1, 120.0f);                         // Frequency Selection
    s->setAmplitude  (OSC_1, 1.0f);                           // Volume Selection
    
    s->setWaveform   (OSC_3, SAWTOOTH);                       // Set the FM Oscillator (3) as a Sine wave
    s->setWavemode   (OSC_3, POSITIVE);                       // Set the FM Oscillator (3) to go from zero to full
    s->setFrequency  (OSC_3, 1.5f);                           // Set the FM Oscillator (3) period
    s->setAmplitude  (OSC_3, 0.8f);                           // Set the FM Oscillator (3) to the desired range of modulation
    
      delay(5000);                                            // Turn ON for 5 seconds
      
    s->setAmplitude  (OSC_1, 0.0f);                           // Set Amplitudes to zero
    s->setAmplitude  (OSC_3, 0.0f);  
       delay(1000);                                           // Turn OFF for 1 second
  }  
  
//===================================================================================================================================================

  void loop()
  {
    
  }
  
//===================================================================================================================================================
