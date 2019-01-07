<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
   <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head><title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="home.css" type="text/css">
<link rel="stylesheet" href="head.css" type="text/css">
</head>
<body>
<%!
		String currentUser,temp,fdEmail,fname,lname;
		Connection conn;
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


			String temp=request.getParameter("temp");
        	String value,status="";
        	String fdEmail=request.getParameter("email");
        	
        	try
    		{
    			 currentUser=(String)session.getAttribute("email");;
    			
    			
    			Class.forName("com.mysql.jdbc.Driver");
    			
    			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
    			
    			System.out.println("CONNECTED");
    			
    			PreparedStatement ps=conn.prepareStatement("select fname,lname from personal where email=?");
    			ps.setString(1,fdEmail);
    			
    			ResultSet rs=ps.executeQuery();
    			
    			while(rs.next())
    			{
    				 fname=rs.getString(1);
    				 lname=rs.getString(2);
    				
    	 		}
    			 
    			status=" shared "+fname+" "+lname+ "'s Post";
    			
    			String sqlImageInsertDatabase="insert into timeline(pic,status,email) values(?,?)"; 
		    	
		        ps=conn.prepareStatement(sqlImageInsertDatabase); 
		            
		            
		       // ps.setBytes(1,b); 
		        ps.setString(1,status);
		      	ps.setString(2,currentUser);
		      	ps.executeUpdate(); 
		      	
		      	RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
		        rd.forward(request, response);
    			
    		
    		}
    		catch(Exception e)
    		{
    			e.printStackTrace();
    		}

        
			
        	
        	
			 
			
			%>	
</body>
</html>