// Modify MPU605_DMP6 using the code below. 
// Enable  OUTPUT_READABLE_YAWPITCHROLL and OUTPUT_READABLE_WORLDACCEL 
// and get rid of all other print and println statements
// don't forget to calibrate your GY-521 !!!! 
// thr-# 06.01.2015 

/* 

 #ifdef OUTPUT_READABLE_YAWPITCHROLL
            // display Euler angles in degrees
            mpu.dmpGetQuaternion(&q, fifoBuffer);
            mpu.dmpGetGravity(&gravity, &q);
            mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);
            Serial.print(ypr[0]);
            Serial.print(",");
            Serial.print(ypr[1]);
            Serial.print(",");
            Serial.print(ypr[2]);
        #endif
        #ifdef OUTPUT_READABLE_WORLDACCEL
            // display initial world-frame acceleration, adjusted to remove gravity
            // and rotated based on known orientation from quaternion
    //        mpu.dmpGetQuaternion(&q, fifoBuffer);
            mpu.dmpGetAccel(&aa, fifoBuffer);
            mpu.dmpGetGravity(&gravity, &q);
            mpu.dmpGetLinearAccel(&aaReal, &aa, &gravity);
            mpu.dmpGetLinearAccelInWorld(&aaWorld, &aaReal, &q);
            Serial.print(","); 
            Serial.print((float)aaWorld.x/16384);
            Serial.print(",");
            Serial.print((float)aaWorld.y/16384);
            Serial.print(",");
            Serial.print((float)aaWorld.z/16384);
            Serial.print(",");
            Serial.println(micros());
        #endif
*/ 