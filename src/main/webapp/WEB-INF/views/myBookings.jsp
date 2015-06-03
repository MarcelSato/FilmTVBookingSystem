<%@page import="org.gre.filmtv.Course"%>
<%@page import="org.gre.filmtv.Tutor"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="resources/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="resources/css/bootstrap-theme.css.map" rel="stylesheet">
    <!-- My styling -->
	<link href="resources/css/stylesheet.css" rel="stylesheet">
    
  </head>
  <body>
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
            <li><a href="bookings">Book now</a></li>
            <li class="active"><a href="myBookings">My Bookings</a></li>
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
    <br />
	<div class="container" role="main">
		  <div class="col-md-3"></div>
		  <div class="jumbotron col-md-6">
			    <h2>My Bookings</h2>
				<table class="table">
				    <c:forEach var="item" items="${Bookings}" >
				    	<tr><td>Booking no.</td><td>- ${item.bookingId}</td>
				    	<tr><td>Course</td>     <td>- <c:set var="cId" value="${item.courseId}"/> <%= Course.getCourseName((int)pageContext.getAttribute("cId")) %></td></tr>
				    	<tr><td>Tutor</td>      <td>- <c:set var="tId" value="${item.tutorId}"/> <%= Tutor.getTutorName((int)pageContext.getAttribute("tId")) %></td></tr>
				    	<tr><td>Collection</td> <td>- ${item.startDate}</td></tr>
				    	<tr><td>Return</td>     <td>- ${item.endDate}</td></tr>
				    	<tr><td>Location</td>   <td>- ${item.location}</td></tr>
				    	<tr><td>Booked on </td> <td>- ${item.timestamp}</td></tr>
				    	<tr><td colspan="2" style="font-style: italic;">Equipment</td></tr>
				    	<c:forEach var="equip" items="${Basket}">
				    		<c:forEach var="itemA" items="${equip}">
				    			<c:forEach var="a" items="${BookingEquip}">
				    				<c:if test="${(a.equipmentId.equipmentId == itemA.equipmentId) && (a.bookingId.bookingId == item.bookingId)}">
						    			<tr><td>${itemA.name} </td><td> ${itemA.description}</td></tr>
					    			</c:if>
				    			</c:forEach>
				    		</c:forEach>			    		
				    	</c:forEach>
				    	<tr><td colspan="2"><hr/></td></tr>
				    </c:forEach>
			    </table> 
		  </div>  	
	</div>
<!-- 	<div class="panel-footer">University of Greenwich</div> -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>  
  </body>
</html>