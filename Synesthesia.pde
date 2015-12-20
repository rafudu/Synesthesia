class Synesthesia {
  public float x;
  public float y;
  public float _width;
  public float _height;
  
  
  TriggerZone trigger_zone;
  TriggerZone elastic_zone;
  
  boolean elastic_zone_crop_x = false;
  boolean elastic_zone_crop_y = true;
  boolean elastic_zone_lock_base_y = true;
  boolean elastic_zone_below_top_y = true;
  boolean elastic_zone_above_top_y = false;
  
  List<float[]> points = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y
  List<float[]> points_normalized = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y, normalizados através da função normalize
  List<Float> pointsX = new ArrayList();
  List<Float> pointsY = new ArrayList();
  float pointsArea = 0;
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
    pointsArea = 0;
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
    float xLeft, xRight, yTop, yBottom;
    if(this.points.size() > 0){
      if(elastic_zone_crop_x){
         xLeft = this.pointsX.get(0);
         xRight = this.pointsX.get(this.pointsX.size()-1);
      }else {
         xLeft = this.trigger_zone.x;
         xRight = this.trigger_zone.x2;
      }
      if(elastic_zone_crop_y){
         if((this.pointsY.get(0) < this.trigger_zone.topY && elastic_zone_above_top_y) || (this.pointsY.get(0) > this.trigger_zone.topY && elastic_zone_below_top_y) ){
           yTop = this.pointsY.get(0);
         }else {
           yTop = this.trigger_zone.topY;
         }
         
        if(elastic_zone_lock_base_y){
           yBottom = this.trigger_zone.baseY;
        }else {
            yBottom = this.pointsY.get(this.pointsY.size()-1);
        }
      }else {
        yTop = trigger_zone.topY;
        yBottom = trigger_zone.baseY;
      }
      
      
      
      this.elastic_zone = new TriggerZone(xLeft,yTop,xRight-xLeft, yBottom-yTop);
    }else {
      this.elastic_zone = this.trigger_zone;
    }
  }
  public void drawElasticZone(){
    
    if(this.elastic_zone != null){
      colorMode(RGB);
      stroke(255,255,255);
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