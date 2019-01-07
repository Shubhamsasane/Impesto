<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>FRIENDS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
    
</head>  
<body>

<%!
	
	String fname,lname,fdEmail,email,a,em,currentUser,status,getEmail,time,pic,currentFriend;
	String comment,commentEmail,fname2,lname2,timeForPost,fdEm;
	java.util.Date date;
	int postLike,postCount=0,id,cmtId=0,countComments=1,t=0;
	int commentLike;
%>
<%
	if(session!=null)
		{  
        	String email=(String)session.getAttribute("email");  
        	session.setAttribute("email",email);
        	currentUser=email;
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
		<h1 style="text-align:center;background-color:black;padding:10px;color:#00bcd4">TIMELINE</h1>
	</div>
	<hr>	
	
	<div  class="container">
	 	<div class="row content ">
	 		<div class="col-sm-9 well">
	
<%
	
try{	
	currentFriend=(String)session.getAttribute("fdEmail"); 
	currentUser=(String)session.getAttribute("email");  						
	em=currentUser.replaceAll("[^a-zA-Z0-9]", "");
	fdEm=currentFriend.replaceAll("[^a-zA-Z0-9]", "");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	
	
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
	
	
	PreparedStatement ps=conn.prepareStatement("select status,email,pic,time,id from timeline where email='"+currentFriend+"' order by time desc");
	
	ResultSet rs=ps.executeQuery();
	
	while(rs.next())
	{
		 status=rs.getString(1);
		 getEmail=rs.getString(2);
		 pic=rs.getString(3);
		 Timestamp timestamp = rs.getTimestamp(4);
		 int postId=rs.getInt(5);
		 
		 
		 
		 if (timestamp != null)
		 {
		    date = new java.util.Date(timestamp.getTime());
			 time=date.toString();
			 timeForPost=date.toString();
		 }
		 SimpleDateFormat sdf1 = new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy");
			java.util.Date date = sdf1.parse(time);
			java.sql.Date sqlStartDate = new java.sql.Date(date.getTime());  
			
			SimpleDateFormat print = new SimpleDateFormat("d MMM yyyy HH:mm");
			String time1=print.format(date);
		
			SimpleDateFormat print1 = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			String time2=print1.format(date);
			
			SimpleDateFormat formatDay = new SimpleDateFormat("d MMM yyyy");
			String dayForShow=formatDay.format(date);
		
			SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm");
			String timeForShow=formatTime.format(date);
		
			java.util.Date todayDate = new Date();
			java.sql.Date sqlStartDate1 = new java.sql.Date(todayDate.getTime());  
			
			SimpleDateFormat formatToday = new SimpleDateFormat("d MMM yyyy");
			
			String isDayToday=formatDay.format(todayDate);
			
			if(isDayToday.equals(dayForShow))
			{
				dayForShow="Today";
			}
%>
		 
			<div class="panel panel-default">
							
<%

		ps=conn.prepareStatement("select fname,lname from personal where email='"+getEmail+"'");

		ResultSet rs1=ps.executeQuery();

		if(rs1.next())
		{
 			fname=rs1.getString(1);
 			lname=rs1.getString(2);
			
 			//and time='"+time+"'
 			
 			out.println("<div class='panel-heading'>");
			out.println("<a href='fdProfile.jsp?fdEmail="+getEmail+"' target='_top'>");
			out.println("<span><img style='border-radius:8px' src='fdRetrieve.jsp?fdEmail="+getEmail+"'class='profile-pic' height='80' width='80'></a>");
			out.println("<div style='float:left;padding-left:12px;'>");



		out.println("<a href='fdProfile.jsp?fdEmail="+getEmail+"'><h3 class='text-primary'>"
			+fname+" "+lname+"</h3></a>");

		out.println("</span><h6 class='text-muted'>"
			+"<span class='glyphicon glyphicon-time'></span>"
			+timeForShow+"&nbsp&nbsp||&nbsp"+dayForShow+"</h6></div>");

			
				out.println("<div class='post-status'><h5>"+status+"</h5></div>");
				out.println("</div>");
			
				out.println("<div class='panel-body'>");
				
/////////////////////////GETTING NO OF POST LIKES			
			if(!pic.equals(null))
			{
				ps=conn.prepareStatement("select postlike from timeline where email='"+getEmail+"' and time like'"+time2+"'");
				
				ResultSet rs2=ps.executeQuery();
	
				if(rs2.next())
				{
		 			postLike=rs2.getInt(1);
				}
			
			}	
/////////////////////////GETTING NO OF COMMENTS			
				
					ps=conn.prepareStatement("select count(*) as total from comment where postId='"+postId+"'");
					
					ResultSet rs8=ps.executeQuery();
					
					if(rs8.next())
					{
						 
			 			countComments=rs8.getInt("total");
					}


/////////////////////////Inserting post Image

				out.println("<img src='postRetrieve.jsp?email="+getEmail+"&time="+time+"' height='100%' width='100%' alt='post'>");
				
				
/////////////////////////@@@@@@@@@@@@@@ COMMENT SECTION STARTS									
				
				ps=conn.prepareStatement("select cmnt,email,cmttime,cmtId from comment where postId='"+postId+"'");
				
				ResultSet rs4=ps.executeQuery();
				
				postCount++;
				
				out.println("<hr><div class='media collapse' id='comment"+postCount+"'>");
				
				out.println("<form  action='commentInput.jsp?postId="+postId+"' method='post'>");
    			out.println("<input style='width:500px;border:1px solid black;margin-right:20px;border-radius:10px;height:33px' type='text' name='comment'>"
    			+"<button  class='btn btn-group btn-info'>"
				+"<span  class='glyphicon glyphicon-send' ></span>"+" Send "
    			+"</button>"
				+"</form><hr>");
				while(rs4.next())
				{
		 			comment=rs4.getString(1);
		 			commentEmail=rs4.getString(2);
		 			Timestamp cmttime = rs4.getTimestamp(3);
		 			cmtId=rs4.getInt(4);
		 			
/////////////////////////GETTING NO OF COMMENT LIKES
		 			
		 												if(!pic.equals(null))
		 												{
		 													ps=conn.prepareStatement("select likecomment from comment where cmtId='"+cmtId+"'");
		 													
		 													ResultSet rs2=ps.executeQuery();
		 										
		 													if(rs2.next())
		 													{
		 														commentLike=rs2.getInt(1);
		 													}
		 													
		 												
		 												}	
		 												
					 
					 if (timestamp != null)
					 {
					    date = new java.util.Date(cmttime.getTime());
						 time=date.toString();
					 }
						SimpleDateFormat print5 = new SimpleDateFormat("d MMM yyyy");
						String dayForComment=print5.format(date);
					
						SimpleDateFormat print6 = new SimpleDateFormat("HH:mm");
						String timeForComment=print6.format(date);
    				
						java.util.Date todayDate5 = new Date();
						java.sql.Date sqlStartDate5 = new java.sql.Date(todayDate5.getTime());  
						SimpleDateFormat print2 = new SimpleDateFormat("d MMM yyyy");
						
						String isDayToday5=print5.format(todayDate);
						
						if(isDayToday5.equals(dayForComment))
						{
							dayForComment="Today";
						}
///////////////////// GETTING NAME	STARTS

		 			ps=conn.prepareStatement("select fname,lname from personal where email=?");
					ps.setString(1,commentEmail);
					
					ResultSet rs5=ps.executeQuery();
					
					if(rs5.next())
					{
						 fname2=rs5.getString(1);
						 lname2=rs5.getString(2);
						
			 		}
///////////////////// GETTING NAME ENDS

out.println("<div class='row'>"
				+"<div class='col-sm-1'>"
				+"<span><img style='border-radius:90px;' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+commentEmail+"'></span>");

out.println	("</div>"
			    +"<div class='col-sm-7'>"
			    +"<h4  class='media-heading text-primary'>");
				out.println("<a href='fdProfile.jsp?fdEmail="+commentEmail+"'>"+fname2+" "+lname2+"</a>");
					    
			    out.println("<span style='font-size:12px;padding-left:10px;' class='glyphicon glyphicon-time text-muted'>"+timeForComment+"&nbsp||&nbsp"+dayForComment+"</span></h4>" 
				+"<p>"+comment+"</p></div>");
			    
			    out.println	("<div class='col-sm-2'style='padding-top:25px'><form action='likeComment.jsp?cmtId="+cmtId+"' method='post'>"
						+"<button style='border-radius:1;' class='btn btn-group btn-link'>"
						+"<span  class='glyphicon glyphicon-heart 'style='color:#5bc0de'></span>"+" Love "+commentLike
						+"</button>"
				+"</form> </div>");
				
out.println("</div><hr>");

			  
				}
			/*	out.println	("<form style='padding-top:15px;float:left; width:33.33%;' action='like.jsp?email="+getEmail+"&time="+time+"' method='post'>"
						+"<button style='width:100%;' class='btn btn-group btn-info'>"
						+"<span  class='glyphicon glyphicon-heart 'style='color:#5bc0de'></span>"+" Love "+like
						+"</button>"
				+"</form> ");
				*/
				out.println("</div>");
				
///////////////////////// COMMENT SECTION END
				out.println	("<form style='float:left; width:33.33%;' action='likePost.jsp?email="+getEmail+"&time="+timeForPost+"' method='post'>"
						+"<button style='width:100%;border-radius:1;' class='btn btn-group btn-default'>"
						+"<span  class='glyphicon glyphicon-heart 'style='color:#5bc0de'></span>"+" Love "+postLike
						+"</button>"
				+"</form> ");
				
				
				out.println	("<button class='btn btn-group btn-default' data-toggle='collapse' data-target='#comment"+postCount+"' style='float:left;width:33.33%;border-radius:1;' action='like.jsp?email="+getEmail+"&time="+time+"' method='post'>"
						
						+"<span  class='glyphicon glyphicon-comment 'style='color:#5bc0de'></span>"+" Comment "+countComments
						+"</button>"
				+"</li>");
				
				
				out.println	("<form style='float:left;width:33.33%' action='shareIt.jsp?email="+getEmail+"&temp=share' method='post'>"
						+"<button style='width:100%;border-radius:1;'class='btn btn-group btn-default'>"
						+"<span  class='glyphicon glyphicon-share 'style='color:#5bc0de;text-color:#5bc0de'></span>"+" share "+postLike
						+"</button>"
				+"</form></li>"); 
				
				out.println("</div>");
			
		}
			
				out.println("</div>");
		}
	}


catch(Exception e)
{
	e.printStackTrace();
}
 %>
			</div>
						 
						
									
									
</div>
</div>
									
							
</div>	
</body>
</html>