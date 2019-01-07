<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>HOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
    <link rel="stylesheet" href="header.css" type="text/css">
</head>
<body>

<%
	String email=(String)session.getAttribute("email");
	session.setAttribute("email",email);
	
%>


	<div class="container=fluid">
		<h1 style="text-align:center;background-color:black;padding:10px;color:gray">TIMELINE</h1>
	</div>
	
	<hr>	
	
	<div  class="container-fluid">
		
		<div class="row content ">
			
			<div class="col-sm-9 well">
						
						
						
						<div class="panel panel-default">
							
							<div class="panel-heading">
							
							
								<span><img src="1.jpg"  class="profile-pic" height="80" width="80">
									<div class="profile-name"><h3 >Bruno Mars</h3></span></div>
								
								<div class="post-status"><h5> My new car.#Loving it.#Awsome driving #Great bark</h5></div>
							</div>
							
							<div class="panel-body">
							
								<img src="audi.jpg" height="100%" width="100%" alt="posts">
								
							</div>
						
						</div>
						
						<div class="panel panel-default">
							
							<div class="panel-heading">
							
							
								<span><img src="2.jpg"  class="profile-pic" height="80" width="80">
									<div class="profile-name"><h3>Dan Tyd</h3></span></div>
								
								<div class="post-status"><h5>Sun set with Loved ones</h5></div>
							</div>
							
							<div class="panel-body">
							
								<img src="sunset.jpg" height="100%" width="100%" alt="posts">
								
							</div>
						
						</div>
						
						<div class="panel panel-default">
							
							<div class="panel-heading">
							
							
								<span><img src="pp14.jpg"  class="profile-pic" height="80" width="80">
									<div class="profile-name"><h3>Utkarsh Patil</h3></span></div>
								
								<div class="post-status"><h5>Birthday Cake</h5></div>
							</div>
							
							<div class="panel-body">
							
								<img src="cake.jpg" height="100%" width="100%" alt="posts">
								
							</div>
						
						</div>
						
						

			</div>	
				
			<!-- RIGHT SIDE BAR -->
			
			
			<div class="col-sm-3 side-bar well">
				
				<div class="panel panel-default">
					<div class="panel-heading"><h6>Advertisements</h6></div>
					<div class="thumbnail">
						<a href="https://www.nike.com"><img src="ad4.jpg" alt="img"></a>
						<h6 style="padding:3px"><strong>NIKE</strong> Just do it</h6>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="thumbnail">
						<a href="http://www.impetusconsultrainers.com"><img src="ad6.png" alt="img">a>
						<h6 style="padding:3px"><strong>IMPETUS Conultrainers</strong>100% Job Garrantee</h6></
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="thumbnail">
						<img src="ad2.png" alt="img">
						<h6 style="padding:3px"><strong>Great Lash .</strong>No wonder one is sold every Second </h6>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="thumbnail">
						<img src="ad5.jpg" alt="img">
						<h6 style="padding:3px"><strong>Samsung z19</strong> Realinsing on 12 April</h6>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="thumbnail">
						<img src="ad3.jpg" alt="img">
						<h6 style="padding:3px">No 1 deo In India <strong>RIVOX</strong></h6> </h6>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="thumbnail">
						<img src="ad1.jpg" alt="img">
						<h6 style="padding:3px"><strong>big.biffy.bliss</strong></h6>
					</div>
				</div>
				
				
				
				
					
				
				
			</div>
		
			
			

			</div>
	</div>
	
	
		
</body>
</html>