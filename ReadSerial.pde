// require myMPU6050Demo3Kalman_2 configured on an Arduino (see Arduino) 
// thr-# 15.12.2016
void serialEvent(Serial myPort) {
  interval = millis();
  while (myPort.available() > 0) {
    String inBuffer = myPort.readStringUntil(linefeed);
    if (inBuffer != null) {
      msg = split(inBuffer, ',');
      println(inBuffer);
      if (msg.length == 7) {
        for (int i=0; i<7; i++ ) {
          value[i]=float (msg[i]);
        }
        // arduino liefert ms
        deltaTime=abs(value[6]-timePrev);
        timePrev=value[6];
      }
    }
  }
}