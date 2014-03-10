#include "Arduino.h"
#include "Actor.h"

Actor::Actor(int _servoPin){
  servoPin = _servoPin;
  index = 0;
  currentMove = -1;
  //for (int i = 0; i < 20; i++) {
    //moves[i][0] = 0.0;
  //}
}

void Actor::attach(){
  servoMotor.attach(servoPin);
}

void Actor::addWave(float timestamp, float _t, float _f, float _s, float _a, float _o) {
  moves[index][0] = timestamp;
  moves[index][1] = _t;
  moves[index][2] = _f;
  moves[index][3] = _s;
  moves[index][4] = _a;
  moves[index][5] = _o;

  index ++;
}

void Actor::endAt(int timestamp, int finalAngle) {
  moves[index][0] = (float)timestamp;
  moves[index][1] = -1;
  moves[index][2] = (float)finalAngle;

  index ++;
}

float Actor::wave() {
  t+=s;
  return sin(f*t)*a + o;
}

void Actor::update(int startTime) {
  lastAngle = angle;

  for (int i = 0; i < 20; i++) {
    if ((float)(millis() - startTime) >= moves[i][0] && moves[i][0] != 0.0 && i > currentMove) {
      t = moves[i][1];
      f = moves[i][2];
      s = moves[i][3];
      a = moves[i][4];
      o = moves[i][5];
      currentMove = i;
    }
  }

  if (currentMove >= 0) {
    if (moves[currentMove][1] == -1) {
      angle = moves[currentMove][2];
    } else {
      angle = wave();
    }
    servoMotor.write(angle);
  }

}
