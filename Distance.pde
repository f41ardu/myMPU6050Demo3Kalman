// simple distance integration, to simple I would say 
// assume that this need most improvement
// I start to lok at 
// http://www.physics.udel.edu/~bnikolic/teaching/phys660/numerical_ode/ode.html   
// amongst others 
// thr-# 06.01.2015 

void position() {
  float[] ac = new float[3];
  ac[0] = filter_X.update(value[3]);
  ac[1] = filter_Y.update(value[4]);
  ac[2] = filter_Z.update(value[5]);
  
  for (i=0; i < 3; i++ ) {
  velocity[i] = (float)(ac[i]*deltaTime); //1000 added to get the same units
  newpos[i] = pos[i] + (0.5*ac[i])*(pow(deltaTime,2)); //  velocity[i]*deltaTime; 
  pos[i] = newpos[i];
 // preVelocity[i] = velocity[i];
//  print(pos[i] + " : ");
  } 
// println();
}      