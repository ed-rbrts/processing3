int chordType = 3;
PFont cour;
PVector[] grid = new PVector[12];
int[] I012 = new int[chordType];
String[] NOTES = {"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "Bb", "B"};

void setup() {
  
  //size(640, 480);
  fullScreen();
  background(0);
  colorMode(HSB, 360, 100, 100, 1);
  noLoop();
  
  cour = createFont("/data/cour.ttf", 25);
  
  for(int i = 0; i < grid.length; i++) {
    
    int x = i%4;
    int y = int(i/4.);
        
    x *= int(width/4.5);
    y *= int(height/3.5);
    
    x += int(width/6.);
    y += int(height/5.);
    
    grid[i] = new PVector(x, y);
    
  }
  
  for(int i = 0; i < chordType; i++) {
    
    I012[i] = i;
    
  }
  
}

void draw() {
  
  fill(0, 0, 100, 1);
  noStroke();
  textFont(cour);
 
  for(int i = 0; i < 12; i++) {
    
    for(int j = 0; j < 7; j++) {
      
      int[] chord = new int[chordType];
      chord = euclid(I012, chordType, 7, j);
      chord = euclid(chord, 7, 12, i);
      
      for(int n = 0; n < chord.length; n++) {
        
         String t = NOTES[chord[n]%12];
         float ang = (TAU/7.) * j; 
         int mag = (n * 26) + 40;
         PVector v = PVector.fromAngle(ang);
         v.setMag(mag);
         v.add(grid[i]);
         text(t, v.x, v.y);
        
      }
      
    }
    
    strokeWeight(2);
    stroke(0, 0, 100, 1);
    noFill();
    ellipse(grid[i].x, grid[i].y, 300, 300);
    
  }
  
}

int[] euclid(int[] p_set, int hits, int steps, int rotation) {
  
  int[] arr = new int[chordType];
  
  for(int i = 0; i < chordType; i++) {
    
    arr[i] = round(((p_set[i] + (rotation/float(steps)))/float(hits)) * steps);
    
  }
  
  return arr;
  
}
