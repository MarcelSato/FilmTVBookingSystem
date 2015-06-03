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
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
            <li><a href="bookings">Bookings</a></li>
            <li><a href="myBookings">My Bookings</a></li>
            <li><a href="tc">Terms and Conditions</a></li>
            <li><a href="logout">Logout</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <br />
    <br />
    <br />
    <br />
		<div class="container theme-showcase" role="main">
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Terms and conditions for borrowing University equipment:</h3>
				    <h1>Students</h1>
				  </div>
				      <table class="table">
					    <tr>
					    <th>Student</th>
					    <th>Username</th>
					    </tr>
					    <c:forEach var="student" items="${stu}">
					    <tr>
					    <td><c:out value="${student.name}"></c:out></td>
					    <td><c:out value="${student.username}"></c:out></td>
					    </tr>    
					    </c:forEach>
					  </table>
				</div>  	
		</div>
		<div class="panel-footer">University of Greenwich</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="resources/js/ie10-viewport-bug-workaround.js"></script>
  
  </body>
</html>