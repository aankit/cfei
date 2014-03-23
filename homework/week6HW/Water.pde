class Water {
  ArrayList<Drop> drops = new ArrayList<Drop>();

  Water() {
    for (int i = 0; i<width;i++) {
      drops.add(new Drop(new PVector((float)i, height/2)));
    }
  }

  public void run(Trash t) {
    for (Drop d : drops) {
      d.applyForce(t);
      d.update();    
      d.display();
    }
  }

  public void display() {
    for (Drop d : drops) {   
      d.display();
    }
  }
}

