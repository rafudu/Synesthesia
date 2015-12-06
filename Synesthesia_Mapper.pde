import processing.sound.*;

SynesthesiaMapper mapper;

class SynesthesiaMapper {
  FrequencyAnalyzer frequency_analyzer;
  SynesthesiaMapper(FrequencyAnalyzer frequency_analyzer){
    this.frequency_analyzer = frequency_analyzer;
    frequency_analyzer.setup();
  }
  void draw(){
    frequency_analyzer.draw();
  }
  
}


void setupSynesthesias(){
  Synesthesia s = new Synesthesia();
  s.setTriggerZone(10,height-200,70,40);
  //frequency_analyzer.addSynesthesia(s);
  
}

void setup(){
  size(500,500);
  background(0);
  mapper = new SynesthesiaMapper(new FrequencyAnalyzer(this));
}
void draw(){
  mapper.draw();
}