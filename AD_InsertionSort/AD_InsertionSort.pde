int[][] array = new int[1000][2];
int eltX;
int eltY;
int i = 1;
int elt;
int j;

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
  
  if(i < array.length)
  {
    elt = array[i][1];
    j = i;
    
    while((j > 0) && array[j - 1][1] > elt)
    {
      array[j][1] = array[j - 1][1];
      
      j--;
    }
    array[j][1] = elt;
    
    i++;
  }
}