PShape crab;
PShape crab_legs;
PShape crab_eyes;
PShape crab_claws;
float i, j, k;
color some_color, another_color;
animated_crab some_crab, another_crab;

void setup () {
  size (1400, 800); 
  some_color = color (200, 0, 0);
  another_color = color (200, 200, 200);
  some_crab = new animated_crab (some_color);
  another_crab = new animated_crab (another_color);
  i = 0;
  j = 0;
  k = 0;
}


void draw () {
  background (50);
  
  // draw grid for reference while developing
 strokeWeight(0);
 stroke (150);
 for (int i = 0; i < width; i = i + 100) {
   line (i, 0, i, height);
 }
 
 for (int i = 0; i < height; i = i + 100) {
   line (0, i, width, i); 
 }
  // travel takes two x,y point values between which to travel back and forth, an interator, and a scale
  some_crab.travel (200, 400, 400, 400, i, 1);
  // move_legs takes an iterator
  some_crab.move_legs (j);
  
  // display takes x,y center values and a scale
  another_crab.display (800, 500, 0.7);
  // move_eyes takes an iterator
  another_crab.move_eyes (k);
  // move_arms takes an iterator
  another_crab.move_arms (k);
  k += 0.03;
  j += 0.04;
  i += 0.01;
  
}