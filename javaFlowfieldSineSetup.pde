import controlP5.*;

ControlP5 offsetCtrl, factorCtrl, incCtrl, yIncCtrl, numberCtrl, xSclCtrl, ySclCtrl, magCtrl, zIncCtrl, weightCtrl, alphaCtrl, maxSpeedCtrl, hueMinCtrl, hueMaxCtrl;

float inc;
int nParticles;
int xScl;
int yScl;
int cols, rows;
float zoff = 0;
Particle[] particles;
PVector[] flowfield;
float mag;
float zInc;
float yInc;
float factor;

float weight;
float alph;
float maxSpeed;
int hueMin, hueMax;
float offset;

void setup() {
  fullScreen(P3D);
  colorMode(HSB, 360, 100, 100, 1);
  
  
  offsetCtrl = new ControlP5(this);
  offsetCtrl.addSlider("offset").setPosition(100, 740).setRange(0, TAU).setValue(1).setSize(600,10).setCaptionLabel("Angle Offset").setDecimalPrecision(3);
  
  factorCtrl = new ControlP5(this);
  factorCtrl.addSlider("factor").setPosition(100, 760).setRange(0.1, 10).setValue(1).setSize(600,10).setCaptionLabel("TAU Factor").setDecimalPrecision(2);
  
  incCtrl = new ControlP5(this);
  incCtrl.addSlider("inc").setPosition(100, 800).setRange(0, 0.03).setValue(0.001).setSize(600,10).setCaptionLabel("X Increment").setDecimalPrecision(5);
  
  yIncCtrl = new ControlP5(this);
  yIncCtrl.addSlider("yInc").setPosition(100, 780).setRange(0, 0.03).setValue(0.001).setSize(600,10).setCaptionLabel("Y Increment").setDecimalPrecision(5);
  
  numberCtrl = new ControlP5(this);
  numberCtrl.addSlider("nParticles").setPosition(100, 820).setRange(200, 10000).setValue(6500).setSize(600,10).setCaptionLabel("Number of Particles");
  
  xSclCtrl = new ControlP5(this);
  xSclCtrl.addSlider("xScl").setPosition(100, 840).setRange(1, 128).setValue(10).setSize(600,10).setCaptionLabel("X Scale");
  
  ySclCtrl = new ControlP5(this);
  ySclCtrl.addSlider("yScl").setPosition(750, 840).setRange(1, 128).setValue(14).setSize(600,10).setCaptionLabel("Y Scale");
  
  magCtrl = new ControlP5(this);
  magCtrl.addSlider("mag").setPosition(100, 860).setRange(0, 10).setValue(1).setSize(600,10).setCaptionLabel("Vector Magnitude").setDecimalPrecision(4);
  
  zIncCtrl = new ControlP5(this);
  zIncCtrl.addSlider("zInc").setPosition(100, 880).setRange(0, 1).setValue(0).setSize(600,10).setCaptionLabel("Z Increment").setDecimalPrecision(5);
  
  weightCtrl = new ControlP5(this);
  weightCtrl.addSlider("weight").setPosition(100, 900).setRange(0.1, 1).setValue(1).setSize(600,10).setCaptionLabel("Stroke Weight");
  
  alphaCtrl = new ControlP5(this);
  alphaCtrl.addSlider("alph").setPosition(100, 920).setRange(0.01, 1).setValue(0.08).setSize(600,10).setCaptionLabel("Alpha").setDecimalPrecision(3);
  
  maxSpeedCtrl = new ControlP5(this);
  maxSpeedCtrl.addSlider("maxSpeed").setPosition(100, 940).setRange(0.0, 20).setValue(1).setSize(600,10).setCaptionLabel("Max Speed").setDecimalPrecision(5);
  
  hueMinCtrl = new ControlP5(this);
  hueMinCtrl.addSlider("hueMin").setPosition(100, 960).setRange(0, 50).setValue(0).setSize(600,10).setCaptionLabel("Hue Min");
  
  hueMaxCtrl = new ControlP5(this);
  hueMaxCtrl.addSlider("hueMax").setPosition(100, 980).setRange(0, 50).setValue(0).setSize(600,10).setCaptionLabel("Hue Max");
    
  init();
 //noLoop();
 
 float yoff = 0;
  for (int y = 0; y < rows; y++) {
    
    float xoff = 0;
    
    for (int x = 0; x < cols; x++) {
     
      int index = x + y * cols;
      float angle = offset + noise(xoff, yoff, zoff) * TAU * factor;
      PVector v = PVector.fromAngle(angle);
      v.setMag(mag);
      flowfield[index] = v;
      xoff += inc;
    
    }
    
    yoff += yInc;
    zoff += zInc;

    
  }

}

void draw() {
 
  for (Particle i : particles) { //<>// //<>//
    
    i.follow(flowfield);
    i.update();
    i.edges();
    i.show();    
    
  }
      
}

void init() {
  
  background(0);
  particles = null;
  flowfield = null;
  cols = floor(width/xScl);
  rows = floor(height/yScl);
  flowfield = new PVector[cols * rows];
  particles = new Particle[nParticles];
  float yoff = 0;
  for (int y = 0; y < rows; y++) {
    
    float xoff = 0;
    
    for (int x = 0; x < cols; x++) {
     
      int index = x + y * cols;
      float angle = offset + noise(xoff, yoff, zoff) * TAU * factor;
      PVector v = PVector.fromAngle(angle);
      v.setMag(mag);
      flowfield[index] = v;
      xoff += inc;
    
    }
    
    yoff += yInc;
    zoff += zInc;

    
  }
  for (int i = 0; i < nParticles; i++) {
    particles[i] = new Particle(xScl, yScl, cols, rows, i, nParticles, weight, alph, maxSpeed, hueMin, hueMax);
  }
  
}

void keyPressed() {
  
  if (key == 's' || key == 'S') {
    String HH_MM_SS = Integer.toString(hour()) + "_" + Integer.toString(minute()) + "_" + Integer.toString(second());
    saveFrame("/saves_" + java.time.LocalDate.now() + "/mauro-" + HH_MM_SS + ".png");
  }
  else if (key == 'h' || key == 'H') {
    
    hideAllSliders();
    
  }
  else if (key == 'd' || key == 'D') {
    
    displayAllSliders();
    
  }
  else if (key == ENTER || key == RETURN) {
    init();
  }
  
}

void hideAllSliders() {
 
  
    factorCtrl.hide();
    incCtrl.hide();
    yIncCtrl.hide();
    numberCtrl.hide();
    xSclCtrl.hide();
    ySclCtrl.hide();

    magCtrl.hide();
    zIncCtrl.hide();
    weightCtrl.hide();
    alphaCtrl.hide();
    maxSpeedCtrl.hide();
    hueMinCtrl.hide();
    hueMaxCtrl.hide();
    offsetCtrl.hide();
    
    init();
  
}

void displayAllSliders() {
 
  
    factorCtrl.show();
    incCtrl.show();
    yIncCtrl.show();
    numberCtrl.show();
    xSclCtrl.show();
    ySclCtrl.show();
    magCtrl.show();
    zIncCtrl.show();
    weightCtrl.show();
    alphaCtrl.show();
    maxSpeedCtrl.show();
    hueMinCtrl.show();
    hueMaxCtrl.show();
    offsetCtrl.show();
  
}
