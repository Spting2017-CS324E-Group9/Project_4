/* A Spot object is a moving sphere that has a center (Point object), vector (Vector object) and radius.
The display method can be called in draw to display the Spot on the canvas.
The move method shifts the center of the sphere in the direction of the Spot's vector using the move_by Vector method. */

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