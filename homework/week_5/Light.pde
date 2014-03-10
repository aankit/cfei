class Light {
  ArrayList<Particle> particles;
  PVector origin;
  int limit;

  Light() {
    particles = new ArrayList<Particle>();
    limit = 100;
  }


  void addParticle(int c) {
    if (c > limit) return;
    particles.add(new Particle());
    addParticle(c+1);
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

