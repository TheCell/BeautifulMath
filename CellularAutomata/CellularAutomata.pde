int xLength = 1500;
int yLength = 1500;
int[] lineArray = new int[xLength];
int lineFeed = 0;

void setup()
{
  background(255);
  for (int i = 0; i < lineArray.length; i++)
  {
    lineArray[i] = 0;
    if (i == lineArray.length / 2)
    {
      lineArray[i] = 1;
    }
  }

  size(1500, 1500);
}

void draw()
{
  boolean atBottom = false;

  if (atBottom || lineFeed >= yLength)
  {
    atBottom = true;
    loadPixels();
    for (int i = 0; i < (yLength-1)*xLength; i++)
    {
      pixels[i] = pixels[i+xLength];
    }
    updatePixels();
  }

  if (!atBottom)
  {
    lineFeed++;
    translate(0, lineFeed);
    drawArr(lineArray);
    nextEvolution(lineArray);
  } else
  {
    translate(0, yLength -1);
    drawArr(lineArray);
    nextEvolution(lineArray);
  }
}

void drawArr(int[] arr)
{
  for (int i = 0; i < arr.length; i++)
  {
    if (arr[i] == 1)
    {
      stroke(0, 0, 0);
      point(i, 0);
    } else
    {
      stroke(255, 255, 255);
      point(i, 0);
    }
  }
}

void nextEvolution(int[] arr)
{
  int[] tempArray = new int[arr.length];

  for (int i = 0; i < arr.length; i++)
  {
    if (i == 0)
    {
      tempArray[i] = ruleprocess(arr[arr.length-1], arr[i], arr[i+1]);
    } else if (i == arr.length -1)
    {
      tempArray[i] = ruleprocess(arr[i-1], arr[i], arr[0]);
    } else
    {
      tempArray[i] = ruleprocess(arr[i-1], arr[i], arr[i+1]);
    }
  }

  lineArray = tempArray;
}

// Rule 90
int ruleprocess(int one, int two, int three)
{
  int answer = 0;

  if (one == 0 && two == 0 && three == 0)
  {
    answer = 0;
  } else if (one == 0 && two == 0 && three == 1)
  {
    answer = 1;
  } else if (one == 0 && two == 1 && three == 0)
  {
    answer = 1;
  } else if (one == 1 && two == 0 && three == 0)
  {
    answer = 1;
  } else if (one == 0 && two == 1 && three == 1)
  {
    answer = 1;
  } else if (one == 1 && two == 0 && three == 1)
  {
    answer = 0;
  } else if (one == 1 && two == 1 && three == 0)
  {
    answer = 0;
  } else if (one == 1 && two == 1 && three == 1)
  {
    answer = 0;
  }

  return answer;
}