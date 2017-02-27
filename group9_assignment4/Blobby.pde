class Blobby { 
  float x, y,radius,arc,startX,startY;
  color fill, stroke;
  float[] humpArray = new float[9];
  
  //Here we use a LaGrange polynomial to create a path for the clouds
  float y_pos(float _x) {
  float z; 
  z = startY*((_x-width/2)*(_x-width+startX))/((startX-width/2)*(startX-width+startX)) +
              (startY + arc)*((_x-startX)*(_x-width+startX))/((width/2-startX)*(width/2-width+startX)) +
              startY*((_x-startX)*(_x-width/2))/((width-startX-startX)*(width-startX-width/2));
                return(z);
  }
  //Here we display  
  void display(float _x, float _y, float rot) {
    x =_x;
    y =_y;
    fill(fill);
    stroke(stroke);
    PShape Blob = createShape(GROUP);
    for ( int i =0; i <9; i++) {
      PShape Puff;
      Puff = createShape(ARC,0,-.8*radius,radius,humpArray[i],PI,2*PI);
      Puff.rotate(2*PI/9 * i + rot);
      Blob.addChild(Puff);
    }
    noStroke();
    PShape Core = createShape(ELLIPSE, 0,0, 2*radius, 2*radius);
    Blob.addChild(Core);
    Blob.scale(2,1);
    shape(Blob,x,y);
  }
  //Here we define our cloud subclass
  void Cloud(float _radius, float _arc,float _x,float _y) {
    startX = _x;
    startY = _y;
    arc = _arc;
    radius = _radius;
    fill = 255;
    stroke = color(207, 213, 247);
    for ( int i =0; i <9; i++) {
      float h = random(2*radius/3,5*radius/4);
      humpArray[i] = h;
    }
  }
  //Here we define our wave subclass
  void Wave(float _radius, float _x, float _y) {
    x = _x;
    y = _y;
    radius = _radius;
    fill = color(54,159,255);
    stroke = color(253,152,255);
    for ( int i =0; i <9; i++) {
      float h = random(2*radius/3,5*radius/4);
      humpArray[i] = h;
    }
}
}