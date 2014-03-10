#ifndef Actor_h
#define Actor_h

#include "Arduino.h"
#include "Servo.h"

class Actor
{
  public:
    Actor(int _servoPin);
    void addWave(float timestamp, float _t, float _f, float _s, float _a, float _o);
    void endAt(int timestamp, int finalAngle);
    float wave();
    void update(int startTime);
    void attach();

    Servo servoMotor;
    int servoPin;

    float moves[20][6];
    float t;
    float f;
    float s;
    float a;
    float o;

    float angle;
    float lastAngle;

    int index;
    int currentMove;
};

#endif
