

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class dbsubmit
 */
@WebServlet("/dbsubmit")
public class dbsubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dbsubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String goAhead="yes";
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String rpassword=request.getParameter("rpassword");
		
		String p=(String)request.getParameter("phone");
		Double phone=Double.parseDouble(p);
		
		
		String fname1=request.getParameter("fname");
		String fname=fname1.substring(0, 1).toUpperCase() + fname1.substring(1);
		
		
		String lname1=request.getParameter("lname");
		String lname=lname1.substring(0, 1).toUpperCase() + lname1.substring(1);
		
		/*String dob=request.getParameter("dob");*/
		
		String gender=request.getParameter("gender");
		String country=request.getParameter("country");
		
		
		PrintWriter out=response.getWriter();
		
	if(password.equals(rpassword))
	{
		

		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");

			
			PreparedStatement ps=conn.prepareStatement("select email from users");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				String dbemail=rs.getString(1);
			
				if(email.equals(dbemail))
				{
					goAhead="no";
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
		            rd.include(request, response);
				
		           out.println("<script type=\"text/javascript\">");
		           out.println("alert('Account with this Email already exists. <br>Enter Different Email');");
		           out.println("</script>");
				}
			}


		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	
if(goAhead.equals("yes"))
{
		try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			conn.setAutoCommit (false);
			
//   Users Table
			
		PreparedStatement ps=conn.prepareStatement("insert into users(email,password) values(?,?)");
		ps.setString(1,email);
		ps.setString(2,password);
					
//				ps.setString(4,dob);
		ps.executeUpdate();

//  Contact Table
			
			ps=conn.prepareStatement("insert into contact(email,country,phone) values(?,?,?)");
			ps.setString(1, email);
			ps.setString(2, country);
			ps.setDouble(3, phone);
			ps.executeUpdate();
			
//  personal  Table
			ps=conn.prepareStatement("insert into personal(fname,lname,gender,phone,email) values(?,?,?,?,?)");
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, gender);
			ps.setDouble(4, phone);
			ps.setString(5, email);
			ps.executeUpdate();

//  eduwork tabel
			ps=conn.prepareStatement("insert into eduwork(email) values(?)");
			ps.setString(1, email);
			ps.executeUpdate();

//  relation table
			ps=conn.prepareStatement("insert into relation(email) values(?)");
			ps.setString(1, email);
			ps.executeUpdate();

//Conversion of Email to plain Text			
			
			String em=email.replaceAll("[^a-zA-Z0-9]", "");

// SentRequestUser Table Creation
			
			String sql="create table sentRequest"+em+" (sentid integer(3) primary key auto_increment,frendEmail varchar(30))";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();


// pendingRequestFriendUser Table Creation
			
			sql="create table pendingRequest"+em+" (pendingid integer(3) primary key auto_increment,frendEmail varchar(30),status integer(2))";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();

// FriendUser Table Creation
			
			sql="create table friend"+em+" (friendid integer(3) primary key auto_increment,frendEmail varchar(30))";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();

//My frend
			// currentUser friend Table Creation
			sql="insert into friend"+em+" (frendEmail) values(?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,"Shubham@gmail.com");
			ps.executeUpdate();

//currentFriend friend Table Creation
			sql="insert into friendShubhamgmailcom (frendEmail) values(?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,email);
			ps.executeUpdate();
			
			

			
			
//  Profile Picture table	
			String path = getServletContext().getRealPath("basicPic.png");
			File f=new File(path);
			String path1 = getServletContext().getRealPath("wallpic.png");
			File f1=new File(path1);
			
			
			FileInputStream fis=new FileInputStream(f);
			
			
			FileInputStream fis1=new FileInputStream(f1);
			
			ps=conn.prepareStatement("insert into profile_pic(email,dp,wallpic) values(?,?,?)" );
			ps.setString(1, email);
			ps.setBinaryStream(2,fis,(int)f.length());
			ps.setBinaryStream(3,fis1,(int)f1.length());
			
			ps.executeUpdate();

//LAST
			conn.commit();
			conn.close();
			ps.close();
			//fis.close();
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("log in.jsp");
			rd.include(request, response);
		
		}
		
		catch(Exception e)
		{
			
			e.printStackTrace();
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
		
           out.println("<script type=\"text/javascript\">");
           out.println("alert('Account with this Email already exists.Enter Different Email');");
           out.println("</script>");
		}
	}
	}
	else
	{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please Enter Matching Password');");
			out.println("</script>");
			
			
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
	
	}
	}

}
