import processing.sound.*;
SynesthesiaMapper mapper;
Synesthesia s = new VHS();



void setupSynesthesias(){
  
  s.setTriggerZone(10,height-100,70,50);
  mapper.addSynesthesia(s);
  
}

void setup(){
  size(500,500);
  background(0);
  mapper = new SynesthesiaMapper(new FrequencyAnalyzer(this));
  setupSynesthesias();
}
void draw(){
  s.setTriggerZone(mouseX,mouseY-150,70,150);
  //s.setTriggerZone(200,200,100,100);
  noStroke();
  fill(0xAA000000);
  rect(0,0,width,height);
  mapper.draw();
}