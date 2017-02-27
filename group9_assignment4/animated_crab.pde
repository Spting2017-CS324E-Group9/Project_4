class animated_crab {
  crab a_crab;
  color crab_color;
  animated_crab (color c) {
    crab_color = c;
    a_crab = new crab (-37, 100, 40, crab_color); 
  }

  void display (float x, float y, float scale) {
    pushMatrix ();
    translate (x, y);
    scale (scale, -scale);
    shape (a_crab.whole_crab);
    popMatrix ();
  }

  void travel (float from_x, float from_y, float to_x, float to_y, float iter, float scale) {
    float distance = dist (from_x, from_y, to_x, to_y);
    float amt = iter % 2;
    if (amt < 1) {
      float display_x = lerp (from_x, to_x, amt);
      float display_y = lerp (from_y, to_y, amt);
      this.display (display_x, display_y, scale);
    } else {
      float display_x = lerp (from_x, to_x, 2 - amt);
      float display_y = lerp (from_y, to_y, 2 - amt);
      this.display (display_x, display_y, scale);
    }
  }
  
  void move_legs (float iter) {
    float amt = iter % 2;
    if (amt < 1) {
      float toe_dx = lerp (100, 110, amt);
      a_crab = a_crab.update (a_crab.eye_center, toe_dx, a_crab.elbow, a_crab.crab_color);

    } else {
      float toe_dx = lerp (100, 110, 2 - amt);
      a_crab = a_crab.update (a_crab.eye_center, toe_dx, a_crab.elbow, a_crab.crab_color);
    }
  }
  
  void move_eyes (float iter) {
    float amt = iter % 2;
    if (amt < 1) {
      float eye_dx = lerp (-40, -30, amt);
      a_crab = a_crab.update (eye_dx, a_crab.toe, a_crab.elbow, a_crab.crab_color);
    } else {
      float eye_dx = lerp (-40, -30, 2 - amt);
      a_crab = a_crab.update (eye_dx, a_crab.toe, a_crab.elbow, a_crab.crab_color);
    }
  }
  
  void move_arms (float iter) {
    float amt = iter % 2;
    if (amt < 1) {
      float arm_dy = lerp (40, 60, amt);
      a_crab = a_crab.update (a_crab.eye_center, a_crab.toe, arm_dy, a_crab.crab_color);
    } else {
      float arm_dy = lerp (40, 60, 2 - amt);
      a_crab = a_crab.update (a_crab.eye_center, a_crab.toe, arm_dy, a_crab.crab_color);
    }
  }
}