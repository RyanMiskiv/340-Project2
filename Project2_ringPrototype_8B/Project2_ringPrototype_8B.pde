//animated rings
//moves based on x and z kinect cordinate
//requires NImate settings of Skeleton Tracking enabled, OSCeleton, Multiple Person Tracking enabled, and Coordinates> origin> screen
//Code Adopted from Daniel Shiffman https://processing.org/examples/multipleparticlesystems.html
//ring is pushed every half second if moving though difficult to stand still enough...
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
float[] mRingXOld = new float[6];
float[] mRingYOld = new float[6];
int check = 0;

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
  rings();
}

void rings(){
  if(millis() > check + 500){
    if(mRingX[0] > 0|| mRingY[0] > 0){
      if(mRingX[0] > mRingXOld[0] + 50|| mRingY[0] > mRingYOld[0] + 50|| mRingX[0] < mRingXOld[0] - 50|| mRingY[0] < mRingYOld[0] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[0], mRingY[0])));
        mRingXOld[0] = mRingX[0];
        mRingYOld[0] = mRingY[0];
      }
    }
    if(mRingX[1] > 0|| mRingY[1] > 0){
      if(mRingX[1] > mRingXOld[1] + 50|| mRingY[1] > mRingYOld[1] + 50|| mRingX[1] < mRingXOld[1] - 50|| mRingY[1] < mRingYOld[1] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[1], mRingY[1])));
        mRingXOld[1] = mRingX[1];
        mRingYOld[1] = mRingY[1];
      }
    }
    if(mRingX[2] > 0|| mRingY[2] > 0){
      if(mRingX[2] > mRingXOld[2] + 50|| mRingY[2] > mRingYOld[2] + 50|| mRingX[2] < mRingXOld[2] - 50|| mRingY[2] < mRingYOld[2] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[2], mRingY[2])));
        mRingXOld[2] = mRingX[2];
        mRingYOld[2] = mRingY[2];
      }
    }
    if(mRingX[3] > 0|| mRingY[3] > 0){
      if(mRingX[3] > mRingXOld[3] + 50|| mRingY[3] > mRingYOld[3] + 50|| mRingX[3] < mRingXOld[3] - 50|| mRingY[3] < mRingYOld[3] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[3], mRingY[3])));
        mRingXOld[3] = mRingX[3];
        mRingYOld[3] = mRingY[3];
      }
    }
    if(mRingX[4] > 0|| mRingY[4] > 0){
      if(mRingX[4] > mRingXOld[4] + 50|| mRingY[4] > mRingYOld[4] + 50|| mRingX[4] < mRingXOld[4] - 50|| mRingY[4] < mRingYOld[4] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[4], mRingY[4])));
        mRingXOld[4] = mRingX[4];
        mRingYOld[4] = mRingY[4];
      }
    }
    if(mRingX[5] > 0|| mRingY[5] > 0){
      if(mRingX[5] > mRingXOld[5] + 50|| mRingY[5] > mRingYOld[5] + 50|| mRingX[5] < mRingXOld[5] - 50|| mRingY[5] < mRingYOld[5] - 50){
        systems.add(new RingSystem(1, new PVector(mRingX[5], mRingY[5])));
        mRingXOld[5] = mRingX[5];
        mRingYOld[5] = mRingY[5];
      }
    }
    check = millis();
  }
  
}

void oscEvent(OscMessage theOscMessage){
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_1") == true){
    mRingX[0] = width * theOscMessage.get(0).floatValue();
    mRingY[0] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_1") == true){
    mRingX[1] = width * theOscMessage.get(0).floatValue();
    mRingY[1] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_2") == true){
    mRingX[2] = width * theOscMessage.get(0).floatValue();
    mRingY[2] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_2") == true){
    mRingX[3] = width * theOscMessage.get(0).floatValue();
    mRingY[3] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Right_Hand_3") == true){
    mRingX[4] = width * theOscMessage.get(0).floatValue();
    mRingY[4] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
  if (theOscMessage.checkAddrPattern("/joint_Left_Hand_3") == true){
    mRingX[5] = width * theOscMessage.get(0).floatValue();
    mRingY[5] = height/6 * theOscMessage.get(2).floatValue();
    //theOscMessage.print();
  }
}
