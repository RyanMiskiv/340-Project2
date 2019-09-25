  
import processing.video.*;

Capture cam;
//Code adapted from TfGuy44

float x, y; 
boolean go=false;
 
void setup() { 
  fullScreen(); 
  rectMode(CENTER);
  newPosition();
} 
 
void draw(){ 
  background(#3A95AD);
  PVector p = new PVector( mouseX-x, mouseY-y, 0);
  p.limit(3);
  if (go && dist(mouseX, mouseY, x, y)<100) {
    x-=10*p.x;
    y-=10*p.y;
  }
  x = constrain(x, 25, width-25);
  y = constrain(y, 25, height-25);
  fill(#FFB171);
  noStroke();
  circle(x, y, 50); 
}
 
void mouseMoved(){
  go=true;
}

void newPosition() {
  x=random(width); 
  y=random(height);
}
 
