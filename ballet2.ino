#include <Actor.h>
#include <Servo.h>

int buttonState;
boolean playing = false;
boolean playedMessage = false;

int buttonPin = 8;
int light = 7;

int doorPin = 6;
int horizontalPin = 5;
int verticalPin = 4;

int doorOpenTime = 8000;
int doorCloseTime = doorOpenTime + 2400;

int startTime;

Actor door(doorPin);
Actor horizontal(horizontalPin);
Actor vertical(verticalPin);

void setup() { 
  Serial.begin(9600);

  pinMode(buttonPin, INPUT);
  pinMode(light, OUTPUT);
  digitalWrite(light, LOW);

  door.attach();
  
  vertical.attach();
  vertical.servoMotor.write(0);
  
  horizontal.attach();
  horizontal.servoMotor.write(70);

  door.addWave(1, 80, 1, .05, 8, 70);
  door.addWave(2000, 80, 1, .1, 15, 65);
  door.addWave(4000, 80, 1, .01, 30, 70);
  door.addWave(6000, 80, 1, .05, 30, 70);
  door.endAt(doorOpenTime, 30);
  
  vertical.endAt(doorOpenTime, 45);
  horizontal.addWave(doorOpenTime + 100, 70, 2, .003, 50, 95);
  horizontal.endAt(doorOpenTime + 1500, 70);
  vertical.endAt(doorOpenTime + 2000, 0);
  door.endAt(doorCloseTime, 80);
  
  door.endAt(doorCloseTime + 1000, 0);
  vertical.endAt(doorCloseTime + 1500, 70);
  
  horizontal.addWave(doorCloseTime + 5000, 70, 1, .005, 180, 95);
  vertical.addWave(doorCloseTime + 6000, 45, 1, .05, 60, 50);
  
  horizontal.endAt(doorCloseTime + 13000, 70);
  vertical.endAt(doorCloseTime + 13000, 0);
  door.endAt(doorCloseTime + 14000, 80);
  //vertical.addWave(1000, 0, 1, .005, 45, 45);
  //vertical.addWave(5000, 0, 1, .01, 45, 45);
} 

void loop() {
  buttonState = digitalRead(buttonPin);
  //startPlay();

  if (buttonState == HIGH && playing != true) {
    playing = true;
    startTime = millis();
  }

  if (playing) {
    startPlay();
  }
  
}

void startPlay() {
  door.update(startTime);
  horizontal.update(startTime);
  vertical.update(startTime);
  updateLight();
  if (millis() - startTime > doorCloseTime + 2000 && !playedMessage) {
    message();
    
  }
  
  if (millis() - startTime > doorCloseTime + 15000) {
    playing = false;
    
  }
}

void updateLight() {
  if (playing && millis() - startTime >= doorOpenTime || door.angle < 65) {
    digitalWrite(light, HIGH);
  } 
  else {
    digitalWrite(light, LOW);
  } 

}

void dot()
{
  digitalWrite(light, HIGH);
  delay(250);
  digitalWrite(light, LOW);
  delay(250);
}

void dash()
{
  digitalWrite(light, HIGH);
  delay(1000);
  digitalWrite(light, LOW);
  delay(250);
}

void message() {
   dot();dot();dot();dot();dot();dash();dot();dash();dash();dot();
   playedMessage = true;
}


