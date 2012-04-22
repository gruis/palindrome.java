<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="palindrome.PalindromePlayer" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Palindrome emordnilaP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="/css/bootstrap.css" rel="stylesheet">
    <link href="/css/bootstrap-responsive.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
      }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <script src="/js/jquery-1.7.2-min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
      <%
        PalindromePlayer player = (PalindromePlayer) session.getAttribute("player");
        if (player == null){
          player = new PalindromePlayer(null);
          session.putValue("player", player);
        }
      %>
    <script src="/js/app.js" type="text/javascript"></script>
    <script type="text/javascript">
      (function($){
        $(document).ready(function(){
          var player = Player(<%= player.toJson() %>, $('.player')[0]);
          PalindromeApp().start(player, $('form.palindrome')[0]);
        });
      })(jQuery);

    </script>

  </head>

  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Palindromia</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="/index.jsp">Home</a></li>
              <li><a href="/halloffame.jsp">Hall of Fame</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>


    <div class="container">
      <div class="row">
        <div class="span4 alert-row">
          <div class="alert alert-block alert-error fade out">
            <a class="close" data-dismiss="alert">&times;</a>
            <span class="alert-msg"></span>
          </div>
        </div>
      </div>

      <div class="player">
        <div class="row">
          <div class="player_name span3">Player: <%= player.name %> </div>
        </div>

        <div class="row">
          <div class="score span2">
            High Score 
            <span class="score score_high"><%= player.getHighScore() %></span>
          </div>
          <div class="score span2" style="text-align:right;"> 
            Total Score
            <span class="score score_total"><%= player.getTotalScore() %></span>
          </div>
        </div>
      </div>

      <div class="row">
        <form class="palindrome span4 form-vertical" action="/submit" method="get">
          <input type="text" placeholder="Post a palindrome" class="span4" name="palindrome">
          <button type="submit" class="btn btn-primary btn-large">Submit</button>
        </form>
      </div>

      <hr>

      <div class="modal" id="save_scores" style="display: none; ">
        <div class="modal-header">
          <a class="close" data-dismiss="modal">×</a>
          <h3>Save Scores</h3>
        </div>
        <div class="modal-body">
          <form class="span3 form-vertical save_scores" action="/setname" method="get">
            <input type="text" placeholder="Username" class="span4" name="username">
          </form>
        </div>
        <div class="modal-footer">
          <a href="#" class="btn" data-dismiss="modal">Close</a>
          <a href="#" class="btn btn-primary submit">Save</a>
        </div>
      </div>


    </div> <!-- /container -->
  </body>
</html>
