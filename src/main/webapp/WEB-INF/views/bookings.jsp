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
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/stylesheet.css">
		
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">

	  <script>
	  $(function() {
	    $( "#datepicker" ).datepicker();
	  });
	  </script>
  </head>

  <body onload='loadCourses(<%=request.getSession().getAttribute("stuId").toString()%>)'>

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
            <li class="active"><a href="bookings">Book now</a></li>
            <li><a href="myBookings">My Bookings</a></li>
            <li><a href="tc">Terms and Conditions</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
          <%
          Object mySession = request.getSession().getAttribute("nameSession");
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
    <br />
	<br />
	<br />
    
    <div class="progress">
    <div class="progress-bar" id="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"><span class="sr-only">0% Complete</span></div>
    </div>
    

    <div class="col-md-3"></div>
    <div class="container col-md-6">

      <form class="form-signin" role="form" id="myForm" action="equip" method="post">
        <h4 class="form-signin-heading">Choose your course</h4>
        
				<select name="course" id="course" class="form-control" onchange="return courseSelected()">
					
				</select>
				
				<div id="tutor" style="display:none" >
					<h4>Select your tutor</h4>
					<select class="form-control" name="tutors" id="tutors" onchange="return tutorSelected()">
						<option value="Select">Select</option>
					</select>
				</div>
				
				<div id="location" style="display:none">
			        <h4 class="form-signin-heading">Where will you film?</h4>
					<select name="loc" id="loc" class="form-control" onchange="return locationSelected()">
						<option value="Select">Select</option>
						<option value="On Campus">On Campus</option>
						<option value="Off Campus">Off Campus</option>
					</select>								
				</div>
				
				<div id="dPicker" style="display:none">
					<h4 class="form-signin-heading">When will you pickup the kit? <a href="tc.php" target="_blank" title="We require at least 4 or 7 days booking in advance">help</a></h4>
					<input type="text" id="datepicker" name="datepicker" placeholder="Date" class="form-control" title="We require at least 4 or 7 days booking in advance" onfocus="deleteRDate()" readonly/>
				</div>
				
				<div id="dPickerReturn" style="display:none">
					<h4 class="form-signin-heading">When will you return the kit?</h4>
					<input type="text" id="datepickerReturn" name="datepickerReturn" placeholder="Date" class="form-control" readonly/>
				</div>
						
				<br />
				<div id="continueBtn" style="display:none">
					<input type="submit" name="submit" value="Continue" class="btn btn-lg btn-primary btn-block"/>
				</div>
				
      </form>
      <p id="myTest"></p>
    </div> <!-- /container -->

	<script src="resources/js/javascript.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
  </body>
  </html>
