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
		String currentUser,temp,status=null;
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




	<div class="container well" style="width:580px;height:600px;margin-top:40px;text-align:center;box-shadow: 14px 13px 5px #888888;">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#00cccc;color:black">
					<a href="home.jsp" style="font-size:40px;color:white;"><strong>Impesto</strong></a>
			</div>
				<div class="panel-body" >
					<fieldset style="padding:10px;border:1px solid #0EBFE9;border-radius:10px;" >
					
			<%  		
						//String temp=request.getParameter("temp");
        				out.println("<form  method='post' action='statusInsertPic' enctype='multipart/form-data'>");
        	
        				out.println("<h3>Share an Update  </h3><br><br>");
            				
            				status=request.getParameter("status");
            	        	
            					 if(status.equals(null)|| (status.equals("")))
            						{
            							out.println("<textarea class='form-control' name='status' rows='5' placeholder='How are You feeling?'></textarea><br><br>");		
            						}
            					else
            						{
        								out.println("<textarea class='form-control' name='status' rows='5'>"+status+"</textarea><br><br>");
        							}
        						
							
            							out.println("<input type='file'  style='margin-left:100px' class='btn btn-info' name='photo' size='50' placeholder='Upload Your Image'/><br>");
            							out.println("<input type='submit' style='width:150px;margin-bottom:40px;' class='btn btn-info' value='Share'>");
            						out.println("</form>");
            				out.println("</fieldset>");
        		%>
        		
        	</div>
     	</div>
	</div>

</body>
</html>