package palindrome;
import java.util.Hashtable;
import com.google.gson.Gson;

public class PalindromePlayer {
  private Gson gson         = new Gson();
  private int score_total   = 0;
  private int score_high    = 0;
  private Hashtable history = new Hashtable();
  public String name;

  public PalindromePlayer(String player_name) {
    name = player_name;
  }

  public int getHighScore()  { return score_high; }
  public int getTotalScore() { return score_total; }

  public void addScore(String palindrome, int score){
    if (history.containsKey(palindrome)) 
      return;

    history.put(palindrome, score);
    score_total += score;
    if(score > score_high)
      score_high = score;
  }

  public String toJson(){
    if (name == null) {
      return "{ \"name\" : " + name + ",  \"score_total\" : " + score_total + ", \"score_high\" : " + score_high + ", \"palindromes\" : " + gson.toJson(history.keySet().toArray()) + "}";
    } else {
      return "{ \"name\" : \"" + name + "\",  \"score_total\" : " + score_total + ", \"score_high\" : " + score_high + ", \"palindromes\" : " + gson.toJson(history.keySet().toArray()) + "}";
    }

  }
  public String toJsonNoHistory() {
    if (name == null) {
      return "{ \"name\" : " + name + ", \"score_total\" : " + score_total + ", \"score_high\" : " + score_high + "}";
    } else {
      return "{ \"name\" : \"" + name + "\", \"score_total\" : " + score_total + ", \"score_high\" : " + score_high + "}";
    }
  }

}
