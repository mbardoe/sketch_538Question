// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

RepelParticleSystem ps;
// How many particles are on the disk.
int number=6;
int radius=100;
void setup() {
  size(640,360);
  ps = new RepelParticleSystem(new PVector(width/2,50));
  for (int i=0; i<number; i++){
    ps.addParticle(radius);
  }
}

void draw() {
  background(255);
  // Draw the disk.
  fill(50);
  text("Friction: ", 30,30);
  text(nfs(ps.getFric(),1, 3), 90, 30);
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
  // Add functionality where moving side to side adds/removes nodes.
  if (key==CODED){
    
    if (keyCode==RIGHT) {
      ps.addParticle(radius);
    }
    else if (keyCode==LEFT){
      ps.remove();
    }
    else if (keyCode==UP){
      ps.updateFriction(.01);
    }
    else if (keyCode==DOWN){
      ps.updateFriction(-0.01);
    }
    else
    {
      print("HERE");
      setup();
    }
  }
}
  
