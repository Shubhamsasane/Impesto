<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <title>FRIEND PROFILE</title>
  <meta charset="utf-8">
  <meta name="viewport" content=fr"width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
    <link rel="stylesheet" href="head.css" type="text/css">
  

 <!--ICON-->

</head>
<body style="padding-top:60px;">	
<%!
		String fname;
		String lname,currentUser,currentFriend;
		String connection;
		String em;
		String matchingFdEmail,k=""; 
	String email;
	String fdEmail;
%>

<%
	
	email=(String)session.getAttribute("email");
	session.setAttribute("email",email);
	
	if((request.getParameter("fdEmail")).equals(null))
	{
			fdEmail=(String)session.getAttribute("fdEmail");
	}
	else
	{
		fdEmail=request.getParameter("fdEmail");
		
	}
	session.setAttribute("fdEmail",fdEmail);
%>
<%
		
		try
		{
			currentFriend=request.getParameter("fdEmail");
			currentUser=(String)session.getAttribute("email");

		
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
				connection="not sent";
			PreparedStatement ps=conn.prepareStatement("select fname,lname from personal where email=?");
			ps.setString(1,currentFriend);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				 fname=rs.getString(1);
				 lname=rs.getString(2);
				
	 		}
			 
//Conversion of Email to plain Text			
			
			em=currentUser.replaceAll("[^a-zA-Z0-9]", "");

// SentRequestUser Table 
			String sql="select frendEmail from pendingRequest"+em;
			ps=conn.prepareStatement(sql);
						
			ResultSet rs0=ps.executeQuery();
						
			while(rs0.next())
			{
				k=rs0.getString(1);
			    System.out.println("value is 1111111111111*"+k+"s1111111111111111");
				 if((k).equals(currentFriend)&& (!k.equals(null)))
					 {
						 connection="respond";
						 System.out.println(k);
								
							 
					 }
			}

// SentRequestUser Table 
			 sql="select frendEmail from sentRequest"+em;
			ps=conn.prepareStatement(sql);
			
			ResultSet rs1=ps.executeQuery();
			
			while(rs1.next())
			{
				k=rs1.getString(1);
				 if((k).equals(currentFriend)&& (!k.equals(null)))
				 {
					 connection="sent";
					 System.out.println(k);
					
				 
				 }
	 		}
// Friend Table
			sql="select frendEmail from friend"+em+" where frendEmail=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,currentFriend);
			
			ResultSet rs2=ps.executeQuery();
			
			while(rs2.next())
			{
				k=rs2.getString(1);
				 if((k).equals(currentFriend)&& (!k.equals(null)))
				 {
					 connection="friend";
					 System.out.println(k);
					
				 
				 }
	 		}			
			
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
			
		
	%>
	
	
	

<%@include file="heading.jsp"  %>
	
				
	<div class="container" style="height:379px;background-color:#f1f1f1;">
		<div class="row">	
			<div class="col-sm-4 text-center">
		
					<div>
						<% out.println("<img src='fdRetrieve.jsp?fdEmail="+currentFriend+"' style='border:5px solid black;border-radius:170px;margin-top:34px;' height='260px' width='260px' alt='profile picture'>");%>
						</div>
					
					<div style="margin-top:25px;">
						<h3><strong><% out.println(fname+" " +lname); %></strong></h3>
					</div>
					
			</div>
			<div class="col-sm-8">		
				<div>
					<% out.println("<img src='wallRetrieve.jsp?email="+currentFriend+"' height='376px' width='765px'>"); %>
				</div>
				
				
			</div>
		</div>
	
		<div class="row">		
				<div class="navbar navbar-inverse" style="border-radius:0px;margin:0px;">
					<ul class="nav navbar-nav ">
						<li><a href="fdTimeline.jsp" target="iframeProfile">TimeLine</a></li>
						<li><a href="fdInformation.jsp" target="iframeProfile">Info</a></li>
						<li><a href="fdPhotos.jsp" target="iframeProfile">Media</a></li>
						<li><a href="fdFriends.jsp" target="iframeProfile">Friends</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right " style="margin-top:8px;margin-right:70px">
					<li style="margin-right:10px;">
					<%
						 out.println	("<form  style='padding-right:20px;' action='chatting.jsp?fdEmail="+fdEmail+"' method='post'>"
										+"<button class='btn btn-group btn-info'>"
										+"<span  class='glyphicon glyphicon-comment '></span>"+" Message"
										+"</button>"
						
										+"</form>");
					 %>
					</li>
							
							<li>
<%

session.setAttribute("fdEmail",fdEmail);

		if(connection.equals("not sent"))
		{
					out.println	("<form  action='requestFriend.jsp?fdEmail="+fdEmail+"' method='post'>"
										+"<button class='btn btn-group btn-info'>"
										+"<span  class='glyphicon glyphicon-plus '></span>"+" Add Friend"
										+"</button>"
								+"</form>");
		}
		else if(connection.equals("sent"))
		{
		
%>
			</li>
			<li style="margin-right:30px;">
				<% out.println("<form action='clearRequest.jsp?fdEmail="+fdEmail+"' method='post'>"); %>
				<button class='btn btn-group btn-info'>
					<span  class='glyphicon glyphicon-plus1'></span> Clear Request
				</button>
			</form>
			</li>
			<li>
			
			<h5 style="color:white"><span  class='glyphicon glyphicon-check ' ></span> Request Sent
				</h5>
			</li>
			
	<% 
		}
		else if(connection.equals("friend"))
		{
%>			
			<li style="margin-right:30px;">		
			<% out.println("<form action='removeFriend.jsp?fdEmail="+fdEmail+"' method='post'>");%>
				<button class='btn btn-group btn-info'>
					<span  class='glyphicon glyphicon-minus'></span> Unfriend
				</button>
			</form>
			</li>
			<li>
				<h5 style="color:white">
					<span  class='glyphicon glyphicon-check ' ></span> 
						Friends
				</h5>
			</li>
			
<%	
		}
		else if(connection.equals("respond"))
		{
%>
			<li style="margin-right:30px;">		
			<% out.println("<form action='acceptRequest.jsp?fdEmail="+fdEmail+"' method='post'>");%>
				<button class='btn btn-group btn-info'>
					<span  class='glyphicon glyphicon-plus '></span> Accept
				</button>
			</form>	
			</li>
			<li>
			<% out.println("<form action='rejectRequest.jsp?fdEmail="+fdEmail+"' method='post'>");%>
				<button class='btn btn-group btn-info'>
					<span  class='glyphicon glyphicon-minus '></span> Reject
				</button>
			</form>
			</li>
			
			
			
<%
		
		}
%>

						
							
							
					</ul>		
				</div>
		</div>
	</div>
	<br><br><br>
	<div class="container">
		<div class="embed-responsive embed-responsive-16by9" >
			<iframe class="embed-responsive-item"  name="iframeProfile" src="fdInformation.jsp" width="100%" height="100%" scrolling="yes"></iframe>
		</div>
	</div>
	
</body>
</html>