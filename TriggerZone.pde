import java.util.*;

class TriggerZone{
  public float x;
  public float y;
  public float width;
  public float height;
  public float x2;
  public float topY;
  public float baseY;
  public boolean openTop = false;
  
  
  TriggerZone(float x, float y, float width, float height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.x2 = this.x+this.width;
    this.topY = this.y;
    this.baseY = this.y+this.height;
  }
  public float baseY(){
    return this.y+this.height;
  }

  public boolean has_point(float x, float y){
    
    if ((x >= this.x && x <= this.x+this.width) && y <= this.y + this.height){
      if(!this.openTop &&  y < this.y){
        return false;
      }else {
        return true;
      }
      
    }else {
      return false;
    }
  }
  void draw(){
    colorMode(RGB);
    fill(0,0,0, 50);
    rect(this.x, this.y, this.width, this.height);
  }
}