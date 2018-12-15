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
  
  void addParticle(float radius){
    
    PVector newLocation=randomLocation(radius);
    particles.add(new RepelParticle(newLocation.x, newLocation.y, radius));
  }

  void interact() {
    for (Particle p : this.particles) {
      p.interact(particles);
    }
  }
  
  void remove(){
    particles.remove(particles.size()-1);
  }
  
  
  
  PVector randomLocation(float r){
    // Randomly distribute points around the disk
    float newRadius=random(r);
    float x=random(width)-width/2;
    float y=random(height)-height/2;
    
    PVector shift=new PVector(x,y);
    shift.mult(newRadius/shift.mag());
    shift.add(new PVector(width/2, height/2));
    // Add the particles to the system.
    return shift;
  }
  
  
}
