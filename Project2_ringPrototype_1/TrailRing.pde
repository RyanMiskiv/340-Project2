class TrailRing{
  
  private int tRingX;
  private int tRingY;
  private int tRingDiameter;
  private int tRingDiameterMax;
  private int tRingRed;
  private int tRingGreen;
  private int tRingBlue;
  private int tRingAlpha = 255;
  
  public TrailRing(int tRingDiameter, int tRingDiameterMax, int tRingRed, int tRingGreen, int tRingBlue){
    this.tRingDiameter = tRingDiameter;
    this.tRingDiameterMax = tRingDiameterMax;
    this.tRingRed = tRingRed;
    this.tRingGreen = tRingGreen;
    this.tRingBlue = tRingBlue;
  }
  
  void display(){
    tRingX = mouseX;
    tRingY = mouseY;
    
    if(mousePressed){
      noFill();
      strokeWeight(7);
      stroke(tRingRed, tRingGreen, tRingBlue, tRingAlpha);
      tRingDiameter += 5;
      circle(tRingX, tRingY, tRingDiameter);
    }
  }
  
  void fade(){
    if(tRingDiameter >= tRingDiameterMax){
      tRingAlpha -= 10;
    }
    if(tRingAlpha < 0){
      tRingAlpha = 0;
    }
  }
  
  void end(){
    if(tRingAlpha == 0){
      //tRingEnd = true;
    }
  }
}
