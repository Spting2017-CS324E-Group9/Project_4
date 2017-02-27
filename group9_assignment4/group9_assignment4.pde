  
import processing.sound.*;
SoundFile file;

//Create Two Clouds ands Seven Waves
Blobby Clo1,Clo2,Wa1,Wa2,Wa3,Wa4,Wa5,Wa6,Wa7;
//Define CrabShapes
PShape crab, crab_legs,crab_eyes,crab_claws;
animated_crab some_crab, another_crab;
float _i,j,k;
color some_color, another_color;
//define fish variables
fish myFish;
fish myFish2;
color oceancolor = color(#08B0CB);
float fish1Speed = -0.04;
float fish2Speed = -0.03;
float m1 = 0.8;
float m2 = 0.8;
float fishSize = 0.8;

float x1,x2,y1,y2;

void setup () {
  size(1000,800);
    //sound stuff
  file = new SoundFile(this, "ocean.mp3");
  file.play();

  Clo1 = new Blobby();
  Clo2 = new Blobby();
  x1 = random(width/5);
  x2 = random(4*width/5,width);
  y1 = random(100,height/5);
  y2 = random(100,height/5);
  // Define two clouds with a size of 20-50 and a journey with an archeight of -50 to 50
  Clo1.Cloud(random(20,50),random(-100,100),x1,y1);
  Clo2.Cloud(random(20,50),random(-100,100),x2,y2);
  // Define 7 Waves
  Wa1 = new Blobby();
  Wa2 = new Blobby();
  Wa3 = new Blobby();
  Wa4 = new Blobby();
  Wa5 = new Blobby();
  Wa6 = new Blobby();
  Wa7 = new Blobby();
  // initialize 7 waves
  Wa1.Wave(width/10,0,height/3);
  Wa2.Wave(width/10,width/6,height/3);
  Wa3.Wave(width/10,width/3,height/3);
  Wa4.Wave(width/10,width/2,height/3);
  Wa5.Wave(width/10,2*width/3,height/3);
  Wa6.Wave(width/10,5*width/6,height/3);
  Wa7.Wave(width/10,width,height/3);
  //Here we setup the crabs
  some_color = color (200, 0, 0);
  another_color = color (200, 200, 200);
  some_crab = new animated_crab( some_color);
  another_crab = new animated_crab (another_color);
  _i = 0;
  j = 0;
  k = 0;
  
  //Fish stuff
 myFish = new fish(500,730,-0.03,color(#98BCBB), fishSize);
  myFish2 = new fish(390,730,-0.03,color(#E8A9A9), 0.6);

}
void draw() {
  // define iterator for 
  float i = frameCount % width; 
 //Create sky
 background(138,225,255);
 //define rotation speed
 float rot = i*2*PI/(2*width);
 float waverot = rot*2;
 //Calculate y coord of clouud using lagrang polynomial
 float p = Clo1.y_pos(x1+i);
 float q = Clo2.y_pos(x2-i);
 //Display clouds
 Clo1.display(x1 + i,p,rot);
 Clo2.display(x2 - i,q,rot);
 //create fish
  myFish.move(myFish.fish,myFish2.fish,#4F95F5,fish1Speed,fish2Speed);
  
  if(frameCount%9==0){
    m1 = m1*-1;
  }
  myFish.finMove(myFish.fish,myFish2.fish,m1);
 //Display waves
 Wa1.display(0,6*height/10,waverot);
 Wa2.display(width/6,6*height/10,waverot);
 Wa3.display(width/3,6*height/10,waverot);
 Wa4.display(width/2,6*height/10,waverot);
 Wa5.display(2*width/3,6*height/10,waverot);
 
 Wa6.display(5*width/6,6*height/10,waverot);
 Wa7.display(width,6*height/10,waverot);
 //create beach
 fill(225,246,40);
 rect(0,height/2,width,height);
 //create crabs
 stroke(5);
 some_crab.travel (200, 450, 400, 450, _i, 1);
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
  _i += 0.01;
   
   fill (0, 200, 0);
   pushMatrix ();
   translate (width / 2, height / 2);
   scale (1, -1);
   stroke (0);
   strokeWeight (2);
   bezier (-700, -100, -400, -50, 100, -150, 400, -400);
   noStroke ();
   triangle (-700, -100, 400, -400, -700, -400);
   stroke (0);
   strokeWeight (2);
   bezier (-500, -400, -50, -200, 150, -150, 700, -200);
   noStroke ();
   triangle (-500, -400, 700, -200, 700, -400);
   popMatrix ();
  
}