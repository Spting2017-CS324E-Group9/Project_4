class Spot {
  Point cen;
  Vector vec;
  float rad;
  Spot (Point center, Vector vector, float radius) {
    cen = center;
    vec = vector;
    rad = radius;
  }
  
  void display () {
    ellipse(cen.x, cen.y, rad, rad);
  }
  
  void move () {
    cen = vec.move_by (cen);
  }
}