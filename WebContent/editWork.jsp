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

String email;
String pSchool;
String sSchool;
String college;
String company;

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
		
		PreparedStatement ps=conn.prepareStatement("select pSchool,sSchool,college,company from eduwork where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			pSchool=rs.getString(1);
			sSchool=rs.getString(2);
			college=rs.getString(3);
			company=rs.getString(4);
			
			{
				if(pSchool!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Primary School </h4>"+" &nbsp "+ pSchool+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Primary School </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}
				
				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#pSchool' value='edit'/>"+"</div>");
				out.println("<div id='pSchool' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Primary School : "+"<input type='text' name='pSchool'>"+"<input type='hidden' value='changePSchool' name='id'>");
				out.println("<input class='btn btn-success'type='submit' value='update'>"+"&nbsp");
				out.println("</form>"+"</div>");
				out.println("<hr>");
				
			}
		
			{
				if(sSchool!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Secondary School </h4>"+" &nbsp "+ sSchool+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Secondary School </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}

				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#sSchool' value='edit'/>"+"</div>");
				out.println("<div id='sSchool' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Secondary School : "+"<input type='text' name='sSchool'>"+"<input type='hidden' value='changeSSchool' name='id'>");
				out.println("<input class='btn btn-success'type='submit' value='update'>"+"&nbsp");
				out.println("</form>"+"</div>");
				out.println("<hr>");
				
			}
		
			{
				if(college!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>College </h4>"+" &nbsp "+ college+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>College </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}

				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#college' value='edit'/>"+"</div>");
				out.println("<div id='college' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit College : "+"<input type='text' name='college'>"+"<input type='hidden' value='changeCollege' name='id'>");
				out.println("<input class='btn btn-success' type='submit' value='update'>");
				out.println("</form>"+"</div>");
				out.println("<hr>");
			}
		
			{
				if(company!=null)
				{
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Company </h4>"+" &nbsp "+ company+ "</p>"+"</div>");
				}
				else
				{	
					out.println("<div class='row'>"+"<div class='col-sm-8'>"+"<h4>Company </h4>"+" &nbsp "+ "<span style='color:darkgrey'> Not Assigned</span>"+ "</p>"+"</div>");
				}
			
				out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#company' value='edit'/>"+"</div>");
				out.println("<div id='company' class='collapse well'>");
				out.println("<form action='updateInfo' method='post'>");
				out.println("Edit Company : "+"<input type='text' name='company'>"+"<input type='hidden' value='changeCompany' name='id'>");
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