class Trash{
  float diam;
  PVector l, v, a, g;
  
  Trash(PVector _l){
    l = _l;
    v = new PVector(0,0);
    a = new PVector(0,0);
    g = new PVector(0,.03);
    diam = random(20,40);
  }
  
  private void applyForce(PVector f){
    a.add(f);
  }
  
  private void update(){
    a.add(g);
    v.add(a);
    l.add(v);
    a.mult(0);
  }
  
  private void display(){
    fill(128);
    ellipse(l.x, l.y, diam, diam);
  }
  
}
