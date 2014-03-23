class Drop {
  PVector l, v, a;
  float amp, freq;
  
  Drop(PVector _l) {
    l = _l;
    v = new PVector(0, 0);
    a = new PVector(0, 0);
  }

  public void applyForce(Trash t) {
    if (touching(t)) {
      //there will be a force on the trash, drag of the water
      
      a.add(t.g);
      print(l.x);
      println(a);
    }
  }

  public void update() {
    v.add(a);
    l.add(v);
  }

  public void display() {
    fill(0);
    ellipse(l.x, l.y, 5, 5);
  }

  private boolean touching(Trash t) {
    boolean touching = (l.dist(t.l) < t.diam/2) ? true: false;
    return touching;
  }
}

