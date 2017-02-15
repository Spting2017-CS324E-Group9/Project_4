/* This class is pretty simple. A Point has an x coordinate and a y coordinate.
I also added a String p_str so that you can print a Point in a way that looks like an ordered pair. */

class Point {
  float x, y;
  String p_str;
  Point (float x_coord, float y_coord) {
    x = x_coord;
    y = y_coord;
    p_str = "(" + str(x) + ", " + str(y) + ")";
  }
  
}