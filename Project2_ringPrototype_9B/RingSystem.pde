class RingSystem {

  ArrayList<Ring> particles;    // An arraylist for all the particles
  PVector origin;      // An origin point for where particles are birthed
  
  RingSystem(int num, PVector v) {
    particles = new ArrayList<Ring>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for(int i = 0; i < num; i++) {
      particles.add(new Ring(origin));    // Add "num" amount of particles to the arraylist
    }
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Ring p = particles.get(i);
      p.run();
      if(p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    Ring p;
    // Add either a Particle or CrazyParticle to the system
    if ((int)random(0, 2) == 0) {
      p = new Ring(origin);
    } 
    else {
      p = new RunRing(origin);
    }
    particles.add(p);
    //particles.add(new RunRing(origin));
  }

  void addParticle(RunRing p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}
