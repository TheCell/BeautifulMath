int[][] array = new int[1000][2];

int left = 0;
int right = 999;
int q = 0;
int i = 0;
int tmpr = right;
boolean allChecked = false;

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

  background(0, 0, 0);
}

void draw()
{
  background(0, 0, 0);
  for (int i = 0; i < array.length; i++)
  {
    stroke(255, 255, 255);
    strokeWeight(3);
    point(array[i][0], array[i][1]);
  }
  
  if(!allChecked)
  {
    i--;
    while(left < tmpr)
    {
      q = partition(left, tmpr);
      array[tmpr][1] = -array[tmpr][1];
      tmpr = q - 1;
      ++i;
    }
    if(i < 0)
    {
      allChecked = false;
    }
    left++;
    tmpr = findNextR(left, 999);
    array[tmpr][1] = -array[tmpr][1];
  }
  
}

private int findNextR(final int l, final int size)
{
    for (int i = l; i < size; ++i)
    {
        if (array[i][1] < 0)
        {
          return i;
        }
    }
    return size - 1;
}

private int partition(int l, int r)
{
    int pivot = array[(l + r) / 2][1];
    while (l <= r)
    {
        while (array[r][1] > pivot)
            r--;
        while (array[l][1] < pivot)
            l++;
        if (l <= r)
        {
            int tmp = array[r][1];
            array[r][1] = array[l][1];
            array[l][1] = tmp;
            l++;
            r--;
        }
    }
    return l;
}