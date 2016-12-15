// a simple modell with cordinates axis and a cool model of the chip
// you may use drawsimple instead of. 
// thr-# 15.12.2016 

void drawsimple() {
      //     fill(255,255,0);
//     box(100,100,10);
   noFill(); 
   stroke(255);
//        triangle(100, 0, 0, 0, 100, 0);
//        sphere(100);
        fill(0,255,0);
   stroke(0,0,255);
   box(10,100,100);
   box(75,5,5);
   box(300,0,0);
   box(0,300,0);
   box(0,0,300);
   translate(-60,0,0);
   sphere(10);
   translate(120,0,0);
   stroke(255,0,0);
   sphere(10);
  // triangle(0, 0, 58, 20, 86, 75);
}

void drawbox() {
     noFill();
     stroke(255,255,255);
     box(1000);
     drawAxes();
}

void drawAxes() {
  drawboard();
  stroke(255, 0, 0);
  fill(255, 0, 0);
  //line(-300, 0, 0, 300, 0, 0);
  box(400,3,3);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  //line(0, -300, 0, 0, 300, 0);
  box(3,400,3);
  stroke(0, 0, 255);
  fill(0, 0, 255);
  //line(0, 0, -300, 0, 0, 300);
  box(3,3,400);
  fill(37,83,206);
  box(200,8,100);
  fill(255,255,255);
  text("+y", -210, 0, 0);
  text("-y: "  + nf(degrees(value[2]),2,1)  + "°" , 210, 0, 0);
  text("-z: " + nf(degrees(value[0]),2,1)  + "°" , 0, 210, 0);
  text("+z", 0, -210, 0);
  text("-x: "  + nf(degrees(value[1]),2,1) + "°" , 0, 0, 210);
  text("+x", 0, 0, -210);
}

void drawboard() {
  pushMatrix();
  translate(0,-5,0);
  rotateX(HALF_PI);
  image(img, 0, 0);
  popMatrix();
  pushMatrix();
  translate(0,5,0);
  rotateX(3*HALF_PI);
  image(img2, 0, 0);
  popMatrix();
  
  
}