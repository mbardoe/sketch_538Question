// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com
// Addtions made by Matthew Bardoe


class RepelParticleSystem extends ParticleSystem {


  RepelParticleSystem(PVector position) {
    super(position);
  }

  void addParticle(float x, float y, float radius) {
    particles.add(new RepelParticle(x, y, radius));
  }

  void interact() {
    for (Particle p : this.particles) {
      p.interact(particles);
    }
  }
  
  
}
