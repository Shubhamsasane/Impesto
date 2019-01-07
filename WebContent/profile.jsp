<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
  <title>PROFILE</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
  <link rel="stylesheet" href="head.css" type="text/css">
  
   <!--ICON-->
   


</head>
<body style="padding-top:60px;" >	

<%!
		String fname;
		String lname,currentUser;
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
		
		try
		{
			 currentUser=(String)session.getAttribute("email");;
			
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
			PreparedStatement ps=conn.prepareStatement("select fname,lname from personal where email=?");
			ps.setString(1,currentUser);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				 fname=rs.getString(1);
				 lname=rs.getString(2);
				
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
				
			<div class="col-sm-4 col-xs-4 text-center">
				
					<div>
						 <img src="retrieve.jsp" style="border:5px solid black;border-radius:135px;margin-top:34px;margin-left:20px" width="260dp" height="260dp"alt="profile picture">
					</div>
					<div>
						<form style="margin-left:205px;margin-top:-55px;" action="imageUpload.jsp?temp=dp" method="post">
							<button class="btn btn-group btn-info" ><span class="glyphicon glyphicon-edit">  </span></button>
						</form>
					</div>
					<div style="margin-top:45px;margin-bottom:35px;margin-left:20px;">
						<h3><strong><%out.println(" "+fname+" "+lname); %></strong></h3>
					</div>
					
			</div>
			<div class="col-sm-8 col-xs-8 hidden-sm hidden-xs ">		
				<div>
					<%  out.println("<img src='wallRetrieve.jsp?email="+currentUser+"' height='376dip' width='765dip'>");%>
				</div>
				<div>
						<form style="margin-top:-75px;margin-left:660px;" action="imageUpload.jsp?temp=wallpic" method="post">
							<button class="btn btn-group btn-info" ><span class="glyphicon glyphicon-edit">  </span> Edit</button>
						</form>
				</div>
				
			</div>
		</div>
	
		<div class="row hidden-xs">		
				<div class="navbar navbar-inverse" style="border-radius:0px;margin:0px;">
					<ul class="nav navbar-nav ">
						<li><a href="timeline.jsp" target="iframeProfile">TimeLine</a></li>
						<li><a href="information.jsp" target="iframeProfile">Info</a></li>
						<li><a href="photos.jsp" target="iframeProfile">Media</a></li>
						<li><a href="people.jsp" target="_top">Friends</a></li>
					</ul>
		
				</div>
		</div>
	</div>
	<br><br><br>
	
	<div class="container">
		<div class="row">
			<div style="fixed" class="embed-responsive embed-responsive-16by9" >
				<iframe id="ifm" class="embed-responsive-item"  name="iframeProfile" src="timeline.jsp" width="100%" height="100%" scrolling="yes"  ></iframe>
			</div>
		</div>
	</div>
	

	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>