import processing.sound.*;
SynesthesiaMapper mapper;




void setupSynesthesias(){
  Synesthesia s = new Synesthesia();
  s.setTriggerZone(10,height-200,70,40);
  mapper.addSynesthesia(s);
  
}

void setup(){
  size(500,500);
  background(0);
  mapper = new SynesthesiaMapper(new FrequencyAnalyzer(this));
  setupSynesthesias();
}
void draw(){
  mapper.draw();
}