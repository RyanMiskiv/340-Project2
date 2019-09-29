class MainRing{
  
  private int mRingX;
  private int mRingY;
  private int mRingDiameter = 40;
  private int mRingRed;
  private int mRingGreen;
  private int mRingBlue;
  
  public MainRing(int mRingRed, int mRingGreen, int mRingBlue){
    this.mRingRed = mRingRed;
    this.mRingGreen = mRingGreen;
    this.mRingBlue = mRingBlue;
  }
  
  void display(){
    mRingX = mouseX;
    mRingY = mouseY;
    
    noFill();
    strokeWeight(7);
    stroke(mRingRed, mRingGreen, mRingBlue);
    circle(mRingX, mRingY, mRingDiameter);
  }
}
