<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>PHOTOS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="friends.css" type="text/css">
    <link rel="stylesheet" href="header.css" type="text/css">
</head>  
<body>

<%!
	String fname,lname,fdEmail,email,time;
java.util.Date date;
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

	
	
	<div class="container=fluid">
		<h1 style="text-align:center;background-color:black;padding:10px;color:#00bcd4">PHOTOS</h1>
	</div>
	
	<hr>
	
	<div class="container-fluid text-center" >
		<div class="row" >
			
						<%		
							
						try
						{
							String currentUser=(String)session.getAttribute("email");
							
							
							Class.forName("com.mysql.jdbc.Driver");
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							
							PreparedStatement ps=conn.prepareStatement("select time,pic from timeline where email='"+email+"' order by time asc");
							
							ResultSet rs=ps.executeQuery();
							
							while(rs.next())
							{
								Timestamp timestamp = rs.getTimestamp(1);
								String picture=rs.getString(2);
							 	if (timestamp != null)
							 	{
								    date = new java.util.Date(timestamp.getTime());
								 	time=date.toString();
							 	}
								 	
							if(!picture.equals(""))
							{

								out.print("<div class='col-sm-2'>");
									out.print("<div class='thumbnail' style='height:185px;width:185px;'>");
										out.println("<img  src='postRetrieve.jsp?email="+email+"&time="+time+"' alt='friend' style='height:100%;'>");
												
										out.print("</div></div>");			
							}			
					
							}	
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						%>
						
						
			
		

		
			
		</div>
	</div>
	
	
	
	
</body>
</html>