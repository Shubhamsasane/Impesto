<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOG IN</title>

 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="header.css" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="form.css">
 
 <!--ICON-->

</head>
<body>

<div class="container well" style="width:360px;height:100%;margin-top:10px;box-shadow: 14px 13px 5px #000000;">
		<div class="panel panel-default">
			<div class="panel-heading" style="background-color:#00cccc;text-align:center;">
					
						<a href="home.jsp" style="font-size:40px;color:white;"><strong>Impesto</strong></a>
			</div>
				<div class="panel-body" >
					<fieldset style="padding:10px;border:1px solid #0EBFE9;border-radius:10px; " >
						
						<form action="verify"  method="post">
								
								<div class="form-group" style="padding:7px;">
									Email <br><br><input class="form-control login_page" type="text" name="email" placeholder="Email">
								</div>
								
								<div class="form-group" style="padding:7px;"">
									Password <br><br><input type="password" name="password" class="form-control login_page" placeholder="Password">
								</div><br>
									<input type="submit" style="width:150px;margin-bottom:20px;margin-left:60px;background-color:#00cccc;border-color:#00cccc" class="btn btn-success" value="Log In">
        								</form>
        			<input type="button" onclick="document.location.href = 'signup.jsp';" style="width:150px;margin-bottom:20px;margin-left:60px;background-color:#00cccc;border-color:#00cccc" class="btn btn-success" value="Sign Up">   							
        		
        			</fieldset>
        		
        	</div>
     	</div>
	</div>




		

</body>
</html>