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

//circle, float radius, float x, float y, all shapes in the family can be represented in theory, negative values for radius x or y would not make sense
//arc, float radius, float x, float y, float angle, all arcs starting at the set start angle as shown are possible, no negative value for x, y, or radius would be possible
//arc of varying start angle, float radius, float x, float y, float start angle, float stop angle, all arcs are possible, no negative value for x, y, or radius would make sense
//polygons of increasing number of sides, float side length, float x, float y,  float number of sides, all possibleblee polygons could be made theoretically be made, no negative value for size number of sides x or y would make sense
//circles of the same color increasing size, float radius, float x, float y, float red, float green, float blue, every color or circle could be represented, no negative or zero value for radius, x, or y would make sense, no value over 255 for r g or b would be possible or below 0
//polygons with color, float side length, float x, float y, float number of sides, float r, float g, float b, all possible polygons would be able to be created all non gray scale colors would be possible, no values under or equal to 0 for radius or side number would make sense, no value under 0 would make sense for x or y really although if you wanted it cut off I guess you could, no value above 255 or below 0 is possible for rgb
//polygons with outline in color, float side length, float x, float y, float number of sides, float r, float g, float b, all possible polygons would be able to be created all non gray scale colors would be possible, no values under or equal to 0 for radius or side number would make sense, no value under 0 would make sense for x or y really although if you wanted it cut off I guess you could, no value above 255 or below 0 is possible for rgb
//circles with fill or without fill, float radius, float x, float y, float red, float green, float blue, boolean fill, every color or circle could be represented, no negative or zero value for radius, x, or y would make sense, no value over 255 for r g or b would be possible or below 0

class Poly {
  final float x;
  final float y;
  final int n;
  final float s; /*size*/
  final float r;
  final float g;
  final float b;

  Poly(float r_, float x_, float y_, int n_, float s_, float b_, float g_) {
    r = r_;
    x = x_;
    y = y_;
    n = n_;
    g = g_;
    b = b_;
    s = s_;
  }
}
//took this part below inspired by https://processing.org/examples/regularpolygon.html
void drawPoly (Poly z) {
  fill(z.r, z.g, z.b);
  float angle = TWO_PI/z.n;
  beginShape ();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sidex = z.x + cos(a) * z.r;
    float sidey = z.y + cos(a) * z.r;
    vertex(sidex, sidey);
  }
  endShape(CLOSE);
}

class colorPoly {
  final float x;
  final float y;
  final int n;
  final float s; /*size*/
  final float r;
  final float g;
  final float b;

  colorPoly(float r_, float x_, float y_, int n_, float s_, float b_, float g_) {
    r = r_;
    x = x_;
    y = y_;
    n = n_;
    g = g_;
    b = b_;
    s = s_;
  }
}
//took this part below inspired by https://processing.org/examples/regularpolygon.html
void drawcolorPoly (colorPoly z) {
  fill(z.r, z.g, z.b);
  float angle = TWO_PI/z.n;
  beginShape ();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sidex = z.x + cos(a) * z.r;
    float sidey = z.y + cos(a) * z.r;
    vertex(sidex, sidey);
  }
  endShape(CLOSE);
}

class strokePoly {
  final float x;
  final float y;
  final int n;
  final float s; /*size*/
  final float r;
  final float g;
  final float b;

  strokePoly(float r_, float x_, float y_, int n_, float s_, float b_, float g_) {
    r = r_;
    x = x_;
    y = y_;
    n = n_;
    g = g_;
    b = b_;
    s = s_;
  }
}
//took this part below inspired by https://processing.org/examples/regularpolygon.html
void drawstrokePoly (Poly k) {
  stroke(k.r, k.g, k.b);
  float angle = TWO_PI/k.n;
  beginShape ();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sidex = k.x + cos(a) * k.r;
    float sidey = k.y + cos(a) * k.r;
    vertex(sidex, sidey);
  }
  endShape(CLOSE);
}

class fillCircle {
  final float x;
  final float y;
  final float r;
  final float g;
  final float b;
  final float d; /*diameter*/
  final boolean fil; /*if the circle is filled*/



  fillCircle(float r_, float x_, float y_, float g_, float b_, float d_, boolean fil_) {
    r = r_;
    x = x_;
    y = y_;
    g = g_;
    b = b_;
    d = d_;
    fil = fil_;
  }
}

void drawfillCircle (Circle f) {
  if (f.fil) {
    fill(f.r, f.g, f.b);
  }
  ellipse (f.x, f.y, f.r, f.r);
}

