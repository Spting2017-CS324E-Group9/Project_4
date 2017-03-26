//I create an array of 8 sheep
Sheep[] Flock = new Sheep[8];
//I create an array of the x,y coordinates of the sheep
float[][] loc = new float[10][2];

void setup() {
  size(1000,700);
  
  for (int i =0; i <8; i ++) {
    boolean cont = true;
    while (cont == true) {
      float x = random(.1*width,.9*width);
      float y = random(.1*height,.9*height);
      if (i == 0) {
        cont = false;
        loc[i][0] = x;
        loc[i][1] = y;
      }
      else {
        for (int j =0; j <i; j++) {
          if( dist(x,y,loc[j][0],loc[j][1]) < 100) {
            break;
          }
          if (j == i-1) {
            cont = false;
            loc[i][0] = x;
            loc[i][1] = y;
          }
        }
      }
    }
    float r = 20;
    float x = loc[i][0];
    float y = loc[i][1];
    Flock[i] = new Sheep(x,y,r);
  }
  
}

void draw() {
  background(30,250,70);
  for (int i = 0; i<8; i++) {
    Flock[i].display();
  }
  
  //Here I add the differences of the x and y vectors of the other sheep
  //so the sheep know how to find each other
  for (int i =0; i <8; i++) {
    float x = 0;
    float y = 0;
    for (int j=0;j<8;j++) {
      if (j != i && dist(loc[j][0],loc[j][1],loc[i][0],loc[i][1])<300
          && dist(loc[j][0],loc[j][1],loc[i][0],loc[i][1])>50) {
        x += loc[j][0]-loc[i][0];
        y += loc[j][1]-loc[i][1];
      }
    }
    float a =.001*(x-loc[i][0]);
    float b =.001*(y-loc[i][1]);
    Flock[i].move(a,b);
    loc[i][0] += a;
    loc[i][1] += b;
  }
    
    
  
}