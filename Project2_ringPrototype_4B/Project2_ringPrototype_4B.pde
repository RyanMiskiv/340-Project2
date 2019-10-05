//rough start for animated rings
//don't move on their own yet
//but now resets
//Code Adopted from Daniel Shiffman https://processing.org/examples/multipleparticlesystems.html

MainRing[] mRing = new MainRing[1];
ArrayList<RingSystem> systems;

boolean tRingEnd = false;
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
  
  systems = new ArrayList<RingSystem>();
}

void draw(){
  background(255);
  noCursor();
  
  for(int i = 0; i < mRing.length; i++){
    mRing[i].display();
  }
  
  for (RingSystem ps : systems) {
    ps.run();

  }
}

void mousePressed() {
  systems.add(new RingSystem(1, new PVector(mouseX, mouseY)));
}
