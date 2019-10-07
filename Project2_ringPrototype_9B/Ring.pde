class Ring {
  
  PVector position;
  float lifespan;
  //float[] history;
  
  float tRingDiameter = (int)random(1, 50);
  float tRingDiameterMax = (int)random(100, 150);
  int systemRed;
  int systemGreen;
  int systemBlue;

  Ring(PVector l) {
    position = l.copy();
    lifespan = 255.0;
    
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    
    //die based on diameter or time
    if(tRingDiameter >= tRingDiameterMax){
      lifespan -= 1.0;
    }
    tRingDiameter += 0.5;
  }

  // Method to display
  void display(){
      stroke(0, 0, 0, lifespan);
      circle(position.x, position.y, tRingDiameter);
      //println(position.x);
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
