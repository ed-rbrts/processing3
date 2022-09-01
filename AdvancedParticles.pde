ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 1);
  frameRate(30);
  
  for (int i = 0; i < 1000; i++) {
    Particle p = new Particle(1, random(0, width), random(0, height));
    particles.add(p);
  }
  
}

void draw() {
  
  background(0, 0, 0, 1);
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update(mouseX, mouseY);
    p.display();
    p.edges();
  }
  
}
