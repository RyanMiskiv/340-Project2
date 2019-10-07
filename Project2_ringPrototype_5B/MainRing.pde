class MainRing{

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
    
    //mRingX = mouseX;
    //mRingY = mouseY;
    
    noFill();
    strokeWeight(3);
    stroke(mRingRed, mRingGreen, mRingBlue);
    for(int i = 0; i < mRingX.length; i++){
    circle(mRingX[i], mRingY[i], mRingDiameter);
    }
    
  }
}
