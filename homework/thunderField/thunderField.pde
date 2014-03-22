Field f;

void setup() {
  size(1000, 800);
  N = height*width;
  f = new Field(N);
}

void draw() {
  background(152);
  r.makeItRain(0);
  r.run();
}

