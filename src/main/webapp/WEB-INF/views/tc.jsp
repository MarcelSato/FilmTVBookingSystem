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
            <li class="active"><a href="tc">Terms and Conditions</a></li>
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
		<div class="container theme-showcase" role="main">
				<div class="panel panel-default">
				  <div class="panel-heading">
				    <h3 class="panel-title">Terms and conditions for borrowing University equipment:</h3>
				  </div>
				  <div class="panel-body">
				  <ol>
						<li>Students may borrow University equipment needed for coursework only on the following terms and conditions:</li>
						<li>No University property may be removed from University premises without the consent of the Head of School evidenced by a completed signed authorisation.</li>
						<li>The borrower undertakes to ensure that the equipment is returned to the University in the same condition in which it was removed. No reconfiguration, modification, dismantling or removal of parts is permitted.</li>
						<li>Items used for bona fide coursework on campus are covered by the University's insurance policy. Items of equipment are not normally allowed to be taken outside the UK except with the express written permission of the Head of School. Where the University's insurance does not cover the use or extent of loss of the equipment, the borrower is financially liable for all loss or damage including any excesses payable under University insurance arrangements.</li>
						<li>In order to claim for equipment losses under the University's property insurance policy the School must (a) demonstrate that the equipment was listed in the University's inventory; (b) demonstrate that the borrower had been granted written permission to remove the equipment from University premises prior to the loss occurring; (c) where the loss occurred as a result of theft from a residence, vehicle or other premises, produce a copy of a police report.</li>
						<li>The University accepts no liability for any damage to third party property and/or persons arising out of the use of the equipment by the borrower and the borrower agrees to indemnify the University against all third party claims, actions, and demands howsoever arising from the use of the equipment.
Any carriage/transport costs arising from the removal or return of the borrowed equipment shall be borne by the borrower.</li>
						<li>Any carriage/transport costs arising from the removal or return of the borrowed equipment shall be borne by the borrower.</li>						
						<li>The equipment remains at all times the property of the University of Greenwich and the University reserves the right to recall the equipment at short notice if it is required for other University business.
Late returns of equipment may incur a charge.</li>
						<li>Late returns of equipment may incur a charge.
						<li>Non-return of equipment is a serious matter and shall be dealt with as a breach of discipline by the student. If the non-return of equipment is not explained to the satisfaction of the University authorities the equipment will be considered stolen and the University will bring disciplinary charges against the borrower, and may at its sole discretion refer the matter to the police for recovery of the equipment and prosecution of the borrower.</li>
						<li>The borrower should submit this authorisation to caretaking / security staff when leaving University premises and must retain this form for as long as necessary, i.e. in the case of loaned equipment, until the equipment is returned to the University.</li>
						<li>
							Caretaking / security staff should permit the bearer to remove the equipment from the University premises provided:
							<ul>
								<li>This authorisation form is an original (i.e. not a photocopy).</li>
								<li>No changes have been made to the authorisation form.</li>
								<li>The form has been duly signed and bears the current date.</li>
							</ul>
						</li>
						<li>This authorisation is valid only for the School of Computing and Mathematical Sciences and for the period stated above. It must be returned immediately if recalled by the School for any reason.</li>
						<li>The signature of a staff member should be obtained on return of the equipment to the University. Where possible, the signatory should be the same staff member who authorised the loan of the equipment.</li>
					</ol>
				  </div>
				</div>  	
		</div>
<!-- 		<div class="panel-footer">University of Greenwich</div> -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

  
  </body>
</html>