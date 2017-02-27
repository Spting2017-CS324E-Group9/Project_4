class crab_eye {

    PShape eye, stalk, eye_ball, sclera, pupil;
    float center;
    color stalk_color;
    crab_eye (float cent, color c) {
      stalk_color = c;
      center = cent;
      eye = createShape (GROUP);
      stalk = createShape (LINE, -27, 30, center, 80);
      stalk.setFill (false);
      stalk.setStroke (c);
      stalk.setStrokeWeight (6);
      eye.addChild (stalk);
      
      eye_ball = createShape (GROUP);
      sclera = createShape (ELLIPSE, center, 80, 15, 15);
      sclera.setFill (color (255, 255, 255));
      sclera.setStroke (color (0, 0, 0));
      sclera.setStrokeWeight (0);
      pupil = createShape (ELLIPSE, center, 80, 6, 6);
      pupil.setFill (color (0, 0, 0));
      pupil.setStroke (false);
      eye_ball.addChild (sclera);
      eye_ball.addChild (pupil);
      eye.addChild (eye_ball);
    }

    crab_eye scale_eye (float x, float y) {
      crab_eye new_eye = new crab_eye (this.center, this.stalk_color);
      new_eye.eye.scale (x, y);
      return new_eye;
    }

}