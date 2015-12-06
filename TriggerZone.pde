import java.util.*;

class TriggerZone{
  public float x;
  public float y;
  public float width;
  public float height;
  public Synesthesia synesthesia;
  
  TriggerZone(float x, float y, float width, float height, Synesthesia synesthesia){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.synesthesia = synesthesia;
  }
  public boolean has_point(float x, float y){
    return (x >= this.x && x <= this.x+this.width && y >= this.y && y <= this.y + this.height);
  }
  public void feel_it(){
    this.synesthesia.trigger();
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
  public void trigger(float x, float y){
    for (ListIterator<TriggerZone> it = zones.listIterator(zones.size()); it.hasPrevious(); ) {
      TriggerZone t = it.previous();
      if(t.has_point(x,y)){
        t.synesthesia.draw();
      }
    }
  }
  void drawZones(){
    colorMode(RGB);
    for (ListIterator<TriggerZone> it = zones.listIterator(zones.size()); it.hasPrevious(); ) {
      TriggerZone t = it.previous();
      noStroke();
      fill(frameCount%255, 255,255);
      rect(t.x, t.y, t.width, t.height);
    }
  }
}