  PImage img;
PFont cour;
int img_no = 2;
int circle_size = 15;
int gap = 4;
float h = 0.4; // hue
boolean s = false; //stroke or not
int stroke_width = 10;

void setup() {
  
  fullScreen(P3D);
  colorMode(HSB, 1, 1, 1, 1);
  smooth(8);
  
  background(0.5722, 0.87, 0.54, 1);
  noLoop();
  
  cour = createFont("cour.ttf", 50);
  
  img = loadImage("/images/image_" + img_no + ".JPG");
  img.loadPixels();
  img.resize(width, height);
  img.loadPixels();
  
}

void draw() {

  for (int i = 0; i < width; i += (circle_size + gap)) {
    
    for (int j = 0; j < height; j += (circle_size + gap)) {
      
      int pos = (j * width) + i;
      float sat = saturation(img.pixels[pos]);
      float bri = brightness(img.pixels[pos]);
      float col = hue(img.pixels[pos]);
      
      if (s) {
        stroke(col, sat, bri, 0.7);
        strokeWeight(stroke_width);
      }
      else {
        noStroke();
      }
      
      fill(h, sat, bri, 1);
      ellipse(i, j, circle_size, circle_size);
      
      stroke(1);
      fill(0, 0, 1, 1);
      //textFont(cour);
      //textSize(20);
      //int random_char_no = int(random(0, 100));
      //char random_char = char(random_char_no);
      //textAlign(CENTER);
      //text(random_char, i, (j + (circle_size / 4.)));
      
  
      
    }
    
  }
      
  
  String HH_MM_SS = Integer.toString(hour()) + "_" + Integer.toString(minute()) + "_" + Integer.toString(second());
  save("/saves_" + java.time.LocalDate.now() + "/etsy_" + HH_MM_SS + ".png");
  
}
