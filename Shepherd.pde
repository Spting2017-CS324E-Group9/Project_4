class Shepherd{
  float x;
  float y;
  PImage img;
  
  Shepherd(PImage image, float _x, float _y){
    img = image;
    img.resize(40,60);
    x = _x;
    y = _y;
  }
  
  void display(){
    image(this.img,this.x,this.y);
  }
  
  void move(float[][] loc){
    if( (this.x - loc[0][-2]) <= 100){
      this.x = x;
      this.y = y;
    }else{
    this.x = lerp(this.x, mouseX, 0.009);
    this.y = lerp(this.y, mouseY, 0.009);
    }
  }
  
  
  float returnX(){
    return this.x;
  }
  
  float returnY(){
    return this.y;
  }
}