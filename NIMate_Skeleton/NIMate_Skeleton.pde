/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

// Keep track of all the joint names
String [] jointNames = {
  "Pelvis", "Torso", "Chest", "Neck", "Head", 
  "Left_Collar", "Left_Shoulder", "Left_Elbow", "Left_Wrist", "Left_Hand", 
  "Right_Collar", "Right_Shoulder", "Right_Elbow", "Right_Wrist", "Right_Hand", 
  "Left_Hip", "Left_Knee", "Left_Ankle", "Left_Foot", 
  "Right_Hip", "Right_Knee", "Right_Ankle", "Right_Foot", 
};

// Create an array of joints for the Skeleton
PVector [] skeleton = new PVector [joints.length];

void setup() {
  size(800, 600);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 7000 */
  oscP5 = new OscP5(this, 7000);
}


void draw() {
  background(0);
  // Draw the joints of the skeleton
  for (PVector joint : skeleton) {
    if (joint != null) {
      ellipse(joint.x, joint.y, 5, 5);
    }
  }
}

// Scale meters to pixels
PVector scalePos(float x, float y, float z) {
  x *= height/2;
  x += width/2;
  // Flip it upside down
  y *= -height/2;
  y += height;
  z *= 100;
  
  return new PVector(x, y, z);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage m) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+m.addrPattern());
  //println(" typetag: "+m.typetag());
  
  // Clear out skeleton data every 10 frames
  if (frameCount%10 == 0) {
    skeleton = new PVector [jointNames.length];
  }
  for (int jn = 0; jn < jointNames.length; jn++) {
    String jointName = jointNames[jn];
    // Match incoming OSC message with joint name
    if (m.addrPattern().equals(jointName)) {
      float x = m.get(0).floatValue();
      float y = m.get(1).floatValue();
      float z = m.get(2).floatValue();
      // Store the position in pixels, not meters
      skeleton[jn] = scalePos(x, y, z);
    }
  }
}