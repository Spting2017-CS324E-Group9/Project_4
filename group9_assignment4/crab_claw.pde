class crab_claw {

  PShape claw, lower_arm, upper_arm, small_pincher, big_pincher;
  float elbow;
  color claw_color;
  crab_claw (float e, color c) {
    elbow = e;
    claw_color = c;
    claw = createShape (GROUP);
    lower_arm = createShape (LINE, -80, 15, -130, elbow);
    lower_arm.setStroke(c);
    lower_arm.setStrokeWeight (6);
    claw.addChild (lower_arm); 
    
    upper_arm = createShape (LINE, -130, elbow, -130, elbow + 20);
    upper_arm.setStroke(c);
    upper_arm.setStrokeWeight (6);
    claw.addChild (upper_arm);
    
    big_pincher = createShape (ARC, -130, elbow + 45, 40, 50, PI / 2, 3 * PI / 2);
    big_pincher.setFill (c);
    big_pincher.setStroke (0);
    claw.addChild (big_pincher);
    
    small_pincher = createShape (ARC, -130, elbow + 40, 30, 40, -PI / 2, PI / 2);
    small_pincher.setFill (c);
    small_pincher.setStroke (0); 
    claw.addChild (small_pincher);
    
  }

  crab_claw scale_claw (float x, float y) {
      crab_claw new_claw = new crab_claw (this.elbow, this.claw_color);
      new_claw.claw.scale (x, y);
      return new_claw;
    }
}