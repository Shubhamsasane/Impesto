<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOG IN</title>

 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="header.css" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="form.css">
 

  
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

<div class="container well" style="width:600px;height:325px;margin-top:10px;box-shadow: 14px 13px 5px #888888;">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#00cccc;text-align:center;">
					
						<a href="home.jsp" style="font-size:40px;color:white;"><strong>Impesto</strong></a>
			</div>
				<div class="panel-body" >
					<fieldset style="padding:10px;border:1px solid #0EBFE9;border-radius:10px; " >
						<h3> &nbsp &nbsp &nbsp Do  You Really want To Delete Account?</h3><br><br>
						
						<!--  <form action="personal.jsp" method="post" ></form>
								<input  type="submit" style="float:right;align-text:center;width:150px;margin-bottom:20px;margin-right:90px;" class="btn btn-success" value="No">
        			     </form>float:left-->
        			     <form action="accountDelete.jsp" target="_parent"  method="post">
								<input  type="submit" style="clear:none;align-text:center;width:150px;margin-left:180px;" class="btn btn-danger" value="Yes">
						</form>
        			</fieldset>
        		
        	</div>
     	</div>
	</div>




		

</body>
</html>