// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

RepelParticleSystem ps;
// How many particles are on the disk.
int number=34;
int radius=100;
void setup() {
  size(640,360);
  ps = new RepelParticleSystem(new PVector(width/2,50));
  for (int i=0; i<number; i++){
    // Randomly distribute points around the disk
    float x=random(width)-width/2;
    float y=random(height)-height/2;
    float r=random(radius);
    PVector shift=new PVector(x,y);
    shift.mult(r/shift.mag());
    shift.add(new PVector(width/2, height/2));
    // Add the particles to the system.
    ps.addParticle(shift.x, shift.y, radius);
  }
}

void draw() {
  background(255);
  // Draw the disk.
  fill(255);
  ellipse(width/2, height/2, 2*radius,2*radius);
  
  //ps.addParticle(random(width),random(height));

  //PVector gravity = new PVector(0,0.1);
  //ps.applyForce(gravity);
  ps.update();
  ps.interact();
  ps.display();
}

void keyPressed(){
  print("HERE");
  setup();
}
