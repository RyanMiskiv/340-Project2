// A subclass of Particle

class RunRing extends Ring {
  
  // It inherits all other fields from "Particle", and we don't have to retype them!
  float moveX = 100;//(float)random(-10, 10);
  float moveY = 100;//(float)random(-10, 10);
  int red = (int)random(250);
  int green = (int)random(250);
  int blue = (int)random(250);
  
  // The CrazyParticle constructor can call the parent class (super class) constructor
  RunRing(PVector l) {
    // "super" means do everything from the constructor in Particle
    super(l);
  }

  // This update() method overrides the parent class update() method
  void update() {
    super.update();
  }

  // This display() method overrides the parent class display() method
  void display() {
    position.x += 10;
    position.y += 10;
    stroke(0, 0, 0, lifespan);
    circle(position.x, position.y, tRingDiameter);
    println(position.x);
  }
}
