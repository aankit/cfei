class Drop {
  PVector pos, v, a;
  VelocityField vf:

  Drop(float _x, float _y) {
    vf = new VelocityField(50);
    pos = new PVector(_x, _y);
    v = new PVector(0, 0);
    a = new PVector(0, .01);
  }
  
  public void run() {
    update();
    display();
  }

  private void update() {
    //this is where I want to ask a velocity field class for a vector
    
    //v.add(a);
    //pos.add(v);
    vf.
  }

  private void display() {
      fill(255);
      noStroke();
      ellipse(pos.x, pos.y, 5,5);
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

