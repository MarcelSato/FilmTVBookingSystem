<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">

	

    <title>Project Prototype</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="resources/css/bootstrap-theme.css.map" rel="stylesheet">
    <!-- My styling -->
	<link href="resources/css/stylesheet.css" rel="stylesheet">




    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    body{
    margin-top: 
    }
    </style>
  </head>

  <body role="document">

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="home">Film &amp; TV Booking System</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="home">Home</a></li>
            <li><a href="bookings">Book now</a></li>
            <li><a href="myBookings">My Bookings</a></li>
            <li><a href="tc">Terms and Conditions</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
          <%
          Object mySession = request.getSession(false).getAttribute("nameSession");
          String message = "";
          if (mySession == null){
        	  
          } else {
        	  message = mySession.toString();
          }
          %>
          <p class="navbar-text navbar-right"><%= message %></p>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
	<br/>
	<br/>
	<br/>
    <div class="container theme-showcase" role="main">

      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Film &amp; TV</h1>
        <h2>Booking System</h2>
        <p>Use this site to book the necessary equipment you need for your projects.</p>
        <p><a href="bookings" class="btn btn-primary btn-lg" role="button">Book now &raquo;</a></p>
        <p><a href="myBookings" class="btn btn-primary btn-lg" role="button">My Bookings &raquo;</a></p>
<!--         <p><a href="students" class="btn btn-primary btn-lg" role="button">See All Students &raquo;</a></p> -->
      </div>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="resources/js/bootstrap.min.js"></script>

  </body>
</html>
