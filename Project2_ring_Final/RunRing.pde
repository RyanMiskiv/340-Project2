class RunRing extends Ring {
  
  float moveX = (float)random(-10, 10);
  float moveY = (float)random(-10, 10);
  float tRingDiameterMax = (int)random(70, 120);
  int red = (int)random(10, 250);
  int green = (int)random(10, 250);
  int blue = (int)random(10, 250);
  
  RunRing(PVector l) {
    super(l);
  }

  void update() {
    if(tRingDiameter >= tRingDiameterMax){
      lifespan -= 2.0;
    }
    tRingDiameter += 1;
    position.x += moveX;
    position.y += moveY;
    if(position.x + tRingDiameter/2 >= width|| position.x - tRingDiameter/2 <= 1){
      moveX *= -1.05;

    }
    if(position.y + tRingDiameter/2 >= height|| position.y - tRingDiameter/2 <= 0){
      moveY *= -1.05;
    }
  }

  void display() {
    stroke(red, green, blue, lifespan);
    circle(position.x, position.y, tRingDiameter);
  }
}
