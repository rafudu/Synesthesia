

TriggerZones zones = new TriggerZones();
FrequencyAnalyzer f;
void setup(){
  noStroke();
  background(0);
  
  size(500,500);
  TriggerZone t = new TriggerZone(250,250,40,40);
  TriggerZone t2 = new TriggerZone(150,150,40,40);
  zones.addZone(t);
  zones.addZone(t2);
  FrequencyAnalyzer f = new FrequencyAnalyzer(this);
  f.setup();
  
}

void draw(){
  f.draw();
  zones.drawZones();
  colorMode(HSB);
  fill(0x0A000000);
  rect(0,0, width, height);
  


}