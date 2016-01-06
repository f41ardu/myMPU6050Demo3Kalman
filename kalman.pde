// See as further reference 
// http://www.cs.unc.edu/~welch/kalman/index.html
// http://www.cs.unc.edu/~welch/kalman/index.html#Anchor-Rudolph-6296
// Kalman Filter in one dimension only 
// next release will contain a filter for 3-dim vectors
class Kalman { 
 
    float _q; //process noise covariance
    float _r; //measurement noise covariance
    float _x; //value
    float _p; //estimation error covariance
    float _k; //kalman gain  

    Kalman (float q, float r, float p, float intial_value) 
    { // The Constructor is defined with arguments.
      _q=q;
      _r=r;
      _p=p;
      _x=intial_value;
    }

   float update(float measurement)
   {
    //prediction update
  //omit x = x
  _p = _p +_q;
  //measurement update
  _k = _p / (_p + _r);
  _x = _x + _k * (measurement - _x);
  _p = (1.0 -_k) * _p;
  return _x;
  }
}