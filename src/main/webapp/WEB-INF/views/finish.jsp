<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
    <title>Project Prototype</title>

    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/stylesheet.css">
    
  </head>
  <body class="newBody">
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
    <div class="progress-bar" id="progress" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"><span class="sr-only">0% Complete</span></div>
    </div>
		<div class="container" role="main">
			    <div class="container col-md-5 jumbotron">
					<h3 style="color:green">${Success}</h3>
					<h2>Review Booking</h2>
					<table class="table table-hover" role="menu">
						<tr>
							<td>Tutor</td>
							<td>${Booking.Tutor}</td>
						</tr>
						<tr>
							<td>Course</td>
							<td>${Booking.Course}</td>
						</tr>
						<tr>
							<td>Location</td>
							<td>${Booking.Location}</td>
						</tr>
						<tr>
							<td>Collection</td>
							<td>${Booking.Collection}</td>
						</tr>
						<tr>
							<td>Return</td>
							<td>${Booking.Return}</td>
						</tr>
					</table>
				</div>
				<div class="col-md-2"></div>
				<div class="container col-md-5 jumbotron">
					<table class="table">
						<tr><td colspan="2" class="reviewTd">Equipment</td></tr>
						<tr>
							<td>Name</td>
							<td>Quantity</td>
						</tr>
						<c:forEach var="item" items="${Basket}">
							<tr>
								<td><c:out value="${item.name}" /></td>
								<td><c:out value="${item.quantity}"/></td>
							</tr>
						</c:forEach>
					</table>
					<form role="form" id="" action="confirmation" method="post">
						<input type="hidden" name="bookingModel" value='${Booking}'/>
				        <input type="hidden" name="basketModel"  value='${Basket} '/>
						<input type="submit" value="Confirm" class="btn btn-lg btn-primary btn-block" />
					</form>
				</div>  
			</div>
<!-- 		<div class="panel-footer newFooter">University of Greenwich</div>	 -->
		
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

  
  </body>
</html>