package palindrome;
public class HallOfFame {
  public PalindromePlayer[] score_total; 
  public PalindromePlayer[] score_high;
  private int size;
  public int cnt;

  private HallOfFame(int hof_size) {
    score_total = new PalindromePlayer[hof_size];
    score_high  = new PalindromePlayer[hof_size];
    size        = hof_size;
  }

  private static HallOfFame instance = new HallOfFame(5);
  public  static HallOfFame getInstance() { return instance; }

  public void record_score(PalindromePlayer player, String palindrome, int score){
    cnt += 1;
    System.out.println("count is " + cnt);
    for(int i = 0; i <= size; i++){
      PalindromePlayer p = score_total[i];
      if (p == null || p.getTotalScore() < player.getTotalScore()) {
        score_total[i] = player;
        break;
      } else if(p.getTotalScore() == player.getTotalScore()) {
        break;
      }
    }

    for(int i = 0; i <= size; i++){
      PalindromePlayer p = score_high[i];
      if (p == null || p.getHighScore() < player.getHighScore()) {
        score_high[i] = player;
        break;
      } else if(p.getHighScore() == player.getHighScore()) {
        break;
      }
    }
  }

}
