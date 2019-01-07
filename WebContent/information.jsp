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
<body>
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

<div class="container=fluid">
		<h1 style="text-align:center;background-color:black;padding:10px;color:#00bcd4">INFORMATION</h1>
</div>
	
<hr>
	
<div class="container">
	<div class="row">
		<div class="col-sm-3 well">
			<ul>
				<li><a href="infoPersonal.jsp" target="iframeInfo">Personal</a></li><hr>
				<li><a href="infoWork.jsp" target="iframeInfo">Education/Work</a></li><hr>
				<li><a href="infoContact.jsp" target="iframeInfo">Contact</a></li><hr>
				<li><a href="infoRelp.jsp" target="iframeInfo">Family and Relationship</a></li>
						
			
			</ul>
		
				
		
		
		</div>
		
		<div class="col-sm-9">
			
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" name="iframeInfo" src="infoPersonal.jsp" style="height:100%;scrolling:no"></iframe>		
			</div>
		</div>
		
		
	</div>
	
	
</div>


</body>
</html>