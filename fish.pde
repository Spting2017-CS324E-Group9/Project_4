

class fish {
  
  color fishcolor;
  float xpos;
  float ypos;
  float xspeed;
  PShape fish;
  
  
  fish(float x, float y, float speed, color c, float fishSize){
    fishcolor = c;
    xpos = x;
    ypos = y;
    xspeed = speed;
    fish = createShape(GROUP);
    
    PShape head = createShape(ELLIPSE,220,130,110,60);
    head.setStroke(false);
    head.setFill(fishcolor);
    
    PShape tail = createShape();
    tail.setStroke(false);
    tail.setFill(fishcolor);
    tail.beginShape();
    //Top Tail
    tail.vertex(100,100);
    tail.vertex(120,120);
    tail.vertex(180,100);
    //Bottom Tail
    tail.vertex(180,160);
    tail.vertex(120,140);
    tail.vertex(100,160);
    tail.endShape(CLOSE);
    
    PShape body = createShape();
    body.setFill(fishcolor);
    body.setStroke(false);
    //Body
    body.beginShape();
    body.vertex(180,100);
    body.vertex(220,100);
    body.vertex(220,160);
    body.vertex(180,160);
    body.endShape();
    
    PShape eye = createShape(ELLIPSE,255,138,18,18);
    eye.setFill(#E9F094);
    eye.setStroke(#878970);
    PShape pupil = createShape(ELLIPSE,255,138,10,10);
    pupil.setFill(0);
    
    PShape mouth = createShape(LINE,275,125,245,120);
    mouth.setStroke(0);
    
    PShape topFin = createShape(QUAD,180,160, 175,165, 200,182, 220,160);
    topFin.setFill(#708988);
    topFin.setStroke(false);
    
    PShape bottomFin = createShape(TRIANGLE,160,90, 180,100, 166,110); 
    bottomFin.setFill(fishcolor);
    bottomFin.setStroke(false);
    
    PShape mainFin = createShape(TRIANGLE,220,80, 230,120, 215,130);
    mainFin.setFill(#878970);
    
    
    fish.addChild(head);
    fish.addChild(body);
    fish.addChild(tail);
    fish.addChild(eye);
    fish.addChild(pupil);
    fish.addChild(mouth);
    fish.addChild(topFin);
    fish.addChild(bottomFin);
    fish.addChild(mainFin);
    
    fish.rotate(-.5);
    fish.translate(xpos,ypos);
    fish.scale(fishSize);    
    
  }
  
  void move(PShape myFish,PShape myFish2, color background, float r, float r2){

      myFish.rotate(r); 
      myFish2.rotate(r2);
      background(background);
      shape(myFish); 
      shape(myFish2);

  }
  
  void finMove(PShape myFish,PShape myFish2,float m){
      PShape mainFin = myFish.getChild(8);
      mainFin.translate(m,0);
      PShape mainFin2 = myFish2.getChild(8);
      mainFin2.translate(m,0);
      
  }

  
}