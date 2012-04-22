package palindrome;

import java.io.IOException;
import javax.servlet.http.*;

public class SubmitServlet extends HttpServlet {
    public boolean isPalindrome(String p) {
      p = p.replaceAll("[^A-Za-z]", "");
      return p.length() == 0 ? false : p.equalsIgnoreCase(new StringBuilder(p).reverse().toString());
    }
    public int palindromeScore(String p) {
      if(!isPalindrome(p))
        return 0;
      return (int) Math.ceil(p.replaceAll("[^A-Za-z]", "").length() / 2.0);
    }

    public void nominateHoF(PalindromePlayer player, String palindrome, int score) {
      HallOfFame.getInstance().record_score(player, palindrome, score);
    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        String submission   = req.getParameter("palindrome"); // TODO check for null
        if (submission == null) {
          resp.getWriter().print("{\"error\" : \"null not a palindrome\"}");
          return;
        }
        int score               = palindromeScore(submission);
        if (score <= 0){ 
          resp.getWriter().print("{\"error\" : \"" + submission + " is not a palindrome\"}");
          return;
        }

        HttpSession session     = req.getSession(true);
        PalindromePlayer player = (PalindromePlayer) session.getAttribute("player");
        if (player == null){
          player = new PalindromePlayer(null);
          session.putValue("player", player);
        }
        player.addScore(submission, score);
        nominateHoF(player, submission, score);
        resp.getWriter().print(player.toJsonNoHistory());
    }

}
