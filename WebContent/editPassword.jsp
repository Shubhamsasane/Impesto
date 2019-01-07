<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>

 <meta charset="utf-8">
 <link rel="stylesheet" type="text/css" href="header.css" >
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="form.css">
 

  
</head>
<body>
	
<div class="container-fluid"><br>	
	
<div class="container well" style="width:360px;height:600px;margin-top:10px;box-shadow: 14px 13px 5px #888888;">
		<div class="panel panel-default">
			
				<div class="panel-body" >
					<fieldset style="padding:10px;border:1px solid #0EBFE9;border-radius:10px; " >
						
						<form action="updateInfo"  method="post">
								
								<div class="form-group" style="padding:7px;">
									Enter Current Password <br><br><input class="form-control login_page" type="password" name="oldPassword" >
								</div>
								
								<div class="form-group" style="padding:7px;"">
									Enter new Password <br><br><input type="password" name="newPassword" class="form-control login_page" >
								</div><br>
									<div class="form-group" style="padding:7px;"">
									Re-Enter new Password <br><br><input type="password" name="reNewPassword" class="form-control login_page">
								</div><br>
								<input type='hidden' value='changePassword' name='id'>
							
									<input type="submit" style="width:150px;margin-bottom:20px;margin-left:60px;background-color:#00cccc;border-color:#00cccc" class="btn btn-success" value="Edit">
        			</form>
        			</fieldset>
        		
        	</div>
     	</div>
	</div>




		
</div>
</body>
</html>