int stoneX;
int stoneY;
int rippleSize = 0;

void setup(){
  fullScreen();
}

void draw(){
  background(#3A95AD);
  
  //stone
  if(mousePressed){
    rippleSize += 10;
    noCursor();
    noFill();
    stroke(255);
    circle(stoneX, stoneY-1000, rippleSize);
    stroke(255);
    circle(stoneX, stoneY-1000, rippleSize-50);
    stroke(255);
    circle(stoneX, stoneY-400, rippleSize-100);
    stroke(255);
    circle(stoneX, stoneY-400, rippleSize-150);
  }else{
    rippleSize = 0;
    stoneX = mouseX;
    stoneY = mouseY;
    noCursor();
    fill(#BCBBBA);
    noStroke();
    circle(stoneX, stoneY, 50);
  }
}
