//  Demo function:The application method to drive the DC motor.
//  Author:Frankie.Chu
//  Date:20 November, 2012

#include "MotorDriver.h"

void setup()
{
  Serial.begin(9600);
  /*Configure the motor A to control the wheel at the left side.*/
  /*Configure the motor B to control the wheel at the right side.*/
  motordriver.init();
  motordriver.setSpeed(0,MOTORA);
  motordriver.setSpeed(0,MOTORB);
  Serial.println("ready");
}
 
void loop()
{
  int bytesRead = 0;
  char direction;
  char wheel;
  char message[5];
  if(Serial.available()){
    wheel = Serial.read();
    Serial.readBytesUntil('|', message, 6);
    Serial.println(message);
    int speed = atoi(message);
    Serial.println(speed);
    if(wheel == 'R' || wheel == 'L'){
      set_motor_speed(wheel, speed);
    }
    Serial.println("looped");
  }
}

void set_motor_speed(char wheel, int speed){
  int dir_int;
  int dir;
  if(speed >= 0){
    dir_int = 1;
    dir = MOTOR_ANTICLOCKWISE;
  }
  if(speed < 0){
    dir_int = -1;
    dir = MOTOR_CLOCKWISE;
  }
  if(wheel == 'R'){
    motordriver.setSpeed(dir_int * speed, MOTORA);
    motordriver.rotateWithID(dir, MOTORA);
  }
  if(wheel == 'L'){
    motordriver.setSpeed(dir_int * speed, MOTORB);
    motordriver.rotateWithID(dir, MOTORB);
  }
}
