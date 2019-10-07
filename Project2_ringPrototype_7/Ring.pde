class Ring {
  
  PVector position;
  float lifespan;
  //float[] history;
  float moveX = 0;//(float)random(-10, 10);
  float moveY = 0;//(float)random(-10, 10);
  int tRingDiameter = (int)random(1, 50);
  int tRingDiameterMax = (int)random(100, 150);
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
    position.x += moveX;
    position.y += moveY;
    
    //die based on diameter or time
    if(tRingDiameter >= tRingDiameterMax){
      lifespan -= 2.0;
    }
    tRingDiameter += 1;
  }

  // Method to display
  void display(){
      stroke(0, 0, 0, lifespan);
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
