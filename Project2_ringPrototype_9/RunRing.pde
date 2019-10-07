// A subclass of Particle

class RunRing extends Ring {

  // Just adding one new variable to a CrazyParticle
  // It inherits all other fields from "Particle", and we don't have to retype them!
  float moveX = (float)random(-10, 10);
  float moveY = (float)random(-10, 10);
  int red = (int)random(250);
  int green = (int)random(250);
  int blue = (int)random(250);
  // The CrazyParticle constructor can call the parent class (super class) constructor
  RunRing(PVector l) {
    // "super" means do everything from the constructor in Particle
    super(l);
  }

  // Notice we don't have the method run() here; it is inherited from Particle

  // This update() method overrides the parent class update() method
  void update() {
    super.update();
    // Increment rotation based on horizontal velocity
    position.x += moveX;
    position.y += moveY;
  }

  // This display() method overrides the parent class display() method
  void display() {
    // Render the ellipse just like in a regular particle
    //super.display();
    stroke(red, green, blue, lifespan);
    circle(position.x, position.y, tRingDiameter);
    
  }
}
