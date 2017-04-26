
float radius = 1;
float middlePointx = 500;
float middlePointy = 500;
float x = middlePointx;
float y = middlePointy;
float z = 0;
float i = 0;

void setup() {
  size(1000, 1000, P3D);
  background(255,255,255);;
}

void draw()
{
  pushMatrix();
  rotateX(50);
  //line(x, y, middlePointx + cos(i)* radius, middlePointy + sin(i)*radius);
  point(middlePointx + cos(i)* radius, middlePointy + sin(i)*radius );
  point(middlePointx + cos(i+0.5)* radius, middlePointy + sin(i+0.5)*radius );
  x = middlePointx + cos(i) * radius;
  y = middlePointy + sin(i) * radius;
  radius = radius * pow((float) Math.E, i * 0.00015);
  i = i + 0.1;
  popMatrix();
}