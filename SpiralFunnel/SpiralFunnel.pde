
float radius = 1;
float x = 0;
float y = 0;
float i = 0;

void setup() {
  size(1000, 1000, P3D);
  background(0,0,0);
}

void draw()
{
  translate(200,200);
  rotateX(-PI/2);
  rotateY(PI/4);
  
  stroke(255,255,255);
  strokeWeight(3);
  
  line(x,y, i, cos(i)* radius, sin(i)*radius,i);
  x = cos(i) * radius;
  y = sin(i) * radius;
  radius = radius * pow((float) Math.E, i * 0.00005);
  
  i = i+1;
}