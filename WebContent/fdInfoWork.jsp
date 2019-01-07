<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
<%!
String pSchool,email;
String sSchool;
String college;
String company,fdEmail;


%>
	
<%
	if(session!=null)
		{  

		email=(String)session.getAttribute("email");
		session.setAttribute("email",email);
		fdEmail=(String)session.getAttribute("fdEmail");
		session.setAttribute("fdEmail",fdEmail);
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
		String currentFriend=(String)session.getAttribute("fdEmail");
		
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
		
		
		PreparedStatement ps=conn.prepareStatement("select pSchool,sSchool,college,company from eduwork where email=?");
		ps.setString(1,currentFriend);
		
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
				out.println("&nbsp &nbsp "+"<span style='color:green'>Not Assigned</span>"+"<hr>");
			}
 		}
/*		else
		{
			out.println("<h4>Status</h4>"+"&nbsp &nbsp "+"<span style='color:green'>Not Assigned</span>"+"<hr>");
		
		}
*/
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
		



	%>	
	
	</body>

</html>