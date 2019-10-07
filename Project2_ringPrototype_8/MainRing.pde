class MainRing{

  private int mRingDiameter = 40;
 
 
  void display(){
    
    //mRingX = mouseX;
    //mRingY = mouseY;
    
    
    noFill();
    strokeWeight(3);
    stroke(0);
    if(mRingX[0] > 0|| mRingY[0] > 0){
      circle(mRingX[0], mRingY[0], mRingDiameter);
    }
    if(mRingX[1] > 0|| mRingY[1] > 0){
      circle(mRingX[1], mRingY[1], mRingDiameter);
    }
    if(mRingX[2] > 0|| mRingY[2] > 0){
      circle(mRingX[2], mRingY[2], mRingDiameter);
    }
    if(mRingX[3] > 0|| mRingY[3] > 0){
      circle(mRingX[3], mRingY[3], mRingDiameter);
    }
    if(mRingX[4] > 0|| mRingY[4] > 0){
      circle(mRingX[4], mRingY[4], mRingDiameter);
    }
    if(mRingX[5] > 0|| mRingY[5] > 0){
      circle(mRingX[5], mRingY[5], mRingDiameter);
    }
  }
}
