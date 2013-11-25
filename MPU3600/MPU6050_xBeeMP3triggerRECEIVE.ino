
#include <MP3Trigger.h>  
 
MP3Trigger trigger; // we create the trigger object
 

void setup()
{
//Serial.begin(9600);
//trigger.setup();
  //Serial.begin( MP3Trigger::serialRate() );
trigger.setup(&Serial);
   Serial.begin( MP3Trigger::serialRate() );


//  trigSerial.begin( MP3Trigger::serialRate() );
  
  // Start looping TRACK001.MP3
//   trigger.setup(&trigSerial);    
 // trigSerial.begin( MP3Trigger::serialRate() );
  
}

void loop()
{
while(Serial.available()> 5)
{
 int servoAng1 = Serial.read();
 int servoAng2 = Serial.read();
 int servoAng3 = Serial.read();
 int servoAng4 = Serial.read();
// Send the servo to the position read...  (note: you get to make this happen)
Serial.print(servoAng1);
Serial.print(", ");
Serial.print(servoAng2);
Serial.print(", ");
Serial.print(servoAng3);
Serial.print(", ");
Serial.println(servoAng4);

if(servoAng1 > 100)
{
    int rand;
    rand = random(13);
  // process signals from the trigger
  trigger.setLooping(true,rand);  
  trigger.setLooping(true,rand+1);    
  trigger.update();
  delay(50);
}
else
{
  trigger.stop();
}
delay(2);
}
}
