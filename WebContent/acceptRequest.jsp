<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
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
<body>
</head>

<%!
		String fname;
		String lname,currentUser,currentFriend;
		String connection;
		String em,fdEm;
		String matchingFdEmail,k="";
%>
<%! 
	String email;
	String fdEmail;
%>

<%
email=(String)session.getAttribute("email");
session.setAttribute("email",email);

if((request.getParameter("fdEmail")).equals(null))
{
		fdEmail=(String)session.getAttribute("fdEmail");
}

else
{
	fdEmail=request.getParameter("fdEmail");
	
}

session.setAttribute("fdEmail",fdEmail);

%>
<% 
//Conversion of Email to plain Text			
	
	em=email.replaceAll("[^a-zA-Z0-9]", "");
	fdEm=fdEmail.replaceAll("[^a-zA-Z0-9]", "");

				try
				{
					 currentUser=(String)session.getAttribute("email");;
					
					
					Class.forName("com.mysql.jdbc.Driver");
					
					Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
					
					
// currentUser friend Table Creation
					String sql="insert into friend"+em+" (frendEmail) values(?)";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1,fdEmail);
					ps.executeUpdate();
	
// currentFriend friend Table Creation
					sql="insert into friend"+fdEm+" (frendEmail) values(?)";
					ps=conn.prepareStatement(sql);
					ps.setString(1,email);
					ps.executeUpdate();
					

//Delete pendingRequestFriendUser Table 
	
					sql="delete from pendingRequest"+em+" where frendEmail=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1,fdEmail);
					ps.executeUpdate();
					
//Delete sentRequestFriendUser Table 
					
					sql="delete from sentRequest"+fdEm+" where frendEmail=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1,email);
					ps.executeUpdate();

					
					
					String referer = request.getHeader("Referer");
					response.sendRedirect(referer);
					
					
					
					
				
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
					

			%>

	
	






</body>
</html>