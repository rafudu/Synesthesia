import java.util.*;

class SynesthesiaList{
  List<Synesthesia> synesthesias = new ArrayList<Synesthesia>();
  List<float[]> points = new ArrayList<float[]>();
  void add(Synesthesia t){
    synesthesias.add(t);
  }
  public void addPoint(float[] point){
    this.points.add(point);
  }
  public void consolidatePoints(){
    // filtra a lista de pontos para 
    setPoints(this.points);
  }
  public void setPoints(List _points){
    
    for (ListIterator<Synesthesia> it = synesthesias.listIterator(synesthesias.size()); it.hasPrevious(); ) {
      Synesthesia s = it.previous();
      s.addPoints(_points);
    }
    this.points.clear();
  }
  
  public void draw(){
    for (ListIterator<Synesthesia> it = synesthesias.listIterator(synesthesias.size()); it.hasPrevious(); ) {
      Synesthesia s = it.previous();
      s.drawZone();
      s.drawElasticZone();
      s.draw();
    }
    
  }
}