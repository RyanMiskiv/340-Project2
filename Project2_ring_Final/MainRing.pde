class MainRing{

  private int mRingDiameter = 40;
  private int alpha0 = 255;
  private int alpha1 = 255;
  private int alpha2 = 255;
  private int alpha3 = 255;
  private int alpha4 = 255;
  private int alpha5 = 255;
 
 
 
  void display(){
    
    //mRingX = mouseX;
    //mRingY = mouseY;
    
    
    noFill();
    strokeWeight(3);
    if(mRingX[0] > 0|| mRingY[0] > 0){
      stroke(0, alpha0);
      circle(mRingX[0], mRingY[0], mRingDiameter);
      if(mRingX[0] == mRingXOld[0] && mRingY[0] == mRingYOld[0]){
        alpha0 --;
      }else{
        alpha0 = 255;
      }
    }
    if(mRingX[1] > 0|| mRingY[1] > 0){
      stroke(0, alpha1);
      circle(mRingX[1], mRingY[1], mRingDiameter);
      if(mRingX[1] == mRingXOld[1] && mRingY[1] == mRingYOld[1]){
        alpha1 --;
      }else{
        alpha1 = 255;
      }
    }
    if(mRingX[2] > 0|| mRingY[2] > 0){
      stroke(0, alpha2);
      circle(mRingX[2], mRingY[2], mRingDiameter);
       if(mRingX[2] == mRingXOld[2] && mRingY[2] == mRingYOld[2]){
        alpha2 --;
      }else{
        alpha2 = 255;
      }
    }
    if(mRingX[3] > 0|| mRingY[3] > 0){
      stroke(0, alpha3);
      circle(mRingX[3], mRingY[3], mRingDiameter);
       if(mRingX[3] == mRingXOld[3] && mRingY[3] == mRingYOld[3]){
        alpha3 --;
      }else{
        alpha3 = 255;
      }
    }
    if(mRingX[4] > 0|| mRingY[4] > 0){
      stroke(0, alpha4);
      circle(mRingX[4], mRingY[4], mRingDiameter);
       if(mRingX[4] == mRingXOld[4] && mRingY[4] == mRingYOld[4]){
        alpha4 --;
      }else{
        alpha4 = 255;
      }
    }
    if(mRingX[5] > 0|| mRingY[5] > 0){
      stroke(0, alpha5);
      circle(mRingX[5], mRingY[5], mRingDiameter);
       if(mRingX[5] == mRingXOld[5] && mRingY[5] == mRingYOld[5]){
        alpha5 --;
      }else{
        alpha5 = 255;
      }
    }
  }
}
