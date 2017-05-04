import java.util.LinkedList;

BufferedReader reader;
String line;
HashMap<Integer, LinkedList<String>> wordsMap = new HashMap();
int[] allWords;

void setup()
{
  // Open the file from the createWriter() example
  reader = createReader("DantesGoettlicheKomoedieKapitel2.txt");
  size(1500, 1500);
  background(255);

  line = "";
  while (line != null)
  {
    try
    {
      line = reader.readLine();
    } 
    catch (IOException e)
    {
      e.printStackTrace();
      line = null;
    }

    if (line != null && !line.isEmpty())
    {
      String[] pieces = split(line, " ");
      for (int i = 0; i < pieces.length; i++)
      {
        String word = pieces[i];

        int hashVal = word.hashCode();
        if (wordsMap.containsKey(hashVal))
        {
          if ((i+1) < pieces.length)
          {
            LinkedList<String> lList = wordsMap.remove(hashVal);
            lList.add(pieces[i+1]);
            wordsMap.put(hashVal, lList);
          }
        } else
        {
          if ((i+1) < pieces.length)
          {
            LinkedList<String> lList = new LinkedList<String>();
            lList.add(pieces[i+1]);
            wordsMap.put(hashVal, lList);
          }
        }
      }
      //println(pieces);
    }
  }

  // from here on every Word has an linkedList with all words that came after that word
  //println(wordsMap.get("Dichter".hashCode()));
  println(wordsMap.keySet());
  allWords = new int[wordsMap.keySet().size()];
  Object[] wordsMapArr = wordsMap.keySet().toArray();

  for (int i = 0; i < allWords.length; i++)
  {
    allWords[i] = (int) wordsMapArr[i];
  }
}

void draw()
{
  String poetryLine = "";
  int randomNumber;
  LinkedList tempList;

  int wordForNext = allWords[(int) random(allWords.length)];

  for (int i = 0; i < 8; i++)
  {
    tempList = wordsMap.get(wordForNext);
    if (tempList != null)
    {
      randomNumber = (int) random(tempList.size());
      wordForNext = tempList.get(randomNumber).hashCode();
      poetryLine += tempList.get(randomNumber) + " ";
    }
  }

  println(poetryLine);
}