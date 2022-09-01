PImage toneParticle;
PImage logo;
float siz = 40;
float speed = 200;
int frameNumber = 0;
int fr = 30;


void setup() {
  size(1980, 1080, P2D);
  colorMode(HSB, 360, 100, 100, 1);
  background(0, 0, 0, 1);
  frameRate(fr);
  toneParticle = loadImage("marthas.jpeg");
  toneParticle.resize(width, height);
  //logo = loadImage("logo.png");
 
  
}

void draw() {
  
  for (int i = 0; i < speed; i++) {
  
   int x = int(random(0, width));
   int y = int(random(0, height));
   int pos = y * width + x;
   float hue = hue(toneParticle.pixels[pos]);
   float sat = saturation(toneParticle.pixels[pos]);
   float bri = brightness(toneParticle.pixels[pos]);
   noStroke();
   fill(hue, sat, bri, 0.1);
   ellipse(x, y, siz, siz);
   
  }
 
 saveFrame("png_sequence3/marthas_####.png");
  
}
