// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Addtions made by Matthew Bardoe

// Simple Particle System

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  float r = 6;
  float fric=-0.05;

  Particle(float x, float y) {
    acceleration = new PVector();
    velocity = PVector.random2D();
    position = new PVector(x, y);
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  void interact(ArrayList<Particle> particles) {
    print("old interact");
    for (Particle other : particles) {
      if (other != this) {
        PVector dir = PVector.sub(position, other.position);
        if (dir.mag() < r*2) {
          dir.setMag(0.5); 
          applyForce(dir);
        }
      }
    }
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  // Method to update position
  void update() {
    //print(acceleration);
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 0.5;
  }
  
  void setFriction(float amount)
  {
    //print(fric);
    fric=amount;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(position.x, position.y, r*2, r*2);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
