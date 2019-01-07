<%@ page trimDirectiveWhitespaces="true" %>
            <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
          pageEncoding="ISO-8859-1"%>
           <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"                                "http://www.w3.org/TR/html4/loose.dtd">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
     </head>
    <body>
     <%@ page import="java.io.*"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
  <%@ page import="java.text.*"%>
 <%@ page import="javax.servlet.*"%>
 <%@ page import="javax.servlet.http.*"%>
 <%@ page import="javax.servlet.http.HttpSession"%>
 <%@ page language="java"%>
 <%@ page session="true"%>

<%!
	
		String currentUser;
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
try{
	
	currentUser=(String)session.getAttribute("email");

	Class.forName("com.mysql.jdbc.Driver");
	
 	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
	
		 Statement st = conn.createStatement();
 	 PreparedStatement ps = conn.prepareStatement("select wallPic from profile_pic where email=?");
	 ps.setString(1,currentUser);
 	 ResultSet rs=ps.executeQuery();

while(rs.next())   
 {
	byte[] bytearray1 = new byte[4096];  
           int size1=0;  
           InputStream ins;  
           ins = rs.getBinaryStream("wallPic");  
           response.reset(); 
           
           
           response.setContentType("image/jpeg");  
           response.addHeader("Content-Disposition","filename=logo.jpg");  
           
           while((size1=ins.read(bytearray1))!= -1 )  
             {  
               response.getOutputStream().write(bytearray1,0,size1);  
             }  
           response.flushBuffer(); 
           response.getOutputStream().flush();
           response.getOutputStream().close();
           ins.close();  
           rs.close();  
        }
  
	ps.close();
 	conn.close();  
  }
 catch (Exception e)
 {
         out.println(e.getMessage());
 }
%>
  </body>
    </html>