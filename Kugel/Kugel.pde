void setup()
{
  size(1500,1500,P3D);
  //background(255, 255, 255);
}

float x = 0;
float y = 0;
float z = 0;
int counter = 0;
int radius = 200;

void draw()
{
  translate(750, 750);
  if(counter > 360)
  {
    counter = 0;
  }
  
  x = radius * cos(counter)*cos(counter);
  y = radius * cos(counter)*sin(counter);
  z = radius * sin(counter);
  
  beginShape();
    x = radius * cos(counter)*cos(counter);
    y = radius * cos(counter)*sin(counter);
    z = radius * sin(counter);
    vertex(x, y, z);
    x = radius * cos(counter+1)*cos(counter+1);
    y = radius * cos(counter+1)*sin(counter+1);
    z = radius * sin(counter+1);
    vertex(x, y, z);
    x = radius * cos(counter+2)*cos(counter+2);
    y = radius * cos(counter+2)*sin(counter+2);
    z = radius * sin(counter+2);
    vertex(x, y, z);
    
  endShape();
  
  counter++;
  /*
  beginShape();
  vertex(30, 20, 40);
  vertex(85, 20, -30);
  vertex(85, 75- 50);
  vertex(30, 75, 20);
  endShape();
  */
}