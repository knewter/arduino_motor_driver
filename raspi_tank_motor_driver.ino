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
  char wheel;
  char message[5];
  if(Serial.available()){
    wheel = Serial.read();
    direction = Serial.read();
    Serial.readBytesUntil('|', message, 5);
    int speed = atoi(message);
    if(wheel == 'R' || wheel == 'L'){
      set_motor_speed(wheel, direction, speed);
    }
    Serial.println("looped");
  }
}

void set_motor_speed(char wheel, char direction, int speed){
  Serial.println("set_motor_speed");
  int dir_int;
  if(direction == '+'){
    dir_int = 1;
  }
  if(direction == '-'){
    dir_int = -1;
  }
  if(wheel == 'R'){
    motordriver.setSpeed(speed, MOTORA);
    motordriver.rotateWithID(dir_int, MOTORA);
  }
  if(wheel == 'L'){
    motordriver.setSpeed(speed, MOTORB);
    motordriver.rotateWithID(dir_int, MOTORB);
  }
}
