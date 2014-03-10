class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float alpha, g;

  Particle() {
    acceleration = new PVector(randomGaussian()/100, randomGaussian()/100);
    velocity = new PVector(0, 0);
    
    float y = randomGaussian()*10;
    float x = randomGaussian()/y*2;
    location = new PVector(x, y);
    alpha = 255.0;
    g = random(69, 100); //orange, red
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    alpha -= 1;
    g += 1;
  }

  // Method to display
  void display() {
    stroke(255, g, 0, alpha);
    point(location.x, location.y);
  }

  // Is the particle still useful?
  boolean isDead() {
    if ((location.x < 0.0 || location.x > width) && (location.y < (0.0-height/2) || location.y > height)) {
      return true;
    } 
    else {
      return false;
    }
  }
}

