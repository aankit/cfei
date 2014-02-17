class Particle {
  PVector pos = new PVector();
  PVector curr = new PVector();
  float r, t, h, v, dir;
  Particle(PVector _c) {
    pos.set(_c);
    r = 2*pow(random(0, 1), .5);
    t = random(0, 2*PI);
    pos.set(pos.x+r*cos(t), pos.y+r*sin(t));
    PVector end = new PVector(height, width);
    h = 2;
    v = 2;
    dir = random(-1,1);
  }


  void display() {
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, h, v);
  }

  void update() {
    if (pos.x>-10 && pos.y>-10 && pos.x<width+10 && pos.y<height+10) {
      r += 1*pow(10,-15);
      //println(r);
      pos.x = pos.x + r*cos(t);
      pos.y = pos.y + r*sin(t);
      h += dir*.01;
      v += dir*.01;
    }

    //println(pos);
  }
}

