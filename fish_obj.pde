fish myFish;
fish myFish2;
color oceancolor = color(#08B0CB);
float fish1Speed = -0.04;
float fish2Speed = -0.03;
float m1 = 0.8;
float m2 = 0.8;
float fishSize = 0.8;

void setup(){
  size(600,600);
  //background(#4F95F5);
  myFish = new fish(100,730,-0.03,color(#98BCBB), fishSize);
  myFish2 = new fish(-10,730,-0.03,color(#E8A9A9), 0.6);
}

void draw(){
  
  
  myFish.move(myFish.fish,myFish2.fish,#4F95F5,fish1Speed,fish2Speed);
  
  if(frameCount%9==0){
    m1 = m1*-1;
  }
  myFish.finMove(myFish.fish,myFish2.fish,m1);

 
}