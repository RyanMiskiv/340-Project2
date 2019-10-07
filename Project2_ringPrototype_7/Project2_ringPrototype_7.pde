//animated rings
//moves based on x and z kinect cordinate
//requires NImate settings of Skeleton Tracking enabled, OSCeleton, Multiple Person Tracking enabled, and Coordinates> origin> screen
//Code Adopted from Daniel Shiffman https://processing.org/examples/multipleparticlesystems.html
//this code is wildly messy but it was the only way I could think of to incorporate the colors and also the positions...
//Created by Miya Fordah

import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myBroadcastLocation; 
MainRing[] mRing = new MainRing[1];
ArrayList<RingSystem> systems;
boolean tRingEnd = false;

float[] mRingX = new float[6];
float[] mRingY = new float[6];

void setup(){
  fullScreen();
  
  //size(1000, 1000);
  oscP5 = new OscP5(this, 7000);
  myBroadcastLocation = new NetAddress("127.0.0.1", 7000);
  
  for(int i = 0; i < mRing.length; i++){
    mRing[i] = new MainRing();
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
  if(mRingX[0] > 0|| mRingY[0] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[0], mRingY[0])));
  }
  if(mRingX[1] > 0|| mRingY[1] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[1], mRingY[1])));
  }
  if(mRingX[2] > 0|| mRingY[2] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[2], mRingY[2])));
  }
  if(mRingX[3] > 0|| mRingY[3] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[3], mRingY[3])));
  }
  if(mRingX[4] > 0|| mRingY[4] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[4], mRingY[4])));
  }
  if(mRingX[5] > 0|| mRingY[5] > 0){
    systems.add(new RingSystem(1, new PVector(mRingX[5], mRingY[5])));
  }
}

void oscEvent(OscMessage theOscMessage){
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_1") == true){
    mRingX[0] = width * theOscMessage.get(0).floatValue();
    mRingY[0] = height/6 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_1") == true){
    mRingX[1] = width * theOscMessage.get(0).floatValue();
    mRingY[1] = height/6 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_2") == true){
    mRingX[2] = width * theOscMessage.get(0).floatValue();
    mRingY[2] = height/6 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_2") == true){
    mRingX[3] = width * theOscMessage.get(0).floatValue();
    mRingY[3] = height/6 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_3") == true){
    mRingX[4] = width * theOscMessage.get(0).floatValue();
    mRingY[4] = height/6 * theOscMessage.get(2).floatValue();
     theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_3") == true){
    mRingX[5] = width * theOscMessage.get(0).floatValue();
    mRingY[5] = height/6 * theOscMessage.get(2).floatValue();
    theOscMessage.print();
  }
}
