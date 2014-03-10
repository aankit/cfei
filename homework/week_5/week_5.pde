Light l;
float xoff;

void setup() {
  size(600, 600);
  xoff = 0.0;
  l = new Light();
}

void draw() {
  background(0);
  xoff += 0.01;
  translate(noise(xoff)*100+width/2, height/2);
  l.addParticle(0);
  l.run();
}

