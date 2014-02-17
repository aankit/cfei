int numP = 10000;
Particle[] p = new Particle[numP];

void setup() {
  size(1000, 800);
  PVector center = new PVector(width/2, height/2);
  for (int i=0;i<numP;i++) {
    p[i] = new Particle(center);
  }
}

void draw() {
  background(0);
  for (int i=0;i<numP;i++){
    p[i].display();
    p[i].update();
  }
}

