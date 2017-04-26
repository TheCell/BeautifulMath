
float radius = 1;
float middlePointx = 500;
float middlePointy = 500;
float x = 0;
float y = 0;
float z = 0;
float i = 0;

void setup() {
  size(1000, 1000, P3D);
  background(0, 0, 0);
}

void draw()
{
  translate(500, 200);
  rotateX(-PI/2);
  rotateZ(PI/4);
  rotateY(PI/8);

  stroke(255, 255, 255);
  strokeWeight(3);

  line(x, y, i, cos(i)* radius, sin(i)*radius, i);
  
  //rotateX(PI/2);
  //rotateY(PI/2);
  //rotateZ(PI/2);
  //translate(x,y);
  //drawCircle(radius,x,y,i);

  x = cos(i) * radius;
  y = sin(i) * radius;
  radius = radius * pow((float) Math.E, i * 0.00003);

  i = i+0.5;
}

void drawCircle(float radius, float middlePointx, float middlePointy, float z){
  for(float i = 0; i<= 720; i = i+ 0.5)
  {
    point(middlePointx + cos(i)* radius,middlePointy + sin(i)*radius, z);
  }
}