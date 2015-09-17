// circles, float x, float y, radius
//portions of an ellipse, at a certain angle and radius, float x, float y, float r, float a
//arcs, float x, float y, float r, float start angle, float end angle
//regular polygons, float x, float y, float r, int #of verticies
//draw a series of three circles of increasing radius and the same color, then repeat with different color
//float x, float y, float r, float color

void setup() {
  size(640, 400);
}

class Circle {
  final float x;
  final float y;
  final float r;


  Circle(float r_, float x_, float y_) {
    r = r_;
    x = x_;
    y = y_;
  }
}

void drawCircle (Circle c) {
  ellipse (c.x, c.y, c.r, c.r);
}

class Angle {
  final float x;
  final float y;
  final float r;
  final float a;

  Angle(float r_, float x_, float y_, float a_) {
    r = r_;
    x = x_;
    y = y_;
    a = a_;
  }
}
void drawAngle (Angle a) {
  arc(a.x, a.y, 2*a.r, 2*a.r, 0, a.a);
}

class Arc {
  final float x;
  final float y;
  final float r;
  final float start;
  final float stop;

  Arc(float r_, float x_, float y_, float start_, float stop_) {
    r = r_;
    x = x_;
    y = y_;
    start = start_;
    stop = stop_;
  }
}

void drawArc (Arc a) {
  arc(a.x, a.y, 2*a.r, 2*a.r, a.start, a.stop);
}

class Poly {
  final float x;
  final float y;
  final int n;
  final float r;

  Poly(float r_, float x_, float y_, int n_) {
    r = r_;
    x = x_;
    y = y_;
    n = n_;
  }
}
//took this part below inspired by https://processing.org/examples/regularpolygon.html
void drawPoly (Poly p) {
  float angle = TWO_PI/p.n;
  beginShape ();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sidex = p.x + cos(a) * p.r;
    float sidey = p.y + cos(a) * p.r;
    vertex(sidex, sidey);
  }
  endShape(CLOSE);
}

m 