int startX = -200;
float startY;
int no_lines = 200;
float increment  = 10;
float weight = 2;

void setup() {
  
  size(1920, 1080, P3D);
  colorMode(HSB, 360, 100, 100, 1);
  noLoop();
  background(200, 20, 20, 1);
  startY = height/2;
  
}

void draw() {
  
  stroke(170, 70, 100, 0.080);
  strokeWeight(weight);
  for (int l = 0; l < no_lines; l++) {
    
      float magnitude = 300;
      float prevX = -200;
      float prevY = startY + random(-200, 200);
      
      for (float i = -200; i < width; i += increment) {
       
        float newX = i;
        float newY = equateWave(i, magnitude, l);
        line(prevX, prevY, newX, newY);
        prevX = newX;
        prevY = newY;
    
      }
  }
  
  String HH_MM_SS = Integer.toString(hour()) + "_" + Integer.toString(minute()) + "_" + Integer.toString(second());
  save("/saves_" + java.time.LocalDate.now() + "/noiseWave_" + HH_MM_SS + ".png"); 
  
}

float equateWave(float tempVariable, float tempMagnitude, int line_number) {
  
  int line = line_number;
  float x = tempVariable;
  //float temp_y = temp_prev_Y;
  float mag = tempMagnitude;
  float angle = noise((x+100)/1900, mag/100, (x+300)/1780) * TAU;
  //float y = sin(radians((x+ 100)) * noise(angle)) * (mag + (noise(x/40) * 10));
  float y = sin(noise(angle) * TAU) * mag;
  y += startY;
  
  
  return y;
}
