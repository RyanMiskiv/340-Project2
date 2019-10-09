  
import processing.sound.*;
SoundFile water;
SoundFile background;
AudioIn in;
Amplitude analyzer;
float backgroundVol = 0.7;
float waterVol = 0.2;

void setup() {
  size(2000, 2000);
  background(0);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  background = new SoundFile(this, "frogsAmbient.wav");
  background.loop(1, 0, backgroundVol);
  
  water = new SoundFile(this, "riverLoop.wav");
  water.loop(1, 0, waterVol);
  
  in = new AudioIn(this, 0);
  in.start();
  
  analyzer = new Amplitude(this);
  analyzer.input(in);
}      

void draw() {
  
  float vol = analyzer.analyze();
  background.amp(backgroundVol);
  water.amp(waterVol);
  
  //vol must be adjusted to room volume
    if(vol > 0.1 && background.isPlaying() && water.isPlaying()){
    
    if(backgroundVol>0){
      backgroundVol -= (float)random(0.01);
    }else if(backgroundVol<0){
      backgroundVol = 0;
    }
    
    if(waterVol>0){
      waterVol -= (float)random(0.005);
    }else if(waterVol<0){
      waterVol = 0;
    }
    
  }else{
    
    backgroundVol += (float)random(0.01);
    if(backgroundVol>0.7){
      backgroundVol = 0.7;
    }
    
    waterVol += (float)random(0.005);
    if(waterVol>0.2){
      waterVol = 0.2;
    }
    
  }
  
  println(vol);
  println(waterVol);

}
