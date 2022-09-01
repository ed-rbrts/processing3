String[] NOTES = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "Bb", "B"};
int fret[] = {0, 5, 10, 15, 19, 24};
PFont cour;
void setup() {
  
  fullScreen();
  background(0);
  colorMode(HSB, 360, 100, 100, 1);
  noLoop();
  cour = createFont("/data/courbd.ttf", 25);
}

void draw() {
  
  stroke(0, 0, 100, 1);
  textFont(cour);
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  
  for(int x = 0; x < 24; x++) {
    
    stroke(0, 0, 100, 1);
    strokeWeight(4);
    line(x * 85, 0, x * 85, height);
    
  }
  
  for(int y = 0; y < 6; y++) {
   
    stroke(0, 0, 100, 1);
    strokeWeight(4);
    line(0, height - (y * 200) + 10, width,height - (y * 200) + 10);   
    
  }
  
  for(int i = 0; i < 24; i++) {
    
    PVector fretPos[] = new PVector[6];
    
    for(int j = 0; j < fret.length; j++) {
   
      PVector pos = new PVector(i * 85, height - (j * 200) + 10);
      fretPos[j] = pos;
    
      String ptch = NOTES[(fret[j] + i) % 12];
      fill(0, 0, 100, 1);
      ellipse(pos.x, pos.y, 50, 50);
      fill(0, 0, 0, 1);
      text(ptch, pos.x, pos.y);
          
    }      
    
  }
    
}
