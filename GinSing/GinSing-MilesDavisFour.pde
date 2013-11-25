  
  #include <GinSing.h>
  GinSing GS;
  
  #define rcvPin  4
  #define sndPin  3
  #define ovfPin  2
  
  void setup()
  {
    
    GS.begin(rcvPin, sndPin, ovfPin);
    
    GinSingPoly * poly = GS.getPoly();
    poly->begin ();
 
 // This is where you define the name of each voice (0-5) you will be using
    #define TRUMP1 0
    #define TRUMP2 1   
    #define TRUMP3 2
    #define TRUMP4 3
 
 // How many notes with be in the specified array that is described below
    #define Trump1 68
    #define Trump2 66
    #define Trump3 64
    #define Trump4 64
    
    GSNote trump1[Trump1] = {C_0, C_0, C_0, C_0, C_0, AS_3, C_4, DS_4, C_0, AS_3, C_4, DS_4, C_0, AS_3, C_4, DS_4, C_0, F_4, DS_4, D_4, D_4, AS_3, C_4, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, C_0, DS_4, F_4, G_4, C_0, DS_4, F_4, G_4, C_0, DS_4, F_4, G_4, C_0, AS_5, GS_5, G_4, C_0, DS_4, F_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, C_0, C_0, C_0, C_0, F_4, G_4, GS_4, A_5};  
    GSNote trump2[Trump2] = {AS_5, AS_5, AS_5, AS_5, DS_4, G_4, AS_5, B_5, C_0, DS_4, DS_4, DS_4, DS_5, DS_5, DS_5, DS_5, C_0, C_5, C_5, C_5, AS_5, AS_5, GS_4, G_4, G_4, G_4, G_4, G_4, C_0, F_4, G_4, GS_4, AS_4, AS_4, AS_4, AS_4, DS_4, G_4, AS_5, B_5, B_5, B_5, E_4, DS_4, DS_4, DS_4, DS_4, DS_4, C_0, C_5, C_5, C_5, AS_5, AS_5, GS_4, G_4, C_0, C_0, C_0, C_0, C_0, AS_3, C_4, D_4};
    GSNote trump3[Trump3] = {AS_4, C_4, DS_4, C_0, AS_4, C_4, DS_4, C_0, AS_4, C_4, DS_4, C_0, F_4, DS_4, DS_4, D_4, AS_4, C_4, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, C_0, DS_4, F_4, G_4, C_0, DS_4, F_4, G_4, C_0, DS_4, F_4, G_4, C_0, AS_5, GS_5, G_4, C_0, DS_4, F_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, FS_4, C_0, C_0, C_0, C_0, F_4, G_4, GS_4, A_4}; 
    GSNote trump4[Trump4] = {AS_5, AS_5, AS_5, AS_5, DS_4, G_4, AS_5, B_5, C_0, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, CS_4, C_0, C_5, C_5, C_5, AS_5, AS_5, GS_4, G_4, G_4, G_4, G_4, G_4, C_0, F_4, G_4, GS_4, AS_5, AS_5, G_4, AS_5, B_5, E_4, DS_4, DS_4, C_5, C_5, GS_4, F_4, D_5, D_5, AS_5, DS_5, F_5, F_5, F_5, F_5, AS_4, AS_4, AS_4, AS_4, DS_4, DS_4, DS_4, DS_4, DS_4, DS_4, DS_4, DS_4};
    for(int loopcyc = 0; loopcyc < 1; loopcyc++)
    {
      for(int notedx = 0; notedx < 68; notedx++)
      {
        
        poly->setNote(TRUMP1, trump1[notedx]);
        poly->trigger(TRUMP1);
        
        delay(250);  // wait 1/4 second before the next note
       
      }
       for(int notedx = 1; notedx < 66; notedx++)
      {
        
        poly->setNote(TRUMP2, trump2[notedx]);
        poly->trigger(TRUMP2);
        
        delay(250);  // wait 1/4 second before the next note
      }
     for(int notedx = 2; notedx < 64; notedx++)
      {
        
        poly->setNote(TRUMP3, trump3[notedx]);
        poly->trigger(TRUMP3);
        
        delay(250);  // wait 1/4 second before the next note
      }  
      for(int notedx = 3; notedx < 64; notedx++)
      {
        
        poly->setNote(TRUMP4, trump4[notedx]);
        poly->trigger(TRUMP4);
        
        delay(250);  // wait 1/4 second before the next note
      }      


    }
  
  delay(400);
  GS.end();
  }
  
  void loop() {}
