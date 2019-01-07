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
<body style="height:100vh;">

<%!
	
	String fname,lname,fdEmail,email,a,em,currentUser,status,getEmail,time,pic;
	String comment,commentEmail,fname2,lname2,timeForPost;
	java.util.Date date;
	int postLike,postCount=0,id,cmtId=0,countComments=1,t=0;
	int commentLike,postShare;
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
	 	<div class="col-xs-1 col-sm-2 col-md-3 col-lg-3"></div>
	 		<div class="col-xs-10 col-sm-8 col-md-6 col-lg-6 well">
	
<%
	//select status,email,pic,time,id from timeline where email='"+currentUser+"' order by time desc");

	
	try{	
    						
    						currentUser=(String)session.getAttribute("email");  						
							em=currentUser.replaceAll("[^a-zA-Z0-9]", "");
							
							
    						
							Class.forName("com.mysql.jdbc.Driver");
							
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							

							PreparedStatement ps=conn.prepareStatement("select status,email,pic,time,id from timeline where email='"+currentUser+"' order by time desc");
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
									
									SimpleDateFormat formatTodayTime = new SimpleDateFormat("HH:mm");
									
									String isTimeToday=formatTime.format(todayDate);
									
									
									if(isDayToday.equals(dayForShow))
									{
										dayForShow="";
//????????????????????????????????????????????????????????calTimeDif ctd=new calTimeDif(timeForShow,isTimeToday);


										String hr=timeForShow.substring(0,2);
										String min=timeForShow.substring(3,5);
										
										int hr1=Integer.parseInt(hr);
										int min1=Integer.parseInt(min);
										
										
										
										String hr2=isTimeToday.substring(0,2);
										String min2=isTimeToday.substring(3,5);
											
										int hr3=Integer.parseInt(hr2);
										int min3=Integer.parseInt(min2);
										
										
										
										int hour1=hr3-hr1;
										int minute1=min3-min1;
										
										if(minute1<0)
										{
											hour1=hour1-1;
											minute1=60+minute1;
										}
										
										
										String hour2=Integer.toString(hour1);
										String minute2=Integer.toString(minute1);
										if(hour1==0)
										{
											timeForShow="before "+minute2+" Minutes";
											
										}
										else
										{
											timeForShow="before "+hour2+" Hours";
										}
									}
					%>
								 
									<div class="panel panel-default"><!-- 7q -->
													
					<%

								ps=conn.prepareStatement("select fname,lname from personal where email='"+getEmail+"'");
					
								ResultSet rs1=ps.executeQuery();
					
								if(rs1.next())
								{
						 			fname=rs1.getString(1);
						 			lname=rs1.getString(2);
									
						 			//and time='"+time+"'
						 			
						 			out.println("<div class='panel-heading'>"); //8q
									out.println("<a href='fdProfile.jsp?fdEmail="+getEmail+"' target='_top'>");
									out.println("<span><img style='border-radius:8px' src='fdRetrieve.jsp?fdEmail="+getEmail+"'class='profile-pic' height='80' width='80'></a>");
									out.println("<div style='float:left;padding-left:12px;'>");  //9q
						
						if(getEmail.equals(currentUser))
									{	
								out.println("<a href='profile.jsp'><h3 class='text-primary'>"
									+fname+" "+lname+"</h3></a>");
									}
						else
						{
								out.println("<a href='fdProfile.jsp?fdEmail="+getEmail+"'><h3 class='text-primary'>"
									+fname+" "+lname+"</h3></a>");
						}
								out.println("</span><h6 class='text-muted'>"
									+"<span class='glyphicon glyphicon-time'></span> "
									+timeForShow+"&nbsp&nbsp||&nbsp"+dayForShow+"</h6></div>"); //-9q
					
									
									
									if(getEmail.equals(currentUser))
					{
									out.println	("<form style='padding:10px;float:right' action='trash.jsp?email="+getEmail+"&time="+time+"' method='post'>"
											+"<button class='btn btn-group btn-default'>"
											+"<span  class='glyphicon glyphicon-trash '></span>"
											+"</button>"
									+"</form>");
					}				
										out.println("<div class='post-status'><h5>"+status+"</h5></div>");//w
										out.println("</div>"); //-8q
									
										
										
/////////////////////////GETTING NO OF POST LIKES			
									
										ps=conn.prepareStatement("select postlike from timeline where email='"+getEmail+"' and time like '"+time2+"'");
										
										ResultSet rs2=ps.executeQuery();
							
										if(rs2.next())
										{
								 			postLike=rs2.getInt(1);
										}
									
										
/////////////////////////GETTING NO OF COMMENTS			
										
											ps=conn.prepareStatement("select count(*) as total from comment where postId='"+postId+"'");
											
											ResultSet rs8=ps.executeQuery();
											
											if(rs8.next())
											{
												countComments=rs8.getInt("total");
											}
/////////////////////////GETTING NO OF COMMENTS			
											
											ps=conn.prepareStatement("select postshare from timeline where email='"+getEmail+"' and time like '"+time2+"'");
										
											ResultSet rs9=ps.executeQuery();
							
											if(rs9.next())
											{
								 				postShare=rs9.getInt(1);
											}
/////////////////////////Inserting post Image
							if(!pic.equals(""))
							{
										out.println("<div class='panel-body'>"); //10q
										out.println("<img src='postRetrieve.jsp?email="+getEmail+"&time="+time+"' height='100%' width='100%'>");
							}	
							
					
										
/////////////////////////@@@@@@@@@@@@@@ COMMENT SECTION STARTS									
										
										ps=conn.prepareStatement("select cmnt,email,cmttime,cmtId from comment where postId='"+postId+"'order by cmttime desc");
										
										ResultSet rs4=ps.executeQuery();
										
										postCount++;
										
										out.println("<div class='media collapse' id='comment"+postCount+"'>"); //11q
										
										out.println("<form  action='commentInput.jsp?postId="+postId+"' method='post'>");
						    			out.println("<input placeholder='  Comment Here...' style='width:540px;border:1px solid black;margin-right:20px;border-radius:10px;height:33px' type='text' name='comment'>"
						    			+"<button  class='btn btn-group btn-info'>"
										+"<span  class='glyphicon glyphicon-send' ></span>"+" Send "
						    			+"</button>"+"<input type='hidden' value='timeline' name='backer'>"
										+"</form><hr>");
										while(rs4.next())
										{
								 			comment=rs4.getString(1);
								 			commentEmail=rs4.getString(2);
								 			Timestamp cmttime = rs4.getTimestamp(3);
								 			cmtId=rs4.getInt(4);
								 			
					/////////////////////////GETTING NO OF COMMENT LIKES
								 			
								 												
								 							ps=conn.prepareStatement("select likecomment from comment where cmtId='"+cmtId+"'");
								 													
								 							ResultSet rs6=ps.executeQuery();
								 										
								 								if(rs6.next())
								 										{
								 											commentLike=rs6.getInt(1);
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
													dayForComment="";
												
													String cmThr=timeForComment.substring(0,2);
													String cmTmin=timeForComment.substring(3,5);
													
													int cmThr1=Integer.parseInt(cmThr);
													int cmTmin1=Integer.parseInt(cmTmin);
													
													
													
													String cmThr2=isTimeToday.substring(0,2);
													String cmTmin2=isTimeToday.substring(3,5);
													
													
													int cmThr3=Integer.parseInt(cmThr2);
													int cmTmin3=Integer.parseInt(cmTmin2);
													
													
													
													int cmThour1=cmThr3-cmThr1;
													int cmTminute1=cmTmin3-cmTmin1;
													
													if(cmTminute1<0)
													{
														cmThour1=cmThour1-1;
														cmTminute1=60+cmTminute1;
													}
													
													
													String cmThour2=Integer.toString(cmThour1);
													String cmTminute2=Integer.toString(cmTminute1);
													if(cmThour1==0)
													{
														timeForComment=" before "+cmTminute2+" Minutes";
														
													}
													else
													{
														timeForComment=" before "+cmThour2+" Hours";
													}
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
		
						out.println("<div class='row'>" //12q
										+"<div class='col-sm-1'>"//w
										+"<span><img style='border-radius:90px;' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+commentEmail+"'></span>");
						
						out.println	("</div>"//w
									    +"<div class='col-sm-7'>" //13q
									    +"<h4  class='media-heading text-primary'>");
				if(commentEmail.equals(currentUser))
									{	
										out.println("<a href='profile.jsp'>"+fname2+" "+lname2+"</a>");
									}
								else
									{			    
										out.println("<a href='fdProfile.jsp?fdEmail="+commentEmail+"'>"+fname2+" "+lname2+"</a>");
									}		    
									    out.println("<span style='font-size:12px;padding-left:10px;' class='glyphicon glyphicon-time text-muted'> "+timeForComment+"&nbsp||&nbsp"+dayForComment+"</span></h4>" 
										+"<p>"+comment+"</p></div>");  //-13q
									    
									    out.println	("<div class='col-sm-2'style='padding-top:25px'><form action='likeComment.jsp?cmtId="+cmtId+"' method='post'>"//w
												+"<button style='border-radius:1;' class='btn btn-group btn-link'>"
												+"<span  class='glyphicon glyphicon-heart 'style='color:#5bc0de'></span>"+" Love "+commentLike
												+"</button>"
										+"</form> </div>");//w
										
						
				if((commentEmail.equals(currentUser))||(getEmail.equals(currentUser)))
				{
						out.println	("<div class='col-sm-2 pull-left'><form  action='commentTrash.jsp?cmtId="+cmtId+"' method='post'>"//w
										+"<button style='font-size:10px;' class='btn btn-group btn-default'>"
										+"<span  class='glyphicon glyphicon-trash '></span>"
										+"</button>"
										+"</form></div>");  //w
				}		
						out.println("</div><hr>");//-12q
						
									  
										}
									/*	out.println	("<form style='padding-top:15px;float:left; width:33.33%;' action='like.jsp?email="+getEmail+"&time="+time+"' method='post'>"
												+"<button style='width:100%;' class='btn btn-group btn-info'>"
												+"<span  class='glyphicon glyphicon-heart 'style='color:#5bc0de'></span>"+" Love "+like
												+"</button>"
										+"</form> ");
										*/
										out.println("</div>");//-11q
										if(!pic.equals(""))
										{
											out.println("</div>");//-10q
										}
										
///////////////////////// COMMENT SECTION END

///////////////////////////LIKE COMMENT SHARE

										out.println("<div style='padding-bottom:27px' class='panel panel-footer'>");
										out.println	("<form style='float:left; width:33.33%;' action='likePost.jsp?email="+getEmail+"&time="+timeForPost+"' method='post'>"
												+"<button id='like1' onclick='myFunction()' style='width:100%;border-radius:1;' class='btn btn-group btn-default'>"
												+"<span  class='glyphicon glyphicon-thumbs-up 'style='color:#5bc0de'></span>"+" Love "+postLike
												+"</button>"+"<input type='hidden' value='timeline' name='backer'>"
										+"</form> ");
										
										out.println	("<button class='btn btn-group btn-default' data-toggle='collapse' data-target='#comment"+postCount+"' style='float:left;width:33.33%;border-radius:1;' action='like.jsp?email="+getEmail+"&time="+time+"' method='post'>"
												+"<span  class='glyphicon glyphicon-comment 'style='color:#5bc0de'></span>"+" Comment "+countComments
												+"</button>");
										
										out.println	("<form style='float:left;width:33.33%' action='shareIt.jsp?email="+getEmail+"&temp=share' method='post'>"
												+"<button style='width:100%;border-radius:1;'class='btn btn-group btn-default'>"
												+"<span  class='glyphicon glyphicon-share 'style='color:#5bc0de;text-color:#5bc0de'></span>"+" share "+postShare
												+"</button>"
										+"</form>"); 
										
									}
								
									
										out.println("</div></div>");//-7q
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
									
		<div class="col-xs-1 col-sm-2 col-md-3 col-lg-4"></div>						
</div>	
</body>
</html>