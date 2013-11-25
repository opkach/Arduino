//Sending
int val = 0;
int mapVal = 0;
int potPin = 0;

void setup()
{
  Serial.begin(9600);
}
void loop()
{
  val = analogRead(0);
  mapVal = map(val,0,1023,0, 255);
  Serial.println(mapVal);
  delay(2);
}
