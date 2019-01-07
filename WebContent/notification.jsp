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
<body style="padding-top:70px;">	
	<%@include file="heading.jsp"%>

<%!
		
		String fname,lname,currentUser,currentFriend;
		String connection;
		String em;
		String matchingFdEmail,k="",notification;
%>
<%! 
	String email;
	String fdEmail;
%>

<%
	fdEmail=(String)session.getAttribute("fdEmail");
	email=(String)session.getAttribute("email");
	session.setAttribute("email",email);
	session.setAttribute("fdEmail",fdEmail);
%>

	
	
<div class="container-fluid" style="text-align:center;background-color:#5bc0de;margin-top:10px;width:100%;color:white">
		<h2>N O T I F I C A T I O N</h2>
</div>
<hr>	
<div class="container">

	
			
	<%
		
		try
		{
			count=0;
			currentUser=(String)session.getAttribute("email");
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
				connection="not sent";
			
			 
//Conversion of Email to plain Text			
			
			em=currentUser.replaceAll("[^a-zA-Z0-9]", "");

//Pending Request
			String sql="select frendEmail from pendingRequest"+em;
			PreparedStatement ps=conn.prepareStatement(sql);
			notification="no notification";
			ResultSet rs1=ps.executeQuery();
			 
			
			while(rs1.next())
			{
				notification="notification";
				fdEmail=rs1.getString(1);
		// Personal Table
				
				ps=conn.prepareStatement("select fname,lname from personal where email=?");
				ps.setString(1,fdEmail);
			
				ResultSet rs=ps.executeQuery();
			
				while(rs.next())
				
				{
					
					 fname=rs.getString(1);
					 lname=rs.getString(2);
				
	 			}
				
					//session.setAttribute("fdEmail",fdEmail);
					out.println("<a href='fdProfile.jsp?fdEmail="+fdEmail+"' target='_top'>");

					out.println("<div class='row'>"+"<div class='col-sm-1'></div>");
					out.println("<div class='col-sm-3'>");
					out.println("<img src='fdRetrieve.jsp?fdEmail="+fdEmail+"' height='120px' style='border:2px solid black' alt='friend'>");
					out.println("<h3>");
					out.print(fname+' '+lname);
					out.print("</h3>"+"</div></a>");
					out.println("<div class='col-sm-8'>"+"<h4>");
					out.println(fname+' '+lname+" has Sent you Friend Request"+"</h4>");
					out.println("<input type='button' class='btn btn-info' data-toggle='collapse' data-target='#respond"+count+"' value='Respond'/>");
					out.println("<div 'style='float:right;'id='respond"+count+"' class='collapse well'>");
					out.println("<form action='acceptRequest.jsp?fdEmail="+fdEmail+"' method='post'>");
					out.println("<input class='btn btn-success'type='submit'name='fdEmail' value='Accept'>"+"</form>"+"<br><br>");
					out.println("<form action='rejectRequest.jsp?fdEmail="+fdEmail+"' method='post'>");
					out.println("<input class='btn btn-success'type='submit'name='fdEmail' value='Reject'>");
					out.println("</form>"+"</div>");
					out.println("</div>");
					out.println("</div>"+"<hr>");
					count++;
					
					
					
				}
			
			}
		catch(Exception e)
			{
				e.printStackTrace();
			}
		
		if(notification.equals("no notification"))
			{
				out.println("<div class='container' >");
					out.println("<div class='row well'>");
					out.println("<h3 style='text-align:center;'>"+ "You Dont Have any Notifications"+"</h3>");	
					out.println("</div>");
				out.println("</div>");
			}	
								
	%>
	
</div>
	
<%@include file="footer.jsp"  %>		
	
</body>
</html>