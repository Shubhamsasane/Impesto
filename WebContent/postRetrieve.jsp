<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <%@ page import="java.util.Date" %>
 <%@ page import="java.text.SimpleDateFormat" %>
 
   
 
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
OutputStream o1=null;
String name="",currentFriend;
String time;
int price=0;
try {

	
	Class.forName("com.mysql.jdbc.Driver");
	
 	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
	
	currentFriend=request.getParameter("email");
	
	time=request.getParameter("time");
	
	
	SimpleDateFormat sdf1 = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy");
	java.util.Date date = sdf1.parse(time);
	java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());  
	
	SimpleDateFormat print = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
	String time1=print.format(date);
	
	
	
	String req="select pic from timeline where Email='"+currentFriend+"' and time like '"+time1+"'";
	
	
stmt=conn.createStatement();
//stmt.setString(1,currentFriend);
//stmt.executeUpdate();

Blob img;
	imgData=null;
	rs=stmt.executeQuery(req);
//	stmt.setString(1,currentFriend); 
	response.setContentType("image/jpg");
	 o1=response.getOutputStream();
	

	while(rs.next())
	{
		
		
		img=rs.getBlob("pic");
		
		imgData=img.getBytes(1, (int)img.length());
		
		
		
		 o1.write(imgData);

		
	}
	
	
	rs.close();
	stmt.close();

	 o1.flush();
o1.close();


}
catch(Exception e)
{
	e.printStackTrace();
}



%>
</body>
</html>