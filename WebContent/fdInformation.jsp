<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>PROFILE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home1.css" type="text/css">
<link rel="stylesheet" href="head.css" type="text/css">
  

</head>
<body>
<%! 
	String email;
	String fdEmail;
%>

<%
email=(String)session.getAttribute("email");
session.setAttribute("email",email);
fdEmail=(String)session.getAttribute("fdEmail");
session.setAttribute("fdEmail",fdEmail);
%>

<div class="container=fluid">
		<h1 style="text-align:center;background-color:black;padding:10px;color:#00bcd4">INFORMATION</h1>
</div>
	
<hr>
	
<div class="container">
	<div class="row">
		<div class="col-sm-3 well">
			<ul>
				<li><a href="fdInfoPersonal.jsp" target="iframeInfo">Personal</a></li><hr>
				<li><a href="fdInfoWork.jsp" target="iframeInfo">Education/Work</a></li><hr>
				<li><a href="fdInfoContact.jsp" target="iframeInfo">Contact</a></li><hr>
				<li><a href="fdInfoRelp.jsp" target="iframeInfo">Family and Relationship</a></li>
						
			
			</ul>
		
				
		
		
		</div>
		
		<div class="col-sm-9">
			
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" name="iframeInfo" src="fdInfoPersonal.jsp" style="height:100%;scrolling:no"></iframe>		
			</div>
		</div>
		
		
	</div>
	
	
</div>


</body>
</html>