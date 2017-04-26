void setup()
{
  size(1500,1500,P3D);
  background(0, 0, 0);
}

float x = 0;
float y = 0;
float z = 0;
float alpha1 = 0;
float alpha2 = PI/4;
float alpha3 = 2*PI/4;
float alpha4 = 3*PI/4;
float beta = 0;
int radius = 200;
float rotateAroundY = PI/2;

void draw()
{
  translate(750, 750);
  
  if(alpha1 > (PI/4))
  {
    alpha1 = 0;
  }
  if(alpha2 > PI/2)
  {
    alpha2 = PI/4;
  }
  if(alpha3 > (3*PI/4))
  {
    alpha3 = PI/2;
  }
  if(alpha4 > PI)
  {
    alpha4 = 3*PI/4;
  }
  if(beta > TWO_PI)
  {
    beta = 0;
  }
  rotateY(rotateAroundY);
  rotateZ(PI/2);
  
  rotateX(PI/4);
  
  x = radius * sin(alpha1)*cos(beta);
  y = radius * sin(alpha1)*sin(beta);
  z = radius * cos(alpha1);
  
  strokeWeight(3);
  stroke(255, 255, 255);
  point(x, y, z);
    
  x = radius * sin(alpha2)*cos(beta);
  y = radius * sin(alpha2)*sin(beta);
  z = radius * cos(alpha2);
  
  strokeWeight(3);
  stroke(255, 255, 255);
  point(x, y, z);    
  x = radius * sin(alpha3)*cos(beta);
  y = radius * sin(alpha3)*sin(beta);
  z = radius * cos(alpha3);
  
  strokeWeight(3);
  stroke(255, 255, 255);
  point(x, y, z);    
  x = radius * sin(alpha4)*cos(beta);
  y = radius * sin(alpha4)*sin(beta);
  z = radius * cos(alpha4);
  
  strokeWeight(3);
  stroke(255, 255, 255);
  point(x, y, z);
  
  alpha1 = alpha1 + 0.09;
  alpha2 = alpha2 + 0.09;
  alpha3 = alpha3 + 0.09;
  alpha4 = alpha4 + 0.09;
  beta = beta + 0.09;
  
  /*
  beginShape();
  vertex(30, 20, 40);
  vertex(85, 20, -30);
  vertex(85, 75- 50);
  vertex(30, 75, 20);
  endShape();
  */
}

void mouseClicked()
{
  rotateAroundY = rotateAroundY + PI/4;
  if(rotateAroundY > PI)
  {
    rotateAroundY = 0;
  }
  background(0, 0, 0);
}