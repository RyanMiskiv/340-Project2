//Unused

class BlueLights{
  private int x;
  private int y;
  
  public BlueLights(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void create(){
    fill(#3388FC);
    noStroke();
    circle(x, y, 20);
  }
  
  void destroy(){
    circle(x, y, 0);
  }
}
