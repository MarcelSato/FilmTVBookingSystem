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

  <body onload="loadCategories(<%=request.getSession().getAttribute("courseId").toString()%>)">
	<%
	Object mySession = request.getSession().getAttribute("nameSession");
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
    <div class="progress-bar" id="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="w idth: 0%;"><span class="sr-only">0% Complete</span></div>
    </div>


    <div class="container"> 		<!-- /container -->
		<div class="jumbotron col-md-7">
		<div class="equiDiv">
			<div class="dropdown bookingDD hidden-lg hidden-md hidden-sm">
				<button class="dropdown-toggle btn" data-toggle="dropdown" role="button" aria-expanded="false">Booking Details</button>
				<table id="bkngTbl" class="dropdown-menu dropdown-menu-left" role="menu">
					<tr>
						<td>Tutor</td>
						<td> - ${Booking.Tutor}</td>
					</tr>
					<tr>
						<td>Course</td>
						<td> - ${Booking.Course}</td>
					</tr>
					<tr>
						<td>Location</td>
						<td> - ${Booking.Location}</td>
					</tr>
					<tr>
						<td>Collection</td>
						<td> - ${Booking.Collection}</td>
					</tr>
					<tr>
						<td>Return</td>
						<td> - ${Booking.Return}</td>
					</tr>
				</table>
			</div>	
			<div class="dropdown basketDD hidden-lg hidden-md hidden-sm">
				<button class="dropdown-toggle btn" data-toggle="dropdown" role="button" aria-expanded="false">Basket</button>
				<ul class="dropdown-menu dropdown-menu-right" role="menu">
					<li>
					<table id="basketDD">
					<tr><td>Basket is empty</td></tr>
					</table>
					</li>
				</ul>
			</div>
			</div>
		    <form class="" role="form" id="myForm" action="ra" method="post">
				<div class="input-group">
		  			
		   			<select name="category" id="category" class="form-control" onchange="catSelected()"></select>
		   			<span class="input-group-addon">Select category</span>
				</div>
				<br />
				<div id="equip" class="cntBtn" style="display:none">
					<table class="table well newTable" id="equipment"></table>
				</div>
				
				<input type="submit" name="submit" value="Continue" class="btn btn-lg btn-primary btn-block" id="ctnBtn" style="display:none"/>
				
				<input type="hidden" name="bookingModel" value='${Booking}'/>
				<input type="hidden" id="basketModel" name="basketModel"/>
		    </form>
		    <br />
		    <form >
		    	<input name="submit" value="Back" class="btn btn-lg btn-primary btn-block" onclick="history.go(-1);"/>
		    </form>
		    
			<p id="errMsg"></p>
	    </div>
	    <div class="col-md-1 hidden-xs"></div>
	    <div class="col-md-4 hidden-xs">
	    	<div class="jumbotron newJumbo">
	    		<p>Booking Details</p>
	    		<table class="table">
					<tr>
						<td>Tutor</td>
						<td> - ${Booking.Tutor}</td>
					</tr>
					<tr>
						<td>Course</td>
						<td> - ${Booking.Course}</td>
					</tr>
					<tr>
						<td>Location</td>
						<td> - ${Booking.Location}</td>
					</tr>
					<tr>
						<td>Collection</td>
						<td> - ${Booking.Collection}</td>
					</tr>
					<tr>
						<td>Return</td>
						<td> - ${Booking.Return}</td>
					</tr>
				</table>
	    	</div>
	    	<div class="jumbotron newJumbo">
	    		<p>Basket</p>
	    		<table id="basketDDL" class="table">
					<tr><td>Basket is empty</td></tr>
				</table>
	    	</div>
	    </div>
    </div> 											<!-- /container -->
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="resources/js/javascript.js"></script>
	<script src="resources/js/jquery.cookies.2.2.0.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
  </html>