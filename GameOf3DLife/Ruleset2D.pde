class Ruleset2D
{
  int[] ruleset;

  public Ruleset2D()
  {
    //this.ruleset = new int[]{0, 0, 1, 1, 0, 0, 0, 0, 0, 0};
    this.ruleset = new int[]{0, 0, 1, 1, 0, 0, 0, 0, 0, 0};
  }

  public Ruleset2D(int[] rules)
  {
    this.ruleset = rules;
  }

  /**
  * tells if the cell survives, gets born or dies
  **/
  public int getNext(int amountOfNeighboursAlive)
  {
    int answer = 0;
    
    if(amountOfNeighboursAlive < this.ruleset.length)
    {
      answer = this.ruleset[amountOfNeighboursAlive];
    }
    
    return answer;
  }
}