<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
<%!
String email;
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
String phone;
String city;
String country;

	try
	{
		String currentUser=(String)session.getAttribute("email");
		session.setAttribute("email",currentUser);
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
		PreparedStatement ps=conn.prepareStatement("select phone,email,city,country from contact where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			phone=rs.getString(1);
			email=rs.getString(2);
			city=rs.getString(3);
			country=rs.getString(4);
			
			if(phone!=null)
			{
				out.println("<h4>Phone </h4>"+" &nbsp "+phone+"<hr>");
			}
			if(email!=null)
			{
				out.println("<h4>Email  </h4>"+" &nbsp "+email+"<hr>");
			}
			if(city!=null)
			{
				out.println("<h4>City  </h4>"+" &nbsp "+city+"<hr>");
			}
			if(country!=null)
			{
				out.println("<h4>Country  </h4>"+" &nbsp "+country+"<hr>");
			}
 		}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	
	</body>

</html>