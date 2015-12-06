import java.util.*;

class TriggerZone{
  public float x;
  public float y;
  public float width;
  public float height;
  TriggerZone(float x, float y, float width, float height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  public boolean has_point(float x, float y){
    return (x >= this.x && x <= this.x+this.width && y >= this.y && y <= this.y + this.height);
  }
  void draw(){
    colorMode(RGB);
    fill(0,0,0, 50);
    rect(this.x, this.y, this.width, this.height);
  }
}