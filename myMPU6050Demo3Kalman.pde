// "If I have seen further it is by standing on ye sholders of Giants." Isaac Newton
// Simple tool to get a better understandig of MPU6050 on a GY-521 
// It use OUTPUT_READABLE_YAWPITCHROLL and OUTPUT_READABLE_WORLDACCEL 
// thr-# 06.01.2015 
// use MPU6050_DMP_Position

import processing.serial.*;
import processing.opengl.*;
import toxi.geom.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
    
    Kalman filter_X, filter_Y, filter_Z;
    
    Serial myPort;
    float[] value=new float[7];

    int i=0;
    int k=100;
    int interval;
    int linefeed = 10;   // Linefeed in ASCII
    String[] msg=new String[7];
    PImage img,img2;
    
    float timePrev, deltaTime;
    float[] pos=new float[3];
    float[] newpos=new float[3];
    float[] currAccel=new float[3];
    float[] velocity=new float[3];
    float[] preVelocity=new float[3];
    int counter = 0;
    
    
  
    void setup()
    {
      size(800,800,P3D);
      noStroke();
      
      img = loadImage("GY-521_Front.JPG");
      img.resize(200, 100);
      img2 = loadImage("GY-521_Back.JPG");
      img2.resize(200, 100);
      imageMode(CENTER);
    
      filter_X=new Kalman(.1,.001,.001,.0000000000001);
      filter_Y=new Kalman(.1,.001,.001,.0000000000001);
      filter_Z=new Kalman(.1,.001,.001,.0000000000001);
    
      String portName="COM8";
      myPort = new Serial(this, portName, 38400);
      myPort.bufferUntil(linefeed);
      myPort.write('r'); 
      frameRate(100);
      background(255);
      fill(246, 225, 65);
      lights();  
    }

    void draw()
    {
       if (millis() - interval > 1000) {
         // resend single character to trigger DMP init/start
         // in case the MPU is halted/reset while applet is running
         myPort.write('r');
         interval = millis();
        }
   
    // black background
    background(0);
    // translate everything to the middle of the viewport
    pushMatrix();
    // a tribute to world to processing transformation
    translate(0,0,newpos[1]); // x
    translate(-newpos[0],0,0); // y 
    translate(0,-newpos[2],0); // z
    translate(width / 2, height / 2);
    rotateX(value[2]);   // MPU y  
    rotateY(-value[0]);  // MPU z
    rotateZ(value[1]);   // MPU x
    position();     
    drawbox();
    popMatrix();
}
// set position 0,0,0
    void keyPressed() {
      for (int i=0; i < 3; i++) {
        pos[i] = 0;
      }
    }
   
     

    