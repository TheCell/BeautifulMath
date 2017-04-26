int[][] array = new int[1000][2];
int eltX;
int eltY;
int i = 0;
int j = 0;
int counter = 0;

void setup()
{
  int xMax = 1000;
  int yMax = 1000;

  size(1000, 1000);

  for (int i = 0; i < array.length; i++)
  {
    array[i][0] = i;
    array[i][1] = (int) random((float) yMax);
  }
  background(0,0,0);
}

void draw()
{
  background(0, 0, 0);
  for(int i = 0; i < array.length; i++)
  {
    stroke(255, 255, 255);
    strokeWeight(3);
    point(array[i][0],array[i][1]);
  }
  
  eltY = array[counter][1];
  j = counter;
  
  for(int i = counter + 1; i < array.length; i++)
  {
    if(array[i][1] > eltY)
    {
      eltY = array[i][1];
      j = i;
      //array[j+1][1] = array[j][1];
      //array[j][1] = eltY;
    }
  }
  
  array[j][1] = array[counter][1];
  array[counter][1] = eltY;
  
  if(counter < (array.length - 1))
  {
    counter++;
  }
  else
  {
    counter = 0;
  }
}