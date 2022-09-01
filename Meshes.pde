int SHAPE_COUNT = 200;
PVector o;

void setup() {
  
   fullScreen(P3D);
   background(0);
   strokeWeight(2);
   stroke(255);
   
   o = new PVector(width/2., height/2.);
}

void draw() {
 
    mesh(o, 6, 300);
  
}

void mesh(PVector origin, int sides, float rad) {
  
  float ang = 0;
  
  float ax = origin.x + rad * cos(ang);
  float ay = origin.y + rad * sin(ang);
  
  while (ang <= TAU) {
    
      ang += (TAU/sides);
      float bx = origin.x + rad * cos(ang);
      float by = origin.y + rad * sin(ang);
      line(ax, ay, bx, by);
      ax = bx;
      ay = by;
      
  }
  
}
