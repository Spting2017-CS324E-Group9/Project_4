class crab_leg {

  PShape leg;
  PShape upper_leg;
  PShape lower_leg;
  float toe;
  color leg_color;
  crab_leg (float t, color c) {
    toe = t;
    leg_color = c;
    leg = createShape (GROUP);
    upper_leg = createShape (LINE, 75, -25, 100, -40);
    upper_leg.setStroke (c);
    upper_leg.setStrokeWeight (4);
    
    lower_leg = createShape (LINE, 100, -40, toe, -50);
    lower_leg.setStroke (c);
    lower_leg.setStrokeWeight (4);
  
    leg.addChild (upper_leg);
    leg.addChild (lower_leg);
  }
  
  crab_leg transpose_leg (float x, float y, float angle) {
    crab_leg new_leg = new crab_leg (this.toe, this.leg_color);
    new_leg.upper_leg.scale (x, y);
    new_leg.lower_leg.scale (x, y);
    new_leg.upper_leg.rotate (angle);
    new_leg.lower_leg.rotate (angle);
    return new_leg;
  }
}