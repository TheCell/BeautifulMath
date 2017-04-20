void setup() {
  size(500, 500);
  background(255,255,255);
  int middlex = 50;
  int middley = 50;
  int r = 50;
  int x = 100;
  drawCircle(100,250,250);
    
}

void drawCircle(int radius, int middlePointx, int middlePointy){
  for(float i = 0; i<= 720; i = i+ 0.5){
    point(middlePointx + cos(i)* radius,middlePointy + sin(i)*radius );
  }
}