package palindrome;

import java.io.IOException;
import javax.servlet.http.*;

public class SetNameServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        String uname   = req.getParameter("username"); // TODO check for null
        if (uname == null) {
          resp.getWriter().print("{\"error\" : \"username cannot be null\"}");
          return;
        }

        HttpSession session     = req.getSession(true);
        PalindromePlayer player = (PalindromePlayer) session.getAttribute("player");
        if (player == null){
          player = new PalindromePlayer(uname);
          session.putValue("player", player);
        }
        player.name = uname;
        //resp.sendRedirect("/index.jsp");

        resp.getWriter().print(player.toJsonNoHistory());
    }

}

