class Water {
  ArrayList<Drop> drops = new ArrayList<Drop>();
  PVector drag;

  Water() {
    for (int i = 0; i<width;i++) {
      drops.add(new Drop(new PVector((float)i, height/2)));
    }
    drag = new PVector(0, -.009);
  }

  private void run(Trash t) {
    for (Drop d : drops) {
      if (d.touching(t)) {
        println("eval");
        d.applyForce(t.v);
        d.run();
        //t.applyForce(drag);
      }
      
    }
  }

  private void display() {
    for (Drop d : drops) {   
      d.display();
    }
  }
}

