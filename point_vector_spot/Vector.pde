class Vector {
  float x, y, speed, direction;
  String v_str;
  Vector (float spd, float dir) {
    x = spd * cos (dir);
    y = spd * sin (dir);
    speed = spd;
    direction = dir * (PI / 180);
    v_str = "<" + str(x) + ", " + str(y) + ">";
   }
  
  Point move_by (Point p) {
    Point newPoint;
    newPoint = new Point (p.x + x, p.y + y);
    return newPoint;
  }
  
}