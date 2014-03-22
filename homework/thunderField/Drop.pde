class Drop {
  PVector pos, v, a;
  float l, vlimit, xa, ya;
  ArrayList<PVector> streak = new ArrayList<PVector>();

  Drop(float _x, float _y) {
    pos = new PVector(_x, _y);
    v = new PVector(0, 0);
    xa = 0;
    ya = .08;
    vlimit = 5;
    l = 15;
  }
  public void run() {
    update();
    display();
  }

  private void update() {
    PVector a = new PVector(xa, ya);
    v.add(a);
    pos.add(v);
    streak.add(pos);
    if (streak.size()>l) streak.remove(0);
  }

  private void display() {
    for (PVector s : streak) {
      fill(255);
      noStroke();
      ellipse(s.x, s.y, 2, 2);
    }
  }

  public boolean isDead() {
    if ((pos.x < 0.0 || pos.x > width) && (pos.y < (0.0-height/2) || pos.y > height)) {
      return true;
    } 
    else {
      return false;
    }
  }
}

