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
String pSchool;
String sSchool;
String college;
String company;

	try
	{
		String currentUser=(String)session.getAttribute("email");
		session.setAttribute("email",currentUser);
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
			
		PreparedStatement ps=conn.prepareStatement("select pSchool,sSchool,college,company from eduwork where email=?");
		ps.setString(1,currentUser);
		
		ResultSet rs=ps.executeQuery();

		while(rs.next())
		{
			pSchool=rs.getString(1);
			sSchool=rs.getString(2);
			college=rs.getString(3);
			company=rs.getString(4);
			
			if(pSchool!=null)
			{
				out.println("<h4>Primary School </h4>"+" &nbsp "+pSchool+"<hr>");
			}
			if(sSchool!=null)
			{
				out.println("<h4>Secondary School  </h4>"+" &nbsp "+sSchool+"<hr>");
			}
			if(college!=null)
			{
				out.println("<h4>College  </h4>"+" &nbsp "+college+"<hr>");
			}
			if(company!=null)
			{
				out.println("<h4>Company </h4>"+" &nbsp "+company+"<hr>");
			}
			
			if(pSchool==null && sSchool==null && college==null && company==null)
			{
				out.println("<hr>"+"<h4 style='padding:10px;color:darkgrey'>Not Assigned </h4><hr>");
				
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