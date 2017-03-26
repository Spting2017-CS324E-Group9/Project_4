Shepherd s;
PImage img;

void setup(){
  size(1000,700);
  img = loadImage("shepherd.png");
  s = new Shepherd(img,300,300);
  
}

void draw(){
  background(200,130,100);
  s.display();
  s.move(loc);
  
}