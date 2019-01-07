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
String fname;
String lname,currentUser,currentFriend,yesorno="no";
String connection;
String em;
String matchingFdEmail,k=""; 
String email;
String fdEmail;

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



	
	<div class="container-fluid text-center" >
		<div class="row" >
			
						<%		
							
						try
						{
							yesorno="no";
							String currentUser=(String)session.getAttribute("email");
							
							em=email.replaceAll("[^a-zA-Z0-9]", "");
							
							
							Class.forName("com.mysql.jdbc.Driver");
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							
							
							PreparedStatement ps=conn.prepareStatement("select fname,lname,email from personal where email!='"+currentUser+"' and email=ANY (select frendEmail from sentRequest"+em+")");

							
							ResultSet rs=ps.executeQuery();
							
							if(rs.next())
							{
								yesorno="yes";
								rs.previous();
							
								
								
							}
							
							while(rs.next())
							{
							
								 fname=rs.getString(1);
								 lname=rs.getString(2);
								 fdEmail=rs.getString(3);
								
							out.println("<a href='fdProfile.jsp?fdEmail="+fdEmail+"' target='_top'>");

							out.print("<div class='col-sm-3'>");
							out.print("<div class='thumbnail' style='height:240px'>");
								out.println("<img  src='fdRetrieve.jsp?fdEmail="+fdEmail+"'style='height:150px'  alt='friend' >");
										out.println("<h4>");
											out.print(fname+' '+lname);
											out.print("</h4>");
						
													out.println	("<form  action='clearRequest.jsp?fdEmail="+fdEmail+"' method='post'>"
															+"<button class='btn btn-group btn-info'>"
															+"<span  class='glyphicon glyphicon-plus '></span>"+" Clear Request"
															+"</button>"
													+"</form>");
							
											

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
	<%
		if(yesorno.equals("no"))
		{
			out.println("<div class='container' >");
			out.println("<div class='row well'>");
			out.println("<h3 style='text-align:center;'>"+ "You don't have any Unaccepted sent Requests"+"</h3>");	
			out.println("</div>");
		out.println("</div>");
		}
	%>
	
	
</body>
</html>