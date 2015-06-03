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

	
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/stylesheet.css">
		
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">

 

  </head>

  <body onload="loadRA()">
<%
Object mySession = request.getSession().getAttribute("nameSession");
Object uNameSession = request.getSession().getAttribute("userName");
String message = "";
if (mySession == null){
 
} else {
 message = mySession.toString();
}
%>
													<!--  Navbar  -->
													
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
            <li><a href="home">Home</a></li>
			<li class="active"><a href="" class="bkngBtn">Book now</a></li>
			<li><a href="myBookings">My Bookings</a></li>
            <li><a href="tc">Terms and Conditions</a></li>
            <li><a href="logout">Logout</a></li>                   
          </ul>
          <p class="navbar-text navbar-right"><%= message %></p>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
												    <!--  Navbar  -->
																    
																    
    <br />
	<br />
	<br />
    <div class="progress">
    <div class="progress-bar" id="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"><span class="sr-only">0% Complete</span></div>
    </div>

	
    <div class="container myContainer">                   		<!-- /container -->
		<div class="col-md-3"></div>
	    <div class="container col-md-6 jumbotron">
			<h2>Risk Assessment</h2>
			<h3 style="color:red">${Failed}</h3>
			<h3>Upload RA</h3>
			<p>Put some more text here</p>
			<p>All bookings require a RA</p>
			<form method="POST" action="uploadFile" enctype="multipart/form-data">
		        
	        	<span class="btn btn-default btnNew">
	        	<input type="file" name="file" id="file" onchange="getFilename()">
	        	<input type="hidden" id="uName" value="<%= uNameSession %>"/>
	        	</span> 
		        <div class="input-group">
			        <span class="input-group-addon">Filename:</span>
			        <input type="text" class="form-control" name="name" id="slctFile">
		        </div>
		        <br />
		        <input type="submit" value="Upload" class="btn btn-lg btn-primary btn-block">
		        <input type="hidden" name="bookingModel" value='${Booking}'/>
		        <input type="hidden" name="basketModel"  value='${Basket} '/>
		    </form>
		    <br />
		    <form >
		    	<input name="submit" value="Back" class="btn btn-lg btn-primary btn-block" onclick="history.go(-1);"/>
		    </form>
<!--    		    <form role="form" action="equip/back" method="post"> -->
<%-- 		        <input type="hidden" name="bookingModel" value='${Booking}'/> --%>
<%-- 		        <input type="hidden" name="basketModel"  value='${Basket} '/> --%>
<!-- 		    	<input type="submit" name="submit" value="Back" class="btn btn-lg btn-primary btn-block"/> -->
<!-- 		    </form> -->
		</div>
    </div> 											<!-- /container -->
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="resources/js/javascript.js"></script>
	<script src="resources/js/jquery.cookies.2.2.0.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
</html>