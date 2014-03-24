class Drop {
  PVector l, v, a, origin;
  float amp, freq, viscosity;
  //int touching;

  Drop(PVector _l) {
    l = _l;
    origin = _l;
    v = new PVector(0, 0);
    a = new PVector(0, 0);
    viscosity = .02;
    //touching = 0;
  }


  private void run() {
    //determine is there is collision

    update();
    display();
  }

  private void applyForce(PVector f) {
    a.add(f);
//    if (touching) {
//      PVector force = new PVector(t.v.x, t.v.y);
//      force.mult(.05);
//      a.add(force);
//    }
  }

  private void oscillate() {
    PVector current = new PVector(origin.x, origin.y);
    current.sub(l);
    current.mult(viscosity);
    a.add(current);
  }

  private void update() {
    //oscillate();
    v.add(a);
    l.add(v);
    a.mult(0);
  }

  private void display() {
    fill(0);
    ellipse(l.x, l.y, 5, 5);
  }

  private boolean touching(Trash t) {
    //println("called");
    boolean touching = (l.dist(t.l) < t.diam/2) ? true : false;
    println(touching);
    return touching;
  }
}

