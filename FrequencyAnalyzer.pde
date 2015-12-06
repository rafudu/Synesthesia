class FrequencyAnalyzer{
  FFT fft;
  SoundFile in;
  AudioIn ain;
  int bands = 2048;
  PApplet app;
  float[] spectrum = new float[bands];
  List<Synesthesia> synesthesias;
  SynesthesiaList synesthesia_list = new SynesthesiaList();
  FrequencyAnalyzer(PApplet app){
    this.app = app;
    fft = new FFT(app, bands);
    this.in = new SoundFile(app, "music.mp3");
    this.ain = new AudioIn(app, 0);
  }
  
  public void addSynesthesia(Synesthesia s){
    synesthesia_list.add(s);
  }
  
  void setup() {
    //this.ain.start();
    //fft.input(ain);
    this.in.play();
    fft.input(in);
  }
  void draw() {
    colorMode(HSB);
    fft.analyze(spectrum);
    stroke(app.frameCount%255,255, 255);
    for(int i = 0; i < bands; i++){
      float lineY = height - spectrum[i]*height*5;
      float[] point = new float[2];
      point[0] = i;
      point[1] = lineY;
      synesthesia_list.addPoint(point);
      app.line( i, height, i, lineY );
    }
    synesthesia_list.consolidatePoints();
    synesthesia_list.draw();
  }
}