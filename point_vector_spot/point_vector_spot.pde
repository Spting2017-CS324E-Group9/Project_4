/* This program displays a moving red sphere using the Point, Vector and Spot clasees. */

Point a;
Vector v;
Spot p;

void setup () {
  size (800, 800);
  a = new Point (400, 400);
  v = new Vector (1, PI / 4);
  p = new Spot (a, v, 20);
  p = new Spot (a, v, 20);

}

void draw () {
  background (0);
  
  fill (255, 0, 0);
  p.display ();
  p.move ();

}