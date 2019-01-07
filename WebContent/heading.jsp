<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" href="favicon.ico" />
<style>
html {
    overflow-y: scroll;
     
}
.nav.navbar-nav li a.current {
  color:grey;
  }
.nav.navbar-nav li a {
  color:white;
  }
 
.nav.navbar-nav li a:hover{
   color:grey;
 }

.nav.navbar-nav li a:active{
   
   color:grey;
 }
 .navbar.navbar-inverse
{
	background-color:black;
}

</style>
</head>
<body>
<%!
		String currentUser1,fname1,lname1;
		String em1;
		String email1;
	
		
%>

<%
	email1=(String)session.getAttribute("email");
%>

<%!
String sql;
int count;

%>

<%
 try
 {
	count=0;
	currentUser1=(String)session.getAttribute("email");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
	
		 
//Conversion of Email to plain Text			
	
	em1=currentUser1.replaceAll("[^a-zA-Z0-9]", "");


	sql="select frendEmail from pendingRequest"+em1;
			PreparedStatement ps=conn.prepareStatement(sql);
			ResultSet rs1=ps.executeQuery();
			 
			
			while(rs1.next())
			{
				count++;
			}
			
			
			ps=conn.prepareStatement("select fname,lname from personal where email=?");
			ps.setString(1,currentUser1);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				 fname1=rs.getString(1);
				 lname1=rs.getString(2);
				
	 		}
 }
catch(Exception e)
{
		e.printStackTrace();
}

%>			

<nav class="navbar navbar-inverse" style="padding:5px;margin:0px;border-radius:0;position:fixed;top:0;width:100%;z-index:100;">
				<div class="container-fluid">
					<div class="navbar-header hidden-sm" >
					 	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
     				   		<span class="icon-bar"></span>
        					<span class="icon-bar"></span>
        					<span class="icon-bar"></span>                        
   					   </button>
					
					 <a href="home.jsp" ><img src="IMPESTO LOGO.png" height=35px;" width="140px" style="padding-top:8px;margin-left:20px"></a></div>
					  <div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="menu hmenu" style="padding-left:40px"><a style="padding:0px;" href='profile.jsp'><img class="header" height="50px" width="50px" src="retrieve.jsp"></a></li>
							
							<li class="menu hmenu"><a style="padding:0px;" href='profile.jsp'><% out.println("<h4 style='color:#00bcd4;padding-top:4px;padding-right:5px'>"+fname1+" "+lname1+"</h4>"); %></a></li>
						
							
							<li  style='font-size:16px;' class="menu"><a href="home.jsp"><span class="glyphicon glyphicon-home"></span> Home</a></li>
							<li  style='font-size:16px;' class="menu"><a href="profile.jsp"><span class="glyphicon glyphicon-tasks"></span> Profile</a></li>
						
							
						</ul>
						
						<ul class="nav navbar-nav navbar-center top-nav">
						
<% 				
					if(count>0)
						{
								
								out.println("<li><a href='notification.jsp'><span style='font-size:19px;z-index:100;color:#00bcd4;padding-left:5px;' class='glyphicon glyphicon-bell' >"+count+"</span></a></li>");
								
						}
					else
					{
						out.println("<li class='menu'><a href='notification.jsp'><span style='font-size:19px;padding-left:5px;' class='glyphicon glyphicon-bell'></span> </a></li>");
					}

%>				
						
							<li class="menu"><a href="chatHeads.jsp"><span style='font-size:19px;padding-left:10px;' class="glyphicon glyphicon-comment"></span> </a></li>
							<li class="menu"><a href="settings.jsp"><span style='font-size:19px;padding-left:10px;' class="glyphicon glyphicon-cog"></span> </a></li>
							<li class="menu"><a href="people.jsp"><span style='font-size:19px;padding-left:10px' class="fa fa-users"></span> </a></li>
						
						
							
							<!-- <li style="padding-left:50px"><div class="input-group postFeed" >
									
									<input type="text" name="status" class="form-control" style="height:28px;" placeholder="Search People">
										<span class="input-group-btn">
											<button class="btn btn-group" type="button">
												<span class="glyphicon glyphicon-search"></span>
										
								</div></span></li> -->
							
							</ul>
							<ul class="nav navbar-nav navbar-right">
							<li>
								<form  class="logout" action="logout" method="post"><button style="background-color:#00bcd4;width:auto" class="btn btn-group btn-info">
								<span  class="glyphicon glyphicon-log-out "></span>  <span class="hidden-sm"> Log Out</span></button></form>
							</li>
							</ul>
						
					
				</div>
	</nav>
	
</body>
</html>