class Synesthesia {
  public float x;
  public float y;
  public float width;
  public float height;
  TriggerZone trigger_zone;
  List<float[]> points = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y
  List<float[]> points_normalized = new ArrayList<float[]>(); // Os pontos que estão dentro da área de gatilho, com coordenadas x e y, normalizados através da função normalize
  public void bindTriggerZone(TriggerZone z){
    this.trigger_zone = z;
  }
  public void setTriggerZone(float x, float y, float width, float height){
    this.trigger_zone = new TriggerZone(x,y,width, height);
  }
  
  public void addPoints(List _points){
    this.points.clear();
    for (ListIterator<float[]> it = _points.listIterator(_points.size()); it.hasPrevious(); ) {
      float[] t = it.previous();
      if(this.trigger_zone.has_point(t[0], t[1])){
        this.points.add(t);
      }
    }
  }

  public void drawZone(){
    this.trigger_zone.draw();
  }
  public void draw(){
    if(this.points.size() > 0){
      println(this.points.size());
    }else {
      println("---");
    }
    this.points.clear();
  }
  public void trigger(){}
}