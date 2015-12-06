import processing.sound.*;

class FrequencyAnalyzer{
  FFT fft;
  SoundFile in;
  AudioIn ain;
  int bands = 2048;
  PApplet app;
  float[] spectrum = new float[bands];
  TriggerZones zones;
  FrequencyAnalyzer(PApplet app, TriggerZones zones){
    this.app = app;
    this.zones = zones;
    fft = new FFT(app, bands);
    this.in = new SoundFile(app, "music.mp3");
    this.ain = new AudioIn(app, 0);
  }
  void setup() {
        
    //this.ain.start();
    //fft.input(ain);
    
    this.in.play();
    fft.input(in);
  }      
  
  
  void draw() {
    zones.drawZones();
    vhs.setOpacity(0);
    fft.analyze(spectrum);
    colorMode(HSB);
    stroke(app.frameCount%255,255, 255);
    boolean callVHS = false;
    float opacity = 0;
    for(int i = 0; i < bands; i++){
      
    float lineY = height - spectrum[i]*height*5;
    if( i >=10 && i <= 70 && lineY <= height-200){
      opacity = map(lineY, 0, height, 0, 100);
      vhs.setOpacity(opacity);      
    }else {
    }
    
    app.line( i, height, i, lineY );
    
    }
    if(callVHS){
      println("VHS");
      
    }
  }
}