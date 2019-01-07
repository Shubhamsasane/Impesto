
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
 <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>

   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head><title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
<link rel="stylesheet" href="head.css" type="text/css">

<!--ICON-->
</head>
<style>

.arrow_box1 {
	
}
.arrow_box1:after, .arrow_box1:before {
	right: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box1:after {
	
	border-right-color: orange;
	border-width: 30px;
	margin-top: -30px;
}
.arrow_box1:before {
	
	border-right-color: orange;
	border-width: 36px;
	margin-top: -36px;
}

.arrow_box {
	
	
}
.arrow_box:after, .arrow_box:before {
	left: 100%;
	top: 50%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box:after {
	
	border-width: 30px;
	margin-top: -30px;
}
.arrow_box:before {
	
	border-left-color:#00cccc;
	border-width: 36px;
	margin-top: -36px;
	}

</style>
<script>

	function scroll()
	{
		window.scrollTo(0,800); 
	 }
	 
</script>

<body style="padding-top:90px;" onload="scroll()">
<%!
		String email,currentUser,temp,fdEmail,fname,lname,chatEmail,time,nameOfTable=" ";
		Connection conn;
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


			email=(String)session.getAttribute("email");  
			String temp=request.getParameter("temp");
        	int tmp=0;
        	nameOfTable=" ";
        	String fdEmail=request.getParameter("fdEmail");
        	
        		
        	String fdEm=fdEmail.replaceAll("[^a-zA-Z0-9]", "");
        	String em=email.replaceAll("[^a-zA-Z0-9]", "");
        	PreparedStatement ps;
        	
        	
			
        	currentUser=(String)session.getAttribute("email");;
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
			ps=conn.prepareStatement("select fname,lname from personal where email=?");
			ps.setString(1,fdEmail);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				 fname=rs.getString(1);
				 lname=rs.getString(2);
				
	 		}
			
			
			try
			{
				ps=conn.prepareStatement("select 1 from "+em+"Chats"+fdEm);
    			ResultSet rs2=ps.executeQuery();
    			
    			nameOfTable=em+"Chats"+fdEm; 
    				tmp=1;
    				
    			if(rs2.next())
    			{
    				tmp=1;
    				
    			}
			}
			catch(Exception e){}
			
			try
			
			{
			  
				ps=conn.prepareStatement("select 1 from "+fdEm+"Chats"+em);
    			ResultSet rs3=ps.executeQuery();
    			
    			
    			nameOfTable=fdEm+"Chats"+em; 
    				tmp=1;
    				
    			if(rs3.next())
    			{
    				tmp=1;
    			}

			 
			} 
			catch(Exception e){}
			
			if(tmp==0) 
			{
			  
			
				
	        	String sql="create table "+em+"Chats"+fdEm+" (message varchar(100),email varchar(30),time datetime default current_timestamp)";
	        	ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				
				nameOfTable=em+"Chats"+fdEm; 
			
			}
			

			out.println("<a href='fdProfile.jsp?fdEmail="+fdEmail+"'><div  style='position:fixed;top:0;width:100%;'>");
			
			out.println("<h1 style='text-align:center;background-color:#5bc0de;padding:10px;color:gray'>");
	
			out.println("<div class='menu' style='padding-left:40px;color:white'><img class='header' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+fdEmail+"'>"+fname+" "+lname);
			
			out.println	("<form class='col-sm-1' style='padding:10px;float:right;' action='chatTrash.jsp?nameOfTable="+nameOfTable+"' method='post'>"
					+"<button class='btn btn-group btn-default'>"
					+"<span  class='glyphicon glyphicon-trash '></span>"
					+"</button>"
			+"</form>");
			
			out.println("</h1></div></div></a>");
			
        	try
    		{
        		
    			ps=conn.prepareStatement("select message,email,time from "+nameOfTable);
    		
    			ResultSet rs4=ps.executeQuery();
    			
    			while(rs4.next())
    			{
    				 fname=rs4.getString(1);
    				 chatEmail=rs4.getString(2);
    				
    				 Timestamp timestamp = rs4.getTimestamp(3);
    				 if (timestamp != null)
					 {
					    date = new java.util.Date(timestamp.getTime());
						 time=date.toString();
					 }
					 SimpleDateFormat sdf1 = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy");
						java.util.Date date = sdf1.parse(time);
						java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());  
						
						SimpleDateFormat print = new SimpleDateFormat("d MMM yyyy");
						String day=print.format(date);
					
						SimpleDateFormat print1 = new SimpleDateFormat("HH:mm");
						String time=print1.format(date);
    				
						java.util.Date todayDate = new Date();
						java.sql.Date sqlStartDate1 = new java.sql.Date(todayDate.getTime());  
						SimpleDateFormat print2 = new SimpleDateFormat("d MMM yyyy");
						
						String isDayToday=print.format(todayDate);
						
						if(isDayToday.equals(day))
						{
							day="Today";
						}
    				 
    			 
    				
    			out.println("<br>");
 
    			
 // OWN CHATS   
 
 if(chatEmail.equals(currentUser))
 
 		{
    			out.println("<div class='row'><div class='col-xs-3 col-sm-4 col-md-7 col-lg-7'></div><div class='col-xs-8 col-sm-7 col-md-4 col-lg-4 arrow_box' style='border:4px solid #00cccc;border-radius:20px;'> <br>");
    			
    			out.println(fname+"<hr> <small class='pull-left text-muted'>"+day+"</small><small class='pull-right text-muted'><span class='glyphicon glyphicon-time'> </span> &nbsp"+time+"</small></div><div class='col-xs-1'></div></div><br>");
		 }
 
 //FRIENDS CHATS
 
 else
	 
 		{			
				 out.println("<div class='row'><div class='col-lg-1 col-md-1 col-xs-1 col-sm-1'><span><img style='border-radius:90px;' class='pull-right' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+fdEmail+"'></span>");
		

    			out.println("</div><div class='col-xs-8 col-sm-7 col-md-4 col-lg-4 arrow_box1' style='border:4px solid orange;border-radius:20px;'> <br>");
    			
    			out.println(fname+"<hr> <small class='pull-left text-muted'>"+day+"</small><small class='pull-right text-muted'><span class='glyphicon glyphicon-time'> </span> &nbsp"+time+"</small></div><div class='col-xs-3 col-sm-4 col-md-7 col-lg-7'></div></div><br>");
    		
		 }  			
    			
  }
    			
    			out.println("<hr><br><br><div class='row'><div class='col-sm-5'></div><div class='col-sm-7'>");
    			
    			out.println("<form  style='position:fixed;bottom:0;padding:30px' action='chatInput.jsp?fdEmail="+fdEmail+"&nameOfTable="+nameOfTable+"' method='post'>");
    			

    			out.println("<input style='width:550px;border:1px solid black;margin-right:20px;border-radius:10px;height:33px' type='text' name='msg'>"
    			+"<button  class='btn btn-group btn-info'>"
				+"<span  class='glyphicon glyphicon-send' ></span>"+" Send "
    			+"</button>"
		+"</form> ");

    			out.println("</form><br></div></div>");
    		
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}

        
			
        	
        	
			 
			
			%>	
</body>
</html>