#include <Wire.h>
#include <LiquidCrystal_I2C.h>
LiquidCrystal_I2C lcd(0x27, 16, 2);
char mystr[100];
const int InpingPin = 13;
int IninPin = 12;
const int OutpingPin = 11;
int OutinPin = 10;

const int CLK =  3;
int buzzer = 4;
int RED = A0;
int YELLOW = A2;
int GREEN = A1;
const int inout =  5;
int state = LOW;

int tmp, now = 0, MAX = 0, i, lastnow = 0, lastmax = 0;
int Incheck = 0, Outcheck = 0, Inlastcheck = 0, Outlastcheck = 0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  pinMode(buzzer, OUTPUT);
  lcd.begin();
  lcd.backlight();
  lcd.setCursor(0, 0);
  lcd.print("<<OUT CLSDA IN>>");
}

void loop()
{
  //      Update CM Ultrasonic
  long Induration, Outduration, Incm, Outcm;
  pinMode(InpingPin, OUTPUT);
  digitalWrite(InpingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(InpingPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(InpingPin, LOW);
  pinMode(IninPin, INPUT);
  Induration = pulseIn(IninPin, HIGH);
  Incm = microsecondsToCentimeters(Induration);

  pinMode(OutpingPin, OUTPUT);
  digitalWrite(OutpingPin, LOW);
  delayMicroseconds(2);
  digitalWrite(OutpingPin, HIGH);
  delayMicroseconds(5);
  digitalWrite(OutpingPin, LOW);
  pinMode(OutinPin, INPUT);
  Outduration = pulseIn(OutinPin, HIGH);
  Outcm = microsecondsToCentimeters(Outduration);

  // update Incheck
  if (Incm <= 20) {
    Incheck = 1;
  } else if (Incm > 400) {
  }
  else {
    Incheck = 0;
  }
  // update Outcheck
  if (Outcm <= 20) {
    Outcheck = 1;
  } else if (Outcm > 400) {
  }
  else {
    Outcheck = 0;
  }

  // send clk for in,out
  if (Incheck == 1 && Inlastcheck == 0 && now < MAX) {
    Serial.print("U");
    digitalWrite(buzzer, LOW);
  }
  if (Outcheck == 1 && Outlastcheck == 0 && now > 0) {
    Serial.print("D");
    digitalWrite(buzzer, LOW);
  }

  // Update Lastcheck
  //  if (Incheck == 1) {
  //    Inlastcheck = 3;
  //  } else if (Inlastcheck > 0) {
  //    Inlastcheck--;
  //  }
  //  if (Outcheck == 1) {
  //    Outlastcheck = 3;
  //  } else if (Outlastcheck > 0) {
  //    Outlastcheck--;
  //  }

  Inlastcheck = Incheck;
  Outlastcheck = Outcheck;
  // Update Now/Max From FPGA
  Uartcom();
  // Show change data to LCD
  if ((now != lastnow) || (MAX != lastmax)) {
    lcd.setCursor(0, 1);
    lcd.print("                ");
    lcd.setCursor(0, 1);
    lcd.print(" NOW ");
    lcd.print(now);
    lcd.setCursor(7, 1);
    lcd.print(" MAX ");
    lcd.print(MAX);

    if (now == MAX) {
      analogWrite(RED, 255);
      analogWrite(YELLOW, 0);
      analogWrite(GREEN, 0);
    }else if(now >= MAX/2){
      analogWrite(RED, 0);
      analogWrite(YELLOW, 255);
      analogWrite(GREEN, 0);
    }else if(now < MAX/2){
      analogWrite(RED, 0);
      analogWrite(YELLOW, 0);
      analogWrite(GREEN, 255);
    }
  }

  // Update Lastnow lastmax
  lastnow = now;
  lastmax = MAX;

  delay(50);
  digitalWrite(buzzer, HIGH);
}
long microsecondsToCentimeters(long microseconds)
{
  // The speed of sound is 340 m/s or 29 microseconds per centimeter.
  // The ping travels out and back, so to find the distance of the
  // object we take half of the distance travelled.
  return microseconds / 29 / 2;
}
void Uartcom() {
  if (Serial.available () > 0) {
    Serial.readBytes(mystr, Serial.available ());
    i = mystr[0];
    //Serial.println(i);
    if (tmp == 126 && i != 126 && i != 127) {
      if(i < 100){
        now = mystr[0];
      }
    }
    if (tmp == 127 && i != 127 && i != 126) {
      if(i < 100){
        MAX = mystr[0];
      }
    }
    tmp = mystr[0];
  }
}
