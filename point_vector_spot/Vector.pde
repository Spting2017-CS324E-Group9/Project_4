/* A vector has a speed and a direction from which we can calculate x and y components. 
The direction value has to be in radians. There is also a String v_str for printing. 
The method move_by takes a Point object and moves it in the direction of the vector by the given speed. */

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