import java.util.LinkedList;
import processing.pdf.*;

BufferedReader reader;
String line;
HashMap<Integer, LinkedList<String>> wordsMap = new HashMap();
int[] allWords;
int counter = 0;
String poetryLine = "";
boolean recordPDF = false;
int debugCounter = 0;

void setup()
{
  // Open the file from the createWriter() example
  //reader = createReader("DantesGoettlicheKomoedieKapitel2.txt");
  //reader = createReader("SunziKunstDesKrieges.txt");
  //reader = createReader("EintrittderGermanenInDieGeschichte.txt");
  //reader = createReader("WilliamShakespearSonett1To15.txt");
  //reader = createReader("Marienkind.txt");
  //reader = createReader("WolfUndSiebenGeisslein.txt");
  //reader = createReader("seinOderNichtSein.txt");
  reader = createReader("thelovesongJAlfredPrufrock.txt");

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
  //println(wordsMap.keySet());
  allWords = new int[wordsMap.keySet().size()];
  Object[] wordsMapArr = wordsMap.keySet().toArray();

  for (int i = 0; i < allWords.length; i++)
  {
    allWords[i] = (int) wordsMapArr[i];
  }
}

void draw()
{
  background(255);

  if (counter < 5)
  {
    int randomNumber;
    LinkedList tempList;

    boolean sentenceComplete = false;
    String tempSentence = "";

    int wordForNext = allWords[(int) random(allWords.length)];

    while (!sentenceComplete)
    {
      tempList = wordsMap.get(wordForNext);

      if (tempList != null)
      {
        randomNumber = (int) random(tempList.size());
        wordForNext = tempList.get(randomNumber).hashCode();
        poetryLine += " " + tempList.get(randomNumber);
      } else {
        wordForNext = allWords[(int) random(allWords.length)];
      }

      if (tempSentence.length() > 144)
      {
        if (debugCounter < 5)
        {
          println(tempSentence);
          debugCounter++;
        }

        tempSentence = "";
      }

      if (tempSentence.length() > 20 && tempSentence.length() < 144 && 
        (tempSentence.endsWith(". ")
        || tempSentence.endsWith("! ")
        || tempSentence.endsWith("? ")
        || tempSentence.endsWith("; ")
        || tempSentence.endsWith("\" ")))
      {
        sentenceComplete = true;
        println("done");
      }
    }

    poetryLine = tempSentence;

    /*
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
     */

    //println(poetryLine);
    counter++;
  }

  if (recordPDF)
  {
    saveFrame("poem-####.png");
    beginRecord(PDF, "poem-####.pdf");
  }

  textSize(30);
  fill(50);
  text(poetryLine, 300, 100, 900, 500);  // Text wraps within text box
  if (recordPDF)
  {
    endRecord();
    recordPDF = false;
  }

  if (counter == 5)
  {
    println(poetryLine);
    counter++;
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT) {
    poetryLine = "";
    counter = 0;
  } else if (mouseButton == RIGHT) {
    recordPDF = true;
  }
}