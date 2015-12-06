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
  void ddraw(){
    fill(255,255,255);
    rect(this.x, this.y, this.width, this.height);
  }
}

class TriggerZones{
  List<TriggerZone> zones = new ArrayList<TriggerZone>();
  void addZone(TriggerZone t){
    zones.add(t);
  }
  void drawZones(){
    //colorMode(RGB);
    for (ListIterator<TriggerZone> it = zones.listIterator(zones.size()); it.hasPrevious(); ) {
      TriggerZone t = it.previous();
      noStroke();
      fill(frameCount%255, 255,255);
      
      rect(t.x, t.y, t.width, t.height);
    }
  }
}