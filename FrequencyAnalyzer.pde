import processing.sound.*;

class FrequencyAnalyzer{
  FFT fft;
  SoundFile in;
  int bands = 512;
  PApplet app;
  float[] spectrum = new float[bands];

  FrequencyAnalyzer(PApplet app){
    this.app = app;
    fft = new FFT(app, bands);
    in = new SoundFile(app, "music.mp3");
  }
  void setup() {
    in.play();
    
    // patch the AudioIn
    fft.input(in);
  }      
  
  void draw() { 
    
    fft.analyze(spectrum);
    stroke(0,255,0);
    for(int i = 0; i < bands; i++){
    // The result of the FFT is normalized
    // draw the line for frequency band i scaling it up by 5 to get more amplitude.
    line( i, height, i, height - spectrum[i]*height*5 );
    } 
  }
}