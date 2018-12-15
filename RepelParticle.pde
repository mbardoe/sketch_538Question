// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Addtions made by Matthew Bardoe

// Simple Particle System

class RepelParticle extends Particle {

  float LargestR = 100;

  RepelParticle(float x, float y, float radius) {
    super(x, y);
    LargestR=radius;
  }



  void interact(ArrayList<Particle> particles) {
    //print("new interact");
    for (Particle other : particles) {
      //print("HERE");
      if (other != this) {
        PVector dir = PVector.sub(position, other.position);
        dir.mult(1*pow(other.position.dist(this.position), -2));
        //print(dir);
        applyForce(dir);
      }
    }
    PVector friction= new PVector(velocity.x, velocity.y);
    friction.mult(fric);
   // print(friction);
    //print("\n");
    applyForce(friction);
  }
  
  // Method to update position
  void update() {
    //print(acceleration);

    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    if (outside()) {
      scaleposition();
    }
    //lifespan -= 0.5;
  }

  void scaleposition() {
    PVector center= new PVector(width/2, height/2);
    PVector shift=position.sub(center);
    shift.mult(LargestR/shift.mag());
    position=center.add(shift);
  }

  boolean outside() {
    //print("OUTSIDE");
    return  position.dist(new PVector(width/2, height/2))>(LargestR);
  }
}
