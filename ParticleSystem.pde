// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Addtions made by Matthew Bardoe

// Using Generics now!  comment and annotate, etc.

class ParticleSystem {
  ArrayList<Particle> particles;
  float fric=0;

  ParticleSystem(PVector position) {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y) {
    particles.add(new Particle(x, y));
  }

  ArrayList<Particle> getParticles() {
    return particles;
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
  
  float getFric(){
    return fric;
  }
  
  void updateFriction(float amount){
    fric+=amount;  
    if (fric>0){
      fric=0;
    }
    for (Particle p : this.particles) {
      p.setFriction(fric);
    }
    //print(fric);
    //print("\n");
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void interact() {
    for (Particle p : particles) {
      p.interact(particles);
    }
  }


  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}
