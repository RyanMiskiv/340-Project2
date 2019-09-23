//Project 2 Prototype 1
//Created by Miya Fordah
//Edited by
//I haven't added delay or any computer chosen motion yet but it kinda gets the point across with some explanation...

int x = 190;
int y = 190;
int count = 1;
int alphaSmall = 0;
int alphaLarge = 0;

void setup(){
  size(2000, 2000);
}


void draw(){
  background(0);
  noCursor();
  
  //400 Lights
  int x = 190;
  while(x <= 1800){
    int y = 190;
    while(y <= 1800){
      if(
        //mock commotion
        mousePressed
        && mouseX < x+100
        && mouseX > x-100
        && mouseY < y+100
        && mouseY > y-100
      ){
        //lights off
        alphaSmall = 0;
        fill(#3388FC, alphaSmall);
        noStroke();
        circle(x, y, 10);
        
        alphaLarge = 0;
        fill(#3388FC, alphaLarge);
        noStroke();
        circle(x, y, 100);
      }else if(
        mousePressed
        && mouseX < x+300
        && mouseX > x-300
        && mouseY < y+300
        && mouseY > y-300
      ){
        //lights faded
        alphaSmall = 70;
        fill(#3388FC, alphaSmall);
        noStroke();
        circle(x, y, 10);
        
        alphaLarge = 30;
        fill(#3388FC, alphaLarge);
        noStroke();
        circle(x, y, 100);
      }else{
        //lights on
        alphaSmall = 255;
        fill(#3388FC, alphaSmall);
        noStroke();
        circle(x, y, 10);
        
        alphaLarge = 50;
        fill(#3388FC, alphaLarge);
        noStroke();
        circle(x, y, 100);
      }
      y = y + 100;
    }
    x = x + 100;
  }
}
