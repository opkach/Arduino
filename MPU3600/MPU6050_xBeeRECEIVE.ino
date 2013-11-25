
void setup()
{
Serial.begin(9600);

}

void loop()
{
while(Serial.available()> 0)
{
 float servoAng1 = Serial.read();
 float servoAng2 = Serial.read();
 float servoAng3 = Serial.read();
 float servoAng4 = Serial.read();
// Send the servo to the position read...  (note: you get to make this happen)
Serial.print(servoAng1);
Serial.print(", ");
Serial.print(servoAng2);
Serial.print(", ");
Serial.print(servoAng3);
Serial.print(", ");
Serial.println(servoAng4);

delay(2);
}
}
