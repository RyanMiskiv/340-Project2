//animated rings
//moves based on x and z kinect cordinate
//requires NImate settings of Skeleton Tracking enabled, OSCeleton, Hand Tracking Toggled Off, Multiple Person Tracking enabled, and Coordinates> origin> screen
//Code Adopted from Daniel Shiffman https://processing.org/examples/multipleparticlesystems.html
//ring is pushed every half second if moved more that 50px and moving ring is pushed evey 100px
//Created by Miya Fordah

import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myBroadcastLocation; 
MainRing[] mRing = new MainRing[1];
ArrayList<RingSystem> system1;
ArrayList<RunRingSystem> system2;
boolean tRingEnd = false;

float[] mRingX = new float[6];
float[] mRingY = new float[6];
float[] mRingXOld = new float[6];
float[] mRingYOld = new float[6];

int check = 0;
int speedSlow = 25;
int speedFast = 125;

void setup(){
  fullScreen();
  //size(1000, 1000);
  oscP5 = new OscP5(this, 7000);
  myBroadcastLocation = new NetAddress("127.0.0.1", 7000);
  
  for(int i = 0; i < mRing.length; i++){
    mRing[i] = new MainRing();
  }
  
  system1 = new ArrayList<RingSystem>();
  system2 = new ArrayList<RunRingSystem>();
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
  
  for (RingSystem ps : system1){
    ps.run();
  }
  for (RunRingSystem ps : system2){
    ps.run();
  }
  
  rings();
}

void rings(){
  if(millis() > check + 500){
    if(mRingX[0] > 0|| mRingY[0] > 0){
      if(mRingX[0] > mRingXOld[0] + speedFast|| mRingY[0] > mRingYOld[0] + speedFast|| mRingX[0] < mRingXOld[0] - speedFast|| mRingY[0] < mRingYOld[0] - speedFast){
        system2.add(new RunRingSystem(1, new PVector(mRingX[0], mRingY[0])));
        mRingXOld[0] = mRingX[0];
        mRingYOld[0] = mRingY[0];
      }else if(mRingX[0] > mRingXOld[0] + 50|| mRingY[0] > mRingYOld[0] + 50|| mRingX[0] < mRingXOld[0] - 50|| mRingY[0] < mRingYOld[0] - 50){
        system1.add(new RingSystem(1, new PVector(mRingX[0], mRingY[0])));
        mRingXOld[0] = mRingX[0];
        mRingYOld[0] = mRingY[0];
      }
    }
    
    if(mRingX[1] > 0|| mRingY[1] > 0){
      if(mRingX[1] > mRingXOld[1] + speedFast|| mRingY[1] > mRingYOld[1] + speedFast|| mRingX[1] < mRingXOld[1] - speedFast|| mRingY[1] < mRingYOld[1] - speedFast){
        system2.add(new RunRingSystem(1, new PVector(mRingX[1], mRingY[1])));
        mRingXOld[1] = mRingX[1];
        mRingYOld[1] = mRingY[1];
      }else if(mRingX[1] > mRingXOld[1] + speedSlow|| mRingY[1] > mRingYOld[1] + speedSlow|| mRingX[1] < mRingXOld[1] - speedSlow|| mRingY[1] < mRingYOld[1] - speedSlow){
        system1.add(new RingSystem(1, new PVector(mRingX[1], mRingY[1])));
        mRingXOld[1] = mRingX[1];
        mRingYOld[1] = mRingY[1];
      }
    }
    
    if(mRingX[2] > 0|| mRingY[2] > 0){
      if(mRingX[2] > mRingXOld[2] + speedFast|| mRingY[2] > mRingYOld[2] + speedFast|| mRingX[2] < mRingXOld[2] - speedFast|| mRingY[2] < mRingYOld[2] - speedFast){
        system2.add(new RunRingSystem(1, new PVector(mRingX[2], mRingY[2])));
        mRingXOld[2] = mRingX[2];
        mRingYOld[2] = mRingY[2];
      }else if(mRingX[2] > mRingXOld[2] + speedSlow|| mRingY[2] > mRingYOld[2] + speedSlow|| mRingX[2] < mRingXOld[2] - speedSlow|| mRingY[2] < mRingYOld[2] - speedSlow){
        system1.add(new RingSystem(1, new PVector(mRingX[2], mRingY[2])));
        mRingXOld[2] = mRingX[2];
        mRingYOld[2] = mRingY[2];
      }
    }
    
    if(mRingX[3] > 0|| mRingY[3] > 0){
      if(mRingX[3] > mRingXOld[3] + speedFast|| mRingY[3] > mRingYOld[3] + speedFast|| mRingX[3] < mRingXOld[3] - speedFast|| mRingY[3] < mRingYOld[3] - speedFast){
        system2.add(new RunRingSystem(1, new PVector(mRingX[3], mRingY[3])));
        mRingXOld[3] = mRingX[3];
        mRingYOld[3] = mRingY[3];
      }else if(mRingX[3] > mRingXOld[3] + speedSlow|| mRingY[3] > mRingYOld[3] + speedSlow|| mRingX[3] < mRingXOld[3] - speedSlow|| mRingY[3] < mRingYOld[3] - speedSlow){
        system1.add(new RingSystem(1, new PVector(mRingX[3], mRingY[3])));
        mRingXOld[3] = mRingX[3];
        mRingYOld[3] = mRingY[3];
      }
    }
    
    if(mRingX[4] > 0|| mRingY[4] > 0){
      if(mRingX[4] > mRingXOld[4] + speedFast|| mRingY[4] > mRingYOld[4] + speedFast|| mRingX[4] < mRingXOld[4] - speedFast|| mRingY[4] < mRingYOld[4] - speedFast){
        system2.add(new RunRingSystem(1, new PVector(mRingX[4], mRingY[4])));
        mRingXOld[4] = mRingX[4];
        mRingYOld[4] = mRingY[4];
      }else if(mRingX[4] > mRingXOld[4] + speedSlow|| mRingY[4] > mRingYOld[4] + speedSlow|| mRingX[4] < mRingXOld[4] - speedSlow|| mRingY[4] < mRingYOld[4] - speedSlow){
        system1.add(new RingSystem(1, new PVector(mRingX[4], mRingY[4])));
        mRingXOld[4] = mRingX[4];
        mRingYOld[4] = mRingY[4];
      }
    }
    
    if(mRingX[5] > 0|| mRingY[5] > 0){
      if(mRingX[5] > mRingXOld[5] + speedFast|| mRingY[5] > mRingYOld[5] + speedFast|| mRingX[5] < mRingXOld[5] - speedFast|| mRingY[5] < mRingYOld[5] - speedFast){         
        system2.add(new RunRingSystem(1, new PVector(mRingX[5], mRingY[5])));
        mRingXOld[5] = mRingX[5];
        mRingYOld[5] = mRingY[5];
      }else if(mRingX[5] > mRingXOld[5] + speedSlow|| mRingY[5] > mRingYOld[5] + speedSlow|| mRingX[5] < mRingXOld[5] - speedSlow|| mRingY[5] < mRingYOld[5] - speedSlow){
        system1.add(new RingSystem(1, new PVector(mRingX[5], mRingY[5])));
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
