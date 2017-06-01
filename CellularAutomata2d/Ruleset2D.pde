class Ruleset2D
{
  int[] ruleset;

  public Ruleset2D()
  {
    // Rule 90
    ruleset = new int[] {0, 1, 0, 1, 1, 0, 1, 0};
  }

  public Ruleset2D(int[] rules)
  {
    ruleset = rules;
  }

  public int getNext(int one, int two, int three)
  {
    int answer = 0;

    if (one == 0 && two == 0 && three == 0)
    {
      answer = ruleset[7];
    } else if (one == 0 && two == 0 && three == 1)
    {
      answer = ruleset[6];
    } else if (one == 0 && two == 1 && three == 0)
    {
      answer = ruleset[5];
    } else if (one == 1 && two == 0 && three == 0)
    {
      answer = ruleset[3];
    } else if (one == 0 && two == 1 && three == 1)
    {
      answer = ruleset[4];
    } else if (one == 1 && two == 0 && three == 1)
    {
      answer = ruleset[2];
    } else if (one == 1 && two == 1 && three == 0)
    {
      answer = ruleset[1];
    } else if (one == 1 && two == 1 && three == 1)
    {
      answer = ruleset[0];
    }

    return answer;
  }
}