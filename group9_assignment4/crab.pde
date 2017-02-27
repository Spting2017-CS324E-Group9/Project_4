class crab {

  PShape whole_crab;
  PShape crab_legs;
  PShape crab_eyes;
  PShape crab_claws;
  float eye_center, toe, elbow;
  color crab_color;
  crab (float ec, float t, float e, color c) {
    crab_color = c;
    eye_center = ec;
    elbow = e;
    toe = t;
    whole_crab = createShape (GROUP);

    // make crab body
    PShape body = createShape (ELLIPSE, 0, 0, 200, 90);
    body.setFill (crab_color);
    body.setStroke (false);
    whole_crab.addChild (body);

    // make crab mouth
    PShape mouth = createShape (ARC, 0, 0, 40, 10, PI, 2 * PI);
    mouth.setFill (false);
    mouth.setStroke (color (0, 0, 0));
    mouth.setStrokeWeight (2);
    whole_crab.addChild (mouth);

    // make right crab legs
    crab_legs = createShape (GROUP);
    crab_leg bottomRight;
    crab_leg midRight;
    crab_leg topRight;
    crab_leg bottomLeft;
    crab_leg midLeft;
    crab_leg topLeft;
    
    bottomRight = new crab_leg (toe, crab_color);
    midRight = bottomRight.transpose_leg (1, 1, PI / 18);
    topRight = bottomRight.transpose_leg (1, 1, PI / 10);
    crab_legs.addChild (bottomRight.leg);
    crab_legs.addChild (topRight.leg);
    crab_legs.addChild (midRight.leg);

    // make left crab legs
    bottomLeft = bottomRight.transpose_leg (-1, 1, 0);
    midLeft = bottomRight.transpose_leg (-1, 1, PI / 18);
    topLeft = bottomRight.transpose_leg (-1, 1, PI / 10);
    crab_legs.addChild (bottomLeft.leg);
    crab_legs.addChild (midLeft.leg);
    crab_legs.addChild (topLeft.leg);
    whole_crab.addChild (crab_legs); 

    // make crab eyes
    crab_eyes = createShape (GROUP);
    crab_eye leftEye;
    leftEye = new crab_eye (eye_center, crab_color);
    crab_eye rightEye;
    rightEye = leftEye.scale_eye (-1, 1);
    crab_eyes.addChild (leftEye.eye);
    crab_eyes.addChild (rightEye.eye);
    whole_crab.addChild (crab_eyes);

    // make crab claws
    crab_claws = createShape (GROUP);
    crab_claw leftClaw;
    leftClaw = new crab_claw (elbow, crab_color);
    crab_claw rightClaw;
    rightClaw = new crab_claw (elbow, crab_color);
    rightClaw = rightClaw.scale_claw (-1, 1);
    crab_claws.addChild (leftClaw.claw);
    crab_claws.addChild (rightClaw.claw);
    whole_crab.addChild (crab_claws);
 
  }
  
  crab update (float ec, float t, float e, color c) {
    crab updated_crab = new crab (ec, t, e, c);
    return updated_crab;
  }
  
}