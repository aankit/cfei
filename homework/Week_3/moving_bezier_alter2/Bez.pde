class Bez {
  // Using different ratios of movement through
  // sin and cos waves to move a slug through space

  float anchor1X, anchor1Y, anchor2X, anchor2Y;
  float control1X, control1Y, control2X, control2Y;
  float t, factor, gFactor, nFactor;

  Bez() {


    anchor1X = width/2;
    anchor1Y = height/3;
    anchor2X = width/2;
    anchor2Y = height/3;

    control1X = width/2;
    control1Y = height/3;
    control2X = width/2;
    control2Y = height/3;

    factor = 5;
  }
  
    Bez(float x1, float y1, float x2, float y2) {


    anchor1X = x1;
    anchor1Y = y1;
    anchor2X = x2;
    anchor2Y = y2;

    control1X = width/2;
    control1Y = height/3;
    control2X = width/2;
    control2Y = height/3;

    factor = 5;
  }
  

  void display() {
    t+=.01;
    gFactor = random(0, 100);
    nFactor = random(0, 5);
    // Use sin and cos to move anchor and control points
    // Play with numbers to affect ratios of movement
    anchor1X += random(-1,1);
    anchor1Y += random(-1,1);
    anchor2X += random(-1,1);
    anchor2Y += random(-1,1);
    
    noiseDetail(1, 10);
    control1X += cos(t*randomGaussian()*gFactor)*randomGaussian()*gFactor;
    control1Y += sin(t*randomGaussian()*gFactor)*randomGaussian()*gFactor;
    control2X += cos(t*randomGaussian()*gFactor)*randomGaussian()*gFactor;
    control2Y += sin(t*randomGaussian()*gFactor)*randomGaussian()*gFactor;

    noFill();
    float value = dist(anchor1X, anchor1Y, anchor2X, anchor2Y);
    int red = floor(map(value, 0, 50, 0, 255));
    //int green = constrain(floor(red/random(0, 10)),0,255);
    //int blue = constrain(floor(green+random(-100, 100)), 0, 255);
    color c = color(red, 0, 0);
    stroke(c);
    strokeWeight(5);
    bezier(anchor1X, anchor1Y, control1X, control1Y, control2X, control2Y, anchor2X, anchor2Y);

     // Red anchor points
     noStroke();
     /*fill(255, 0, 0);
     ellipse(anchor1X, anchor1Y, 10, 10);
     //ellipse(anchor2X, anchor2Y, 10, 10);
     
     ////    // Blue control points
     fill(0, 0, 255);
     ellipse(control1X, control1Y, 10, 10);
     ellipse(control2X, control2Y, 10, 10);
     
     //    stroke(200);
     //    strokeWeight(1);
     //    line(anchor1X, anchor1Y, control1X, control1Y);
     //    line(anchor2X, anchor2Y, control2X, control2Y);
     */
  }
}

