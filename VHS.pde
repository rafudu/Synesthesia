class VHS extends Synesthesia{
  float noiseScale = 0.02;
  float opacity = 0;
  public void setOpacity(float opacity){
    this.opacity = map(opacity, 0, 100, 0, 255);
  }
  void setup(){
    size(300,300);
  }
  void draw() {
    colorMode(RGB);
    background(0);
      
    randomSeed(frameCount);
    pushMatrix();
    int displacement = (frameCount%height);   
    translate(0, displacement-1);
      for (int i=0; i < height+displacement; i++) {
        float r = random(0, 255);
        int fc = frameCount%100;
        stroke(r,r,r,this.opacity);//, 255,255);
        int noiseStart = round(random(0,100));
        if(fc > noiseStart && fc < noiseStart+2){
          displacement = 0;
        }
        float start = i-displacement;
        float end = i-displacement;
        line(0,start,width, end);
      }
     popMatrix();
  }
}  