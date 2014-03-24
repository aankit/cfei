Water w;
ArrayList<Trash> trash;


void setup() {
  size(600, 600);
  w = new Water();
  trash = new ArrayList<Trash>();
}


void draw() {
  //println(frameRate);
  background(255);
  for (Trash t : trash) {
    t.update();
    t.display();
    w.run(t);   
  }
  w.display();

}

void mousePressed() {
  PVector mouse = new PVector(mouseX, mouseY);
  trash.add(new Trash(mouse));
}

