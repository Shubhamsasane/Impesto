<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>FRIENDS</title>
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
	String fname,lname,fdEmail,email,fdEm;

%>
	
<%
	if(session!=null)
		{  

		fdEmail=(String)session.getAttribute("fdEmail");
		email=(String)session.getAttribute("email");
		session.setAttribute("fdEmail",fdEmail);
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
		<h1 style="text-align:center;background-color:black;padding:10px;color:#00bcd4">FRIENDS</h1>
	</div>
	
	<hr>
	
	<div class="container-fluid text-center" >
		<div class="row" >
			
<%		
							
						try
						{
							String currentFriend=(String)session.getAttribute("fdEmail");
							String currentUser=email;
							fdEm=fdEmail.replaceAll("[^a-zA-Z0-9]", "");
							Class.forName("com.mysql.jdbc.Driver");
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							
							
							PreparedStatement ps=conn.prepareStatement("select fname,lname,email from personal where email!=? AND email!=?"+" and email=ANY (select frendEmail from friend"+fdEm+")");
							ps.setString(1,currentFriend);
							ps.setString(2,currentUser);
							
							ResultSet rs=ps.executeQuery();
							
							while(rs.next())
							{
								 fname=rs.getString(1);
								 lname=rs.getString(2);
								 fdEmail=rs.getString(3);
								 System.out.println(fdEmail);
							
							 
							//ps=conn.prepareStatement("select displayPic from proPic where email=?");
							//ps.setString(1,currentUser);
							


							out.println("<a href='fdProfile.jsp?fdEmail="+fdEmail+"' target='_top'>");

								out.print("<div class='col-sm-2'>");
									out.print("<div class='thumbnail'>");
										out.println("<img  src='fdRetrieve.jsp?fdEmail="+fdEmail+"' alt='friend' >");
												out.println("<h4>");
													out.print(fname+' '+lname);
													out.print("</h4>");

							out.print("</div></div></a>");		

					
						
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