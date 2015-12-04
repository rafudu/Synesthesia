TriggerZones zones = new TriggerZones();
FrequencyAnalyzer f;
Mapper m = new Mapper();
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
  TriggerZone t = new TriggerZone(250,250,40,40);
  TriggerZone t2 = new TriggerZone(150,150,40,40);
  zones.addZone(t);
  zones.addZone(t2);
  m.setAnalyzer(new FrequencyAnalyzer(this)); 
  m.f.setup();
  
}

void draw(){
  
  zones.drawZones();
  colorMode(HSB);
  fill(0x0A000000);
  rect(0,0, width, height);
  m.f.draw();
}