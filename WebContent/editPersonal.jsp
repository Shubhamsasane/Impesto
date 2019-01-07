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

String fname,lname,email,gender,bDate;
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
		
		PreparedStatement ps=conn.prepareStatement("select fname,lname,gender,bDate from personal where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
			gender=rs.getString(3);
			bDate=rs.getString(4);
			
			
			
			{
				if(fname!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>First Name </h4>"+" &nbsp "+ fname+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>First Name </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}
				
				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#fname' value='edit'/>"+"</div>");
				out.println("<div id='fname' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit First Name : "+"<input type='text' name='fname'>"+"<input type='hidden' value='changeFName' name='id'>");
				out.println("<input class='btn btn-success'type='submit' value='update'>"+"&nbsp");
				out.println("</form>"+"</div>");
				out.println("<hr>");
				
			}
		
			{
				if(lname!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Last Name </h4>"+" &nbsp "+ lname+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Last Name </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}

				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#lname' value='edit'/>"+"</div>");
				out.println("<div id='lname' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Last Name : "+"<input type='text' name='lname'>"+"<input type='hidden' value='changeLName' name='id'>");
				out.println("<input class='btn btn-success'type='submit' value='update'>"+"&nbsp");
				out.println("</form>"+"</div>");
				out.println("<hr>");
				
			}
		
			{
				if(gender!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Gender </h4>"+" &nbsp "+ gender+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Gender </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}

				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#gender' value='edit'/>"+"</div>");
				out.println("<div id='gender' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Gender : "
				+"<input type='radio' name='gender' checked value='Female'>"+ "Female"+ "&nbsp" 
				+"<input type='radio' name='gender' value='Male'>" +" Male" 
				+"<input type='hidden' value='changeGender' name='id'>");
				out.println("<input class='btn btn-success' type='submit' value='update'>");
				out.println("</form>"+"</div>");
				out.println("<hr>");
			}
			
		
			{
				if(bDate!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Birth Date </h4>"+" &nbsp "+ bDate+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Birth Date </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}
			
				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#bDate' value='edit'/>"+"</div>");
				out.println("<div id='bDate' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Birth Date : "+"<input type='text' name='bDate'>"+"<input type='hidden' value='changeBDate' name='id'>");
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