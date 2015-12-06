class SynesthesiaMapper {
  FrequencyAnalyzer frequency_analyzer;
  SynesthesiaMapper(FrequencyAnalyzer frequency_analyzer){
    this.frequency_analyzer = frequency_analyzer;
    frequency_analyzer.setup();
  }
  
  public void addSynesthesia(Synesthesia s){
    frequency_analyzer.addSynesthesia(s);
  }
  void draw(){
    frequency_analyzer.draw();
  }
  
}