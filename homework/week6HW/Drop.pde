class Drop {
  PVector l, v, a;

  Drop(PVector _l) {
    l = _l;
    v = new PVector(0, 0);
    a = new PVector(0, 0);
  }

  public void applyForce(Trash t) {
    if (touching(t.l)) {
      //there will be a force on the trash, drag of the water
      //
      a.add(t.g);
    }
  }

  public void update() {
    v.add(a);
    l.add(v);
  }

  public void display() {
    fill(0);
    ellipse(l.x, l.y, 2, 2);
  }

  private boolean touching(PVector tl) {
    boolean touching = (tl.dist(l) < 1) ? true: false;
    return touching;
  }
}

