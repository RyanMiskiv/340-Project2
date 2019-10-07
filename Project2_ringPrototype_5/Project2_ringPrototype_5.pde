//animated rings
//don't move based on x and z kinect cordinate
//requires NImate settings of Skeleton Tracking enabled, OSCeleton, Multiple Person Tracking enabled, and Coordinates> origin> screen
//Code Adopted from Daniel Shiffman https://processing.org/examples/multipleparticlesystems.html

import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myBroadcastLocation; 
MainRing[] mRing = new MainRing[1];
ArrayList<RingSystem> systems;
boolean tRingEnd = false;
int ringsRed;
int ringsGreen;
int ringsBlue;
float[] mRingX = new float[6];
float[] mRingY = new float[6];

void setup(){
  //fullScreen();
  size(1000, 1000);
  oscP5 = new OscP5(this, 7000);
  myBroadcastLocation = new NetAddress("127.0.0.1", 7000);
  
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
  OscMessage newMessage = new OscMessage("mouseX position");  
  newMessage.add(mouseX); 
  oscP5.send(newMessage, myBroadcastLocation);
  
  for(int i = 0; i < mRing.length; i++){
    mRing[i].display();
  }
  
  for (RingSystem ps : systems){
    ps.run();

  }
}

void mousePressed(){
  systems.add(new RingSystem(1, new PVector(mRingX[1], mRingY[1])));
}

void oscEvent(OscMessage theOscMessage){
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_1") == true){
    mRingX[1] = width * theOscMessage.get(0).floatValue();
    mRingY[1] = height/3 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_1") == true){
    mRingX[2] = width * theOscMessage.get(0).floatValue();
    mRingY[2] = height/3 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_2") == true){
    mRingX[3] = width * theOscMessage.get(0).floatValue();
    mRingY[3] = height/3 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_2") == true){
    mRingX[4] = width * theOscMessage.get(0).floatValue();
    mRingY[4] = height/3 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_3") == true){
    mRingX[5] = width * theOscMessage.get(0).floatValue();
    mRingY[5] = height/3 * theOscMessage.get(2).floatValue();
     theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_3") == true){
    mRingX[6] = width * theOscMessage.get(0).floatValue();
    mRingY[6] = height/3 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
}
