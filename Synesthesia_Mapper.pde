TriggerZones zones = new TriggerZones();
FrequencyAnalyzer f;
Mapper m = new Mapper();
VHS vhs = new VHS();
class Mapper {
  public FrequencyAnalyzer f;
  Mapper(){
    
  }
  public void setAnalyzer(FrequencyAnalyzer f){
    this.f = f;
  }
  void setup(){
    f.setup();
  }

  
  void draw(){
    f.draw();
  }
}
void setup(){
  noStroke();
  background(0);
  
  size(500,500);
  
  zones.addZone(new TriggerZone(10,height-200,70,40, vhs));
  zones.addZone(new TriggerZone(90,height-200,40,40, vhs));
  m.setAnalyzer(new FrequencyAnalyzer(this, zones));
  m.f.setup();
  
}
void draw(){
  
  
  colorMode(HSB);
  fill(0x0A000000);
  rect(0,0, width, height);
  vhs.draw();
  
  m.f.draw();
}