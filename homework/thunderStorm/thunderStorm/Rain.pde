class Rain {
  ArrayList<Drop> drops = new ArrayList<Drop>();
  int limit;

  Rain() {
    limit = 0;
  }

  public void makeItRain(int c) {
    if (c > limit) return;
    drops.add(new Drop(random(width), 0.0));
    makeItRain(c+1);
  }
  
  public void run(){
    for (int i=0; i<drops.size(); i++){
      Drop d = drops.get(i);
      d.run();
      if (d.isDead()) drops.remove(d);
    }
  }
}

