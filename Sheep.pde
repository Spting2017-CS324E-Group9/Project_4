class Sheep {
  float[] humpArray = new float[9];
  float x,y,r;
  PShape Blob;
  void display() {
    shape(Blob,x,y);
  }
  void move (float _x, float _y) {
    x += _x;
    y += _y;
  }
  Sheep (float _x, float _y, float _r) {
    x = _x;
    y = _y;
    r = _r;
    for ( int i =0; i <9; i++) {
      float h = random(2*r/3,5*r/4);
      humpArray[i] = h; 
    }
    PShape Blo = createShape(GROUP);
    strokeWeight(6);
    stroke(0);
    PShape leg1 = createShape(LINE,-10,10,-10,40);
    PShape leg2 = createShape(LINE,10,10,10,40);
    Blo.addChild(leg1);
    Blo.addChild(leg2);
    fill(255);
    strokeWeight(1);
    stroke(207, 213, 247);
    
    for ( int i =0; i <9; i++) {
      PShape Puff;
      Puff = createShape(ARC,0,-.8*r,r,humpArray[i],PI,2*PI);
      Puff.rotate(2*PI/9 * i);
      Blo.addChild(Puff);
    }
    noStroke();
    PShape Core = createShape(ELLIPSE, 0,0, 2*r, 2*r);
    Blo.addChild(Core);
    stroke(2);
    fill(207, 213, 247);
    PShape head = createShape(ELLIPSE, -20,0,16,20);
    Blo.addChild(head);
    Blo.scale(2,1);
    Blob = Blo;
  }
}