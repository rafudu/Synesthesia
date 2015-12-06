class Synesthesia {
  public float x;
  public float y;
  public float width;
  public float height;
  TriggerZone trigger_zone;
  List<float[]> points; // Os pontos que estão dentro da área de gatilho, com coordenadas x e y
  List<float[]> points_normalized; // Os pontos que estão dentro da área de gatilho, com coordenadas x e y, normalizados através da função normalize
  public void bindTriggerZone(TriggerZone z){
    this.trigger_zone = z;
  }
  public void setTriggerZone(float x, float y, float width, float height){
    this.trigger_zone = new TriggerZone(x,y,width, height);
  }
  
  public void addPoints(List points){
    this.points.clear();
    for (ListIterator<float[]> it = points.listIterator(points.size()); it.hasPrevious(); ) {
      float[] t = it.previous();
      if(this.trigger_zone.has_point(t[0], t[1])){
        this.points.add(t);
      }
    }
  }

  
  public void draw(){
    println("Draw synesthesia");
  }
  public void trigger(){}
}