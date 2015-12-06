import processing.sound.*;
SynesthesiaMapper mapper;




void setupSynesthesias(){
  Synesthesia s = new VHS();
  s.setTriggerZone(10,10,70,200);
  mapper.addSynesthesia(s);
  
}

void setup(){
  size(500,500);
  background(0);
  mapper = new SynesthesiaMapper(new FrequencyAnalyzer(this));
  setupSynesthesias();
}
void draw(){
  noStroke();
  fill(0xAA000000);
  rect(0,0,width,height);
  mapper.draw();
}