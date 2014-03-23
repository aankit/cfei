Water w;
Trash t;
boolean trash;

void setup() {
  size(600, 600);
  w = new Water();
  trash = false;
}


void draw() {
  background(255);
  if (trash) {
    t.update();
    t.display();
    w.run(t);
  } 
  else {
    w.display();
  }
}

void mousePressed() {
  PVector mouse = new PVector(mouseX, mouseY);
  t = new Trash(mouse);
  trash = true;
}

