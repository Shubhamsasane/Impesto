<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Date" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>HOME</title>
  
     <meta name="viewport" content="fr" width="device-width", initial-scale="1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
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



<%!
String fname,nameOfTable;
String lname,currentUser,currentFriend,yesorno="no",msg;
String connection;
String em;
String matchingFdEmail,k=""; 
String email;
String fdEmail;
int tmp=0;
java.util.Date date;
String time;


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

<body style="padding-top:70px;">

<%@include file="heading.jsp"%>



<!-- Friends -->
	
	<div class="container-fluid">
		
			
						<%		
							
						try
						{
							
							String currentUser=(String)session.getAttribute("email");
							
							em=email.replaceAll("[^a-zA-Z0-9]", "");
							
							
							Class.forName("com.mysql.jdbc.Driver");
							
							Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
							
							
							PreparedStatement ps=conn.prepareStatement("select fname,lname,email from personal where email=ANY (select frendEmail from friend"+em+")");
							
							ResultSet rs=ps.executeQuery();
							
							if(rs.next())
							{
								%>
								
								<hr>
							<%
							rs.previous();
							
							yesorno="yes";
							}
							
							while(rs.next())
							{
								
								tmp=0;
								 fname=rs.getString(1);
								 lname=rs.getString(2);
								 fdEmail=rs.getString(3);
								
							
							out.println("<a href='chatting.jsp?fdEmail="+fdEmail+"' target='_blank'>");

							out.println("<div class='row' >");
							out.println("<div class='col-sm-1 '></div><div style='text-align:center' class='col-sm-3'>");
							out.println("<img src='fdRetrieve.jsp?fdEmail="+fdEmail+"' height='70px' style='border:2px solid black;border-radius:9px' alt='friend'>");
							out.println("<h3 style='color:black;'>");
							out.print(fname+' '+lname);
							out.print("</h3>"+"</div>");
							
							

//////////////////////////////////////////////////////////////////////////////  Chat History				        
							
					String fdEm=fdEmail.replaceAll("[^a-zA-Z0-9]", "");
        			String em=email.replaceAll("[^a-zA-Z0-9]", "");
        			
							try
							{
								tmp=0;
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
								
		    					nameOfTable="";
						
							}
							
							try
				    		{
								
				    			ps=conn.prepareStatement("select message,email,time from "+nameOfTable);
				    		
				    			ResultSet rs4=ps.executeQuery();
				    			
				    			if(rs4.last())
				    			{
				    				msg=rs4.getString(1);
				    				 String chatEmail=rs4.getString(2);
				    				
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
				    				
											
				    				
 // OWN CHATS   
				 
				 if(chatEmail.equals(currentUser))
				 
				 		{
					 			out.println("<div class='col-sm-1 '><span><img style='border-radius:90px;' class='pull-right' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+email+"'></span>");
						
		    					out.println("</div><div class='col-sm-3 arrow_box' style='border:4px solid #00cccc;border-radius:20px;color:black'> <br>");
				    			
		    					out.println(msg+"<hr> <small class='pull-left text-muted'>"+day+"</small><small class='pull-right text-muted'><span class='glyphicon glyphicon-time'> </span> &nbsp"+time+"</small></div>");
						
		    					out.println	("<form class='col-sm-1 pull-left' style='padding:10px;float:right;padding-left:38px' action='chatTrash.jsp?nameOfTable="+nameOfTable+"' method='post'>"
										+"<button class='btn btn-group btn-default'>"
										+"<span  class='glyphicon glyphicon-trash '></span>"
										+"</button>"
								+"</form><br></div></div>");
				 		}
				 
//FRIENDS CHATS
				 
				 else if(tmp==1)
					 
				 		{			
								 out.println("<div class='col-sm-1 '><span><img style='border-radius:90px;' class='pull-right' height='50px' width='50px' src='fdRetrieve.jsp?fdEmail="+fdEmail+"'></span>");
						

				    			out.println("</div><div class='col-sm-3 arrow_box1' style='border:4px solid orange;border-radius:20px;color:black'> <br>");
				    			
				    			out.println(msg+"<hr> <small class='pull-left text-muted'>"+day+"</small><small class='pull-right text-muted'><span class='glyphicon glyphicon-time'> </span> &nbsp"+time+"</small></div>");
				    		
				    			out.println	("<form class='col-sm-1 pull-left' style='padding:10px;float:right;' action='chatTrash.jsp?nameOfTable="+nameOfTable+"' method='post'>"
										+"<button class='btn btn-group btn-default'>"
										+"<span  class='glyphicon glyphicon-trash '></span>"
										+"</button>"
								+"</form><br></div></div>");
						 }  			
				    			
				  }
				    			else
				    			{
				    				out.println("<div class='col-sm-1 '>");
				    				
				    				out.println("</div><div class='col-sm-3' style='text-align:center;border:4px solid #00cccc;border-radius:20px;'> <br>");
				    			
				    				out.println("<h3>Start Conversation</h3><hr></div><br></div></div>");
				    				
				    			}
				    			
}
catch(Exception e)
	{
	
	System.out.println("kkkkkkk2222222222222222"+nameOfTable);
		out.println("<div class='col-sm-1 '>");
	
		out.println("</div><div class='col-sm-3' style='text-align:center;border:4px solid #00cccc;border-radius:20px;'> <br>");
	
		out.println("<h3>Start Conversation</h3><hr></div><br></div></div>");
	   			
		e.printStackTrace();
	}

//////////////////////////////////////////////////////////////////////////////  Chat History				        
							//out.println("</div>");
							out.println("</a><hr>");
							//count++;
								
							}	
						}
						catch(Exception e)
						{
							e.printStackTrace();
						}
						%>
						
						
			
		

		
			
		
	</div>
	
	
			
	
	
	
</body>
</html>