class Synesthesia {
  public float x;
  public float y;
  public float _width;
  public float _height;
  
  
  TriggerZone trigger_zone;
  TriggerZone elastic_zone;
  List<float[]> points = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y
  List<float[]> points_normalized = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y, normalizados através da função normalize
  List<Float> pointsX = new ArrayList();
  List<Float> pointsY = new ArrayList();
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
    pointsX.clear();
    pointsY.clear();
  
  }
  
  public void addPoints(List _points){
    // Aqui eu também aproveito para armazenar algumas informações sobre os pontos: valor y máximo, menor valor de x, maior valor de x, média x, média y...
    clearPoints();
    for (ListIterator<float[]> it = _points.listIterator(_points.size()); it.hasPrevious(); ) {
      float[] t = it.previous();
      if(this.trigger_zone.has_point(t[0], t[1])){
        float pX = t[0];
        float pY = t[1];
        pointsX.add(pX);
        pointsY.add(pY);
        Collections.sort(pointsX);
        Collections.sort(pointsY);
        this.points.add(t);
      }
    }
    setupElasticZone();
  }
  public void setupElasticZone(){
    if(this.points.size() > 0){
      float xLeft = this.pointsX.get(0);
      float xRight = this.pointsX.get(this.pointsX.size()-1);
      float yTop = this.pointsY.get(0);
      float yBottom = this.pointsY.get(this.pointsY.size()-1);
      this.elastic_zone = new TriggerZone(xLeft,yTop,xRight-xLeft, yBottom-yTop);
    }else {
      this.elastic_zone = this.trigger_zone;
    }
  }
  public void drawElasticZone(){
    
    if(this.elastic_zone != null){
      this.elastic_zone.draw();
    }
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