<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>FRIENDS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
    
</head>  
<body>

<%!
	String fname,lname,fdEmail,email,a,currentUser,status,time;
	java.util.Date date;
	int like;
%>
<%
	if(session!=null)
		{  
        	String email=(String)session.getAttribute("email");  
        	session.setAttribute("email",email);
        	currentUser=email;
        	
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
    						
    						String msg=request.getParameter("msg");
    						String fdEmail=request.getParameter("fdEmail");
    						String nameOfTable=request.getParameter("nameOfTable");
    						
    			        	String email=(String)session.getAttribute("email");  
    			        	session.setAttribute("email",email);
    			        	
    			        	String fdEm=fdEmail.replaceAll("[^a-zA-Z0-9]", "");
    			        	String em=email.replaceAll("[^a-zA-Z0-9]", "");
    		    				
    			        	
							Class.forName("com.mysql.jdbc.Driver");
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							
							
							PreparedStatement ps=conn.prepareStatement("insert into "+nameOfTable+"(message,email)values(?,?)");
							ps.setString(1,msg);
							ps.setString(2,email);
							
							ps.executeUpdate();
							
							   RequestDispatcher rd=request.getRequestDispatcher("chatting.jsp");
					           rd.forward(request, response);
						
																
						}
						
						catch(Exception e)
						{
							e.printStackTrace();
						}
						 %>
			</div>
						 
						
									
									
</div>
</div>
									
							
</div>	
</body>
</html>