    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>HOME</title>
  
     <meta name="viewport" content="fr" width="device-width", initial-scale="1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
    <link rel="stylesheet" href="head.css" type="text/css">
    <link rel="stylesheet" href="settings.css" type="text/css">
    
    <!--ICON-->
</head>
    
<body style="padding-top:70px;">

<%
	if(session!=null)
		{  
        	String email=(String)session.getAttribute("email");  
        	session.setAttribute("email",email);
    	}  
	else
		{  
        	out.println("<script type=\"text/javascript\">");
			out.println("alert('Please Log in First');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
        }  
%>
	
	
<%@include file="heading.jsp"  %>
	
		<hr>
	
	<div class="container hidden-sm hidden-xs">
		<div class="row ">
			<div class="col-md-2 col-lg-3 well">
				<ul>
					<a  href="editPersonal.jsp" target="iframeInfo"><li  >Personal</li></a><hr>
					<a href="editWork.jsp" target="iframeInfo"><li   >Education/Work</li></a><hr>
					<a href="editContact.jsp" target="iframeInfo"><li  >Contact</li></a><hr>
					<a href="editRelp.jsp" target="iframeInfo"><li   >Family and Relationship</li></a><hr>
					<a href="editPassword.jsp" target="iframeInfo"><li   >Change Password</li></a><hr>
					<a href="deleteFront.jsp" target="iframeInfo"><li   >Delete Account</li></a>
				</ul>
			
				
			</div>
			 
		<div class="col-md-10 col-lg-9">
			
			<div  class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" name="iframeInfo" src="editPersonal.jsp" height="100%"></iframe>		
			</div>
		</div>
		</div>
	
	</div>
	

<div class="container hidden-lg hidden-md">
	<div class="dropdown">
  		<button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">Select Catagory
  			<span class="caret"></span></button>
 			 <ul class="dropdown-menu">
  				
  					<li><a  href="editPersonal.jsp" target="iframeInfo">Personal</li></a><hr>
					<li><a href="editWork.jsp" target="iframeInfo">Education/Work</li></a><hr>
					<li><a href="editContact.jsp" target="iframeInfo">Contact</li></a><hr>
					<li><a href="editRelp.jsp" target="iframeInfo">Family and Relationship</li></a><hr>
					<li><a href="editPassword.jsp" target="iframeInfo">Change Password</li></a><hr>
					<li><a href="deleteFront.jsp" target="iframeInfo">Delete Account</li></a>

 			 </ul>
	</div><br>			
			<div class="embed-responsive embed-responsive-4by3">
				<iframe class="embed-responsive-item" name="iframeInfo1" src="friends.jsp" style="height:100%;scrolling:no"></iframe>		
			</div>
	</div>

		
	
<%@include file="footer.jsp"  %>		
	
	
		
</body>
</html>