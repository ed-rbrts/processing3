PImage w1;
PImage blank;
int size = 30;
//float alpha = 0.01;
int threshold = 10;
ArrayList<Integer> darkPixels;


void setup() {
  
  size(1920, 1080);
  colorMode(HSB, 360, 100, 100, 1);
  //noLoop();
  background(220, 70, 30, 1);
  w1 = loadImage("whitby_1.JPG");
  w1.resize(width, height);
  blank = createImage(width, height, HSB);
  darkPixels = new ArrayList<Integer>();
  
  findEdges();
  
}

void draw() {
  
 //background(0, 0, 100, 1);
 //findEdges();
  //blank.loadPixels();
  //for (int i = 0; i < 500; i++) {
  //int x = floor(random(0, width));
  //int y = floor(random(0, height));
  
  //int pos = x + (y * width);
  //int blankpos = blank.pixels[pos];
  
  //float bBlank = brightness(blankpos);
  //float hBlank = hue(blankpos);
  
  for(int i = 0; i < 10; i++) {
  int newPos = floor(random(0, darkPixels.size()));
  int coord = darkPixels.get(newPos);
  int x = coord % width;
  int y = coord / width;
  
  fill(30, random(30, 70), 60, random(0.1, 0.2));
  noStroke();
  rectMode(CENTER);
  rect(x, y, size, size);
  }
  
  //image(blank, 0, 0);
  
}

void findEdges() {
  
  w1.loadPixels();
  blank.loadPixels();
 
  for(int i = 1; i < (width - 1) * (height -1 ); i++) {
     int p = w1.pixels[i]; 
     int pPrev = w1.pixels[i - 1];
     //float h = hue(p);
     //float s = saturation(p);
     float bPrev = brightness(pPrev);
     float b = brightness(p);
     if(b - bPrev > threshold) {
     blank.pixels[i] = color(0, 0, 0);
     darkPixels.add(i);
     }
     else { blank.pixels[i] = color(0, 0, 100, 1); }
  }
  w1.updatePixels();
  blank.updatePixels();

}
