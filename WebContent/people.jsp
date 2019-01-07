<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <title>PROFILE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
  <link rel="stylesheet" href="head.css" type="text/css">
  
   <!--ICON-->
   


</head>
<body style="padding-top:60px;" >	
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

<div class="container-fluid hidden-xs hidden-sm" style="text-align:center;background-color:#5bc0de;margin-top:10px;width:100%;color:white">
		<h2>M A N A G E    &nbsp&nbsp&nbsp   P E O P L E</h2>
</div>
	
<div class="container-fluid hidden-lg hidden-md" style="text-align:center;background-color:#5bc0de;margin-top:10px;width:100%;color:white">
		<h2>MANAGE PEOPLE</h2>
</div>

<hr>
	
<div class="container-fluid hidden-sm hidden-xs">
	<div class="row">
	<div class="col-sm-1"></div>
		<div class="col-md-2 well">
			<ul>
				<li><a href="friends.jsp" target="iframeInfo">Friends</a></li><hr>
				<li><a href="requestSent.jsp" target="iframeInfo">Request Sent People</a></li><hr>
				<li><a href="suggested.jsp" target="iframeInfo">Suggested</a></li>
			</ul>
		
				
		
		
		</div>
		
		
		<div class="col-md-9">
			
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" name="iframeInfo" src="friends.jsp" style="height:100%;scrolling:no"></iframe>		
			</div>
		</div>
		
		
	</div>
	
	
</div>
<div class="container-fluid hidden-lg hidden-md">
	<div class="dropdown">
  		<button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown">Select Catagory
  			<span class="caret"></span></button>
 			 <ul class="dropdown-menu">
  				<li><a href="friends.jsp" target="iframeInfo1">Friends</a></li><hr>
				<li><a href="requestSent.jsp" target="iframeInfo1">Request Sent People</a></li><hr>
				<li><a href="suggested.jsp" target="iframeInfo1">Suggested</a></li><hr>

 			 </ul>
	</div>
<br>



			
			<div class="embed-responsive embed-responsive-4by3">
				<iframe class="embed-responsive-item" name="iframeInfo1" src="friends.jsp" style="height:100%;scrolling:no"></iframe>		
			</div>
</div>



</body>
</html>