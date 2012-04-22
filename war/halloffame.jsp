<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="palindrome.PalindromePlayer" %>
<%@ page import="palindrome.HallOfFame" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Palindrome Hall of Fame</title>
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
    <% HallOfFame hof = HallOfFame.getInstance(); %>
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
              <li><a href="/index.jsp">Home</a></li>
              <li class="active"><a href="/halloffame.jsp">Hall of Fame</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container">
      <h2>Top <%= hof.score_total.length %> Total Scores</h2>
      <table class="table table-striped">
        <tbody>
          <% for(PalindromePlayer p : hof.score_total) { %>
            <% if(p != null) { %>
              <tr>
                <td><%= p.name %></td><td><%= p.getTotalScore() %></td>
              </tr>
            <% } %>
          <% } %>
        </tbody>
      </table>

      <h2>Top <%= hof.score_high.length %> Highest Scores</h2>
      <table class="table table-striped">
        <tbody>
          <% for(PalindromePlayer p : hof.score_high) { %>
            <% if(p != null) { %>
              <tr>
                <td><%= p.name %></td><td><%= p.getHighScore() %></td>
              </tr>
            <% } %>
          <% } %>
        </tbody>
      </table>

    </div> <!-- /container -->
  </body>
</html>

