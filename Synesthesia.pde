class Synesthesia {
  public float x;
  public float y;
  public float _width;
  public float _height;
  
  public float maxY = -1;
  public float minY = -1;
  public float maxX = -1;
  public float minX = -1;
  public float avg = -1;
  
  
  
  TriggerZone trigger_zone;
  List<float[]> points = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y
  List<float[]> points_normalized = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y, normalizados através da função normalize
  public void bindTriggerZone(TriggerZone z){
    this.trigger_zone = z;
  }
  public float getBaseMinX(){
    return this.trigger_zone.x;
  }
  
  public void setTriggerZone(float x, float y, float _width, float _height){
    this.trigger_zone = new TriggerZone(x,y,_width, _height);
  }
  
  public void clearPoints(){
    this.points.clear();
    minX = -1;
    minY = -1;
    maxX = -1;
    maxY = -1;
  }
  
  public void addPoints(List _points){
    // Aqui eu também aproveito para armazenar algumas informações sobre os pontos: valor y máximo, menor valor de x, maior valor de x, média x, média y...
    clearPoints();
    for (ListIterator<float[]> it = _points.listIterator(_points.size()); it.hasPrevious(); ) {
      float[] t = it.previous();
      if(this.trigger_zone.has_point(t[0], t[1])){
        float pX = t[0];
        float pY = t[1];
        // Primeiro eu marco o primeiro valor de X que tem um ponto associado.
        if(pY <= this.trigger_zone.baseY()){
          minX = pX;
        }
        // Depois computo o maior valor de X e maior valor de Y
        if(pX > maxX){
           maxX = pX; 
        }
        if(pY > maxY){
          maxY = pY;
        }
        if(minY == -1 || pY < minY){
          minY = pY;
        }
       
        this.points.add(t);
      }
    }
  }
  public void drawElasticZone(){
    float tzX1 = this.trigger_zone.x; //TriggerZone initial x
    float tzX2 = this.trigger_zone.x2; // TriggerZone final x;
    float tzY1= this.trigger_zone.topY; // TriggerZone base Y
    float tzY2= this.trigger_zone.baseY; // TriggerZone top Y
    float tzHeight = 0;
    
    if(minX > tzX1){
      tzX1 = minX;
    }
    if(maxX > minX && maxX < tzX2){
      tzX2 = maxX;
    }
    //if(minY < this.trigger_zone.topY){
      tzY1 = minY;
    //}
    println(this.trigger_zone.topY, "y");
    colorMode(RGB);
    stroke(255, 255,255);
    rect(tzX1, tzY1, tzX2 - tzX1, tzY2-tzY1); 
    noStroke();
  }
  public void drawZone(){
    this.trigger_zone.draw();
    
  }
  public void draw(){
    if(this.points.size() > 0){
      //println("..");
      //println(this.points.size());
    }else {
      //println("---");
    }
    
  }
  public void trigger(){}
}