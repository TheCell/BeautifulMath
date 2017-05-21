static class Ruleset
{
  private static ArrayList<Sym> newList;

  static public ArrayList<Sym> applyRules(ArrayList<Sym> currentGen)
  {
    newList = new ArrayList<Sym>();

    for (Sym instruction : currentGen)
    {
      switch(instruction)
      {
      case TD:
        newList.add(Sym.TD);
        newList.add(Sym.TD);
        newList.add(Sym.RR);

        newList.add(Sym.LB);
        newList.add(Sym.RR);
        newList.add(Sym.TD);
        newList.add(Sym.RL);
        newList.add(Sym.TD);
        newList.add(Sym.RL);
        newList.add(Sym.TD);
        newList.add(Sym.RB);

        newList.add(Sym.RL);

        newList.add(Sym.LB);
        newList.add(Sym.RL);
        newList.add(Sym.TD);
        newList.add(Sym.RR);
        newList.add(Sym.TD);
        newList.add(Sym.RR);
        newList.add(Sym.TD);
        newList.add(Sym.RB);
        break;
      default:
        break;
      }
    }
    
    return newList;
  }
}