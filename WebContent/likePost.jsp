<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
 <%@ page trimDirectiveWhitespaces="true" %>
 <%@ page import="java.util.Date" %>
 
    <%@ page import="java.text.SimpleDateFormat" %>
 
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
<%!

String status,email;
int count=0;
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
		String currentFriend=request.getParameter("email");
    	
    	String time=request.getParameter("time");
    	String backer=request.getParameter("backer");
    	
		
		String currentUser=email;
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy");
		java.util.Date date = sdf1.parse(time);
		java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());  
		
		SimpleDateFormat print = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		String time1=print.format(date);
		
		
		PreparedStatement ps=conn.prepareStatement("select postlike from timeline where email='"+currentFriend+"' and time like'"+time1+"'");
		
		ResultSet rs2=ps.executeQuery();

		if(rs2.next())
		{
 			count=rs2.getInt(1);
		}
		count++;
		String req="update timeline set postlike="+count+" where email='"+currentFriend+"' and time like '"+time1+"'";
		
			
		 ps=conn.prepareStatement(req);
	
		ps.executeUpdate();
		conn.close();
		ps.close();
		
		if(backer.equals("timeline"))
		{
			RequestDispatcher rd=request.getRequestDispatcher("timeline.jsp");
			rd.forward(request, response);
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			rd.forward(request, response);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	
	</body>

</html>