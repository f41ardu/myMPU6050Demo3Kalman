// require MPU6050_DMP_Position configured on Arduino (see Arduino) 
// thr-# 06.01.2015 
void serialEvent(Serial myPort) {
      interval = millis();   
      String myString = myPort.readStringUntil(linefeed);
      if (myString != null) {
        //myString = trim(myString);
        // println(myString);
        msg = (split(myString, ','));
        for (i=0; i< 7; i++ ) {
          value[i]=float (msg[i]);
          print(value[i]+" ");
          println();
        }
        // arduino liefert ms
        deltaTime=abs(value[6]-timePrev)/100.;
        timePrev=value[6];
//        print(deltaTime);  
//        println();
      }
}