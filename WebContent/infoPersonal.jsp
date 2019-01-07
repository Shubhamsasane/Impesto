<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
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
String fname;
String lname;
String gender;
String bDate;
double phone;
String email;


	try
	{
		String currentUser=(String)session.getAttribute("email");
		session.setAttribute("email",currentUser);
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
		
		PreparedStatement ps=conn.prepareStatement("select fname,lname,gender,bDate,phone,email from personal where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			fname=rs.getString(1);
			lname=rs.getString(2);
			gender=rs.getString(3);
			bDate=rs.getString(4);
			phone=rs.getDouble(5);
			email=rs.getString(6);
			
			out.println("<h4 >First Name :</h4>"+"&nbsp "+fname+"<br>"+"<hr>");
			
			out.println("<h4>Last  Name </h4>"+" &nbsp "+lname+"<hr>");
			
			out.println("<h4>Gender </h4>"+" &nbsp "+gender+"<hr>");
			
			if(bDate!=null)
			{
				out.println("<h4>Phone </h4>"+" &nbsp "+phone+"<hr>");
			}
			
			//out.println("<h4>Phone </h4>"+" &nbsp "+phone+"<hr>");
			
			out.println("<h4>Email </h4>"+" &nbsp "+email+"<hr>");
			
				}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	
	</body>

</html>