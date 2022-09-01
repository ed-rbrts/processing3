  void setup() {
  
  size(1000, 1000, P3D);
  colorMode(HSB, 360, 100, 100, 1);
  draw_background(random(0, 300), random(0, 60));
  
  
}

float randomHue = random(0, 360);

void draw() {
      
    if(keyPressed) {
        String HH_MM_SS = Integer.toString(hour()) + "_" + Integer.toString(minute()) + "_" + Integer.toString(second());
        saveFrame("saves_" +  java.time.LocalDate.now() + "/cap_" +  HH_MM_SS + ".png");
    }
   
}

void point_rect(int a, int b, int x,int y, float n1, float n2, float maxA, float col) {
    
    if (b < height * 0.5) {
      for (int i = a; i < (a + x); i++) {
        for (int j = 0; j < (y); j++) {
          
          float alpha = noise(i/n1, j/n2) * maxA;
          float scaled_alpha = alpha * (1 - (float(j)/float(y)));
          stroke(col, 80, 70, scaled_alpha);
          point(i, j + b);
          
        }
      }
    }
    else {
      y *= 0.8;
      maxA = map(maxA, 0.1, 0.7, 0.5, 1);
      for (int i = a; i < (a + x); i++) {
        for (int j = 0; j < (y); j++) {
          
          float alpha = noise(i/n1, j/n2) * maxA;
          float scaled_alpha = alpha * (float(j)/float(y));
          stroke(col, 0, 0, scaled_alpha);
          point(i, j + b);
          
        }
      }
    }
}

void draw_background(float x, float y) {
  
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      stroke(noise(float(i)/203., float(j)/377.) * y + x, 10, 95, 1);
      point(i, j);
    }
  }
}

void mousePressed() {
 
  
  float a = random(250, 700);
  float b = random(250, 700);
  float h = random(300, 500);
  float maxAlpha = random(0.1, 0.7);
  point_rect(mouseX, mouseY, int(random(50, 70)), int(h), a, b, maxAlpha, randomHue);
}
