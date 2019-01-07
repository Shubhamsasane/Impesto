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
<body style="height:100%;max-height:100%">	
<%!
		String em,email;
		String currentUser;
		String k;
		PreparedStatement ps;
		String sql;
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

	<%
	k="raj@gmail.com";
	em=k.replaceAll("[^a-zA-Z0-9]", "");
		
		try
		{
			 currentUser=(String)session.getAttribute("email");
			em=currentUser.replaceAll("[^a-zA-Z0-9]", "");
			
				
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
		
sql="drop table sentRequest"+em;
			
			 ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
/*
sql="drop table %chats"+em;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		
sql="drop table "+em+"chats%";
ps=conn.prepareStatement(sql);
ps.executeUpdate();
*/			
sql="drop table pendingRequest"+em;
			
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			
sql="drop table friend"+em;
			
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();

			

sql="delete from contact where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
			 
sql="delete from personal where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
			
sql="delete from eduwork where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
			
sql="delete from profile_pic where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
sql="delete from relation where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
sql="delete from users where email=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentUser);
			ps.executeUpdate();
			
			
out.println("<script type=\"text/javascript\">");
out.println("alert('Account Deleted');");
out.println("</script>");

RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
rd.include(request,response);

		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
			

	%>
	
	
	
	
	

</body>
</html>