float theta = PI/2;
int xOffset = 750;
int yOffset = 1300;

void setup()
{
  background(255);
  size(1500, 1500);
}

void draw()
{
  background(255);
  theta += PI/64;
  translate(xOffset, yOffset);
  stroke(0);
  branch(400);
}

void branch(float length)
{
  line(0, 0, 0, -length);
  translate(0, -length);

  length *= 0.66;

  if (length > 2)
  {
    pushMatrix();
    rotate(theta);
    branch(length);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    branch(length);
    popMatrix();
  }
}