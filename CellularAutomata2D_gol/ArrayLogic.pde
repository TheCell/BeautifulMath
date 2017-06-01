static class ArrayLogic
{
  static int getTopLeft(int[][] arr, int x, int y)
  {
    int answer = 0;

    if (x == 0 && y == 0)
    {
      answer = arr[arr.length-1][arr[0].length-1];
    }
    else if (x == 0 && y > 0)
    {
      answer = arr[arr.length-1][y-1];
    }
    else if (x > 0 && y == 0)
    {
      answer = arr[x-1][arr[0].length-1];
    }
    else
    {
      answer = arr[x-1][y-1];
    }
    
    return answer;
  }

  static int getTop(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if(y == 0)
    {
      answer = arr[x][arr[0].length-1];
    }
    else
    {
      answer = arr[x][y-1];
    }
    return answer;
  }

  static int getTopRight(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if (x == arr.length-1 && y == 0)
    {
      // top right
      answer = arr[0][arr[0].length-1];
    }
    else if (x < arr.length-1 && y == 0)
    {
      // top
      answer = arr[x+1][arr[0].length-1];
    }
    else if (x == arr.length-1 && y > 0)
    {
      // right
      answer = arr[0][y-1];
    }
    else
    {
      // middle
      answer = arr[x+1][y-1];
    }
    
    return answer;
  }

  static int getLeft(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if(x == 0)
    {
      answer = arr[arr.length-1][y];
    }
    else
    {
      answer = arr[x-1][y];
    }
    
    return answer;
  }

  static int getRight(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if(x == arr.length-1)
    {
      answer = arr[0][y];
    }
    else
    {
      answer = arr[x+1][y];
    }
    
    return answer;
  }

  static int getBottomLeft(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if (x > 0 && y == arr[0].length)
    {
      answer = arr[x-1][0];
    }
    else if (x == 0 && y < arr[0].length-1)
    {
      answer = arr[arr.length-1][y+1];
    }
    else if (x == 0 && y == arr[0].length-1)
    {
      answer = arr[arr.length-1][0];
    }
    else
    {
      answer = arr[x-1][y+1];
    }
    
    return answer;
  }

  static int getBottom(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if(y == arr[0].length)
    {
      answer = arr[x][0];
    }
    else
    {
      answer = arr[x][y+1];
    }
    
    return answer;
  }

  static int getBottomRight(int[][] arr, int x, int y)
  {
    int answer = 0;
    
    if (x == arr.length-1 && y < arr[0].length-1)
    {
      answer = arr[0][y+1];
    }
    else if (x == arr.length-1 && y == arr[0].length-1)
    {
      answer = arr[0][0];
    }
    else if (x < arr.length-1 && y == arr[0].length-1)
    {
      answer = arr[x+1][0];
    }
    else
    {
      answer = arr[x+1][y+1];
    }
    
    return answer;
  }
}