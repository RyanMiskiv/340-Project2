//rough start for animated rings
//don't move on their own yet or reset

MainRing[] mRing = new MainRing[1];
TrailRing[] tRing = new TrailRing[1];

/*boolean tRingEnd = false;*/

int ringsRed;
int ringsGreen;
int ringsBlue;

void setup(){
  fullScreen();
  
  for(int i = 0; i < mRing.length; i++){
    ringsRed = (int)random(250);
    ringsGreen = (int)random(250);
    ringsBlue = (int)random(250);
    mRing[i] = new MainRing(ringsRed, ringsGreen, ringsBlue);
  }
  
  for(int i = 0; i < tRing.length; i++){
    tRing[i] = new TrailRing(ringsRed, ringsGreen, ringsBlue);
  }
}

void draw(){
  background(255);
  noCursor();
  
  for(int i = 0; i < mRing.length; i++){
    mRing[i].display();
  }
  
  for(int i = 0; i < tRing.length; i++){
    tRing[i].display();
    tRing[i].fade();
    tRing[i].end();
    
    /*if(tRingEnd == true){
      tRing[i].remove();
    }*/
  }
  
  
}
