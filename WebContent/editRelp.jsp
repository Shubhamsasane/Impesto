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
  

</head>
	<body>
	
	

		<div class="container-fluid"><br>	
<%!

String status,email;
%>
<%
	if(session!=null)
		{  
        	 email=(String)session.getAttribute("email");  
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
		
<%

	try
	{
		String currentUser=email;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
		
%>

<%
		
		PreparedStatement ps=conn.prepareStatement("select status from relation where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			status=rs.getString(1);
			
			
			
			{
				if(status!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Realtionship Status </h4>"+" &nbsp "+ status+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Relationship Status </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}
				
				out.println("<input type='button' class='btn btn-info' data-toggle='collapse'  data-target='#status' value='edit'/>"+"</div>");
				out.println("<div id='status' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Relationship Status : "+ "<br>"+ "<br>"
				+"<input type='radio' name='status' value='Unmarried'>"+ "     Unmarried"+ "<br>"+ "<br>" 
				+"<input type='radio' name='status' value='Married'>" +"     Married"+ "<br>" + "<br>"
				+"<input type='radio' name='status' value='In a Relation'>"+ "     In a Relationship"+ "<br>" + "<br>"
				+"<input type='radio' name='status' value='Complex'>" +"     Complex"+ "<br>"+ "<br>"
				+"<input type='radio' name='status' value='Single'>" +"     Single"+ "<br>"+ "<br>"
				+"<input type='hidden' value='changeStatus' name='id'>");
				out.println("<input class='btn btn-success'type='submit' value='update'>"+"&nbsp");
				out.println("</form>"+"</div>");
				out.println("<hr>");
				
			}
 		}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	</div>
	</body>

</html>