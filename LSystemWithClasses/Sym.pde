public enum Sym
{
  TD ("Translate, Pen Down"), 
  TU ("Translate, Pen Up"), 
  RR ("Rotate Clockwise"), 
  RL ("Rotate Counter Clockwise"), 
  RB ("Right Bracket"), 
  LB ("Left Bracket");
  
  String description;
  
  private Sym(String description)
  {
    this.description = description;
  }
}