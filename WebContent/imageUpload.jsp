<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
<link rel="stylesheet" href="head.css" type="text/css">
</head>
<body>
<%!
		String currentUser,temp;
%>

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


	<div class="container well" style="width:380px;height:427px;margin-top:100px;text-align:center;box-shadow: 14px 13px 5px #888888;">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#00cccc;color:black"">
					<a href="home.jsp" style="font-size:40px;color:white;"><strong>Impesto</strong></a>
			</div>
				<div class="panel-body" >
					<fieldset style="padding:10px;border:1px solid #0EBFE9;border-radius:10px; " >
					 
			<%  		
						String temp=request.getParameter("temp");
        				out.println("<form name='fileform' method='post' action='InsertPic?temp="+temp+ "'enctype='multipart/form-data'>");
        	%>
            				<label for="photo"> <h3><strong>Select Photo</strong>  </h3> </label><br><br><br>
            				<input type="file"  style="background-color:#00cccc;border-color:#00cccc;" class="btn btn-info" name="photo" size="50" placeholder="Upload Your Image" required/><br><br>
            				<input type="submit" style="width:150px;margin-bottom:40px;" class="btn btn-success" value="Upload">
        				</form>
        			</fieldset>
        		
        	</div>
     	</div>
	</div>

</body>
</html>