int dim = 100;
PFont cour;
int fr = int(random(100, 200));

void setup() {
  
  fullScreen(P3D);
  frameRate(20);
  colorMode(HSB, 1, 1, 1, 1);
  
  cour = createFont("cour.ttf", 50);
  
}

void draw() {
  
  background(0, 1);
  
  fill(0, 0, 1, 1);
  textFont(cour);
  textSize(20);
  
  for (int i = 0; i < dim; i++) {
    float x_pos = i * int(width/dim);
    float text_prob = noise(i/(dim * 3), i/(dim * 2), fr * 0.01);
    //print(text_prob);
    
    if (text_prob > 0.5) {
    
      for (int j = 0; j < dim; j++) {
        
        if (noise(j/109, j/93, j/103) < 0.5) {
          
        
          float y_pos = j * int(height/dim);
          int random_char_no = int(random(0, 256));
          char random_char = char(random_char_no);
  
          text(random_char, x_pos, y_pos);
          
        }
          
      }
      
    }
  
  }
    
  fr++;
  
}
