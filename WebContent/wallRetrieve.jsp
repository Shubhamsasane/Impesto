<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*,java.io.*" %>
<%
Blob image = null;

byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
Connection conn=null;
OutputStream o=null;
String name="",currentFriend;

int price=0;
try {
Class.forName("com.mysql.jdbc.Driver");
	
 	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
	
	currentFriend=request.getParameter("email");
	

	String req="select wallpic from profile_pic where Email='"+currentFriend+"'";
	
	
stmt=conn.createStatement();
//stmt.setString(1,currentFriend);
//stmt.executeUpdate();
Blob img;
	imgData=null;
	rs=stmt.executeQuery(req);
//	stmt.setString(1,currentFriend); 
	response.setContentType("image/jpg");
	 o=response.getOutputStream();
	while(rs.next())
	{
		
	   
		img=rs.getBlob("wallpic");
		imgData=img.getBytes(1, (int)img.length());
		 
		 
		
		 o.write(imgData);
		 
		
		
	}
	
	
	rs.close();
	stmt.close();

	 o.flush();
o.close();

}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>