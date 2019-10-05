class Ring {
  
  PVector position;
  float lifespan;
  //float[] history;
  float moveX = (float)random(-10, 10);
  float moveY = (float)random(-10, 10);
  int tRingDiameter = (int)random(1, 100);
  int tRingDiameterMax = (int)random(150, 200);

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
    position.x += moveX;
    position.y += moveY;
    
    //die based on diameter or time
    if(tRingDiameter >= tRingDiameterMax){
      lifespan -= 2.0;
    }
    tRingDiameter += 2;
  }

  // Method to display
  void display() {

    stroke(ringsRed, ringsGreen, ringsBlue, lifespan);
    
    circle(position.x, position.y, tRingDiameter);
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
