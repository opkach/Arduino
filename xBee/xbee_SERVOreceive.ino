//receiving

#include <Servo.h>;
Servo scottServo;
int servoPin = 9;
int servoValue = 0;

void setup()
{
  Serial.begin(9600);
  scottServo.attach(9);
}

void loop()
{
if(Serial.available() > 0)
   {
  servoValue = Serial.read();
  
  scottServo.write(servoValue);
  
   }
}
