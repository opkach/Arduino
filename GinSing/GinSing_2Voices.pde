#include <GinSing.h>
GinSing GS;

#define rcvPin 4
#define sndPin 3
#define ovfPin 2

GinSingVoice * voice = 0x0;

void setup()
{}

void loop()
{
  GS.begin(rcvPin, sndPin, ovfPin);
  voice = GS.getVoice();
  voice->begin();
  
  umbrella();
  delay(100);
  turtle();
  delay(100);

}


void turtle()
{
  for(int i =0; i <1; i++)
{
  GSAllophone umbrella[] = {_T, _ER, _T, _LE};
    float freqHz = 250;
    voice -> setFrequency (freqHz);
    voice -> speak (umbrella);
    delay (voice -> getMillis(umbrella));
  }
  GSAllophone shutup[] = {_PA1, _ENDPHRASE};
  voice->speak (shutup);
  
  while (!GS.isReady()) delay (1);
  delay(1000);
  
  voice->begin();
}
  
void umbrella()
{
  
for(int i =0; i <1; i++)
{
  GSAllophone umbrella[] = {_U, _M, _OB, _R, _E, _LO, _U};
     float freqHz = 300;
    voice -> setFrequency (freqHz);
    voice -> speak (umbrella);
    delay (voice -> getMillis(umbrella));
  }
  GSAllophone shutup[] = {_PA1, _ENDPHRASE};
  voice->speak (shutup);
  
  while (!GS.isReady()) delay (1);
  delay(1000);
  
  voice->begin();


}

