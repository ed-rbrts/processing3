public class Particle {
  
  PVector pos, vel;  
  float s, mass;
    
  Particle(float tempSize, float x, float y)  {
    
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    mass = random(1., 2.);
    
    s = tempSize;
    
  }
  
  void display() {
    
    stroke(0, 50, 100, 1);
    strokeWeight(int(s/10.) + 1);
    fill(0, 100, 100, 1);
    ellipse(pos.x, pos.y, s, s);
    
  }
  
  void update(float tempMouseX, float tempMouseY) {
    
    PVector mousePos = new PVector(tempMouseX, tempMouseY);
    PVector acc = PVector.sub(mousePos, pos);
    acc.normalize();
    acc.mult(pow(acc.mag() + 0.1, -2)/ mass);
    vel.add(acc);
    vel.limit(17);
    pos.add(vel);
    
  }
  
  void edges() {
    if (pos.x < 0 || pos.x  > width) {
      vel.x *= -1;
    }
    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
  }
  
}
