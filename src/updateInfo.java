
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updateInfo
 */
@WebServlet("/updateInfo")
public class updateInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String email=(String)session.getAttribute("email");
//Specifies which Attribute to update
		
		String id=request.getParameter("id");
		System.out.println(id);
		
//Contact Table variables	
		String city=null,city1 = null,country=null,phone=null,newEmail=null;
		
// Contact Table
		
		if(id.equals("changeEmail"))
		{
			newEmail=request.getParameter("newEmail");
		}
		else if(id.equals("changeCountry"))
		{
			country=request.getParameter("country");
		}
		else if(id.equals("changeCity"))
		{
			city1=request.getParameter("city");
			
			city=city1.substring(0, 1).toUpperCase() + city1.substring(1);
		}
		else if(id.equals("changePhone"))
		{
			phone=request.getParameter("phone");
			
		}
//Work Table variables	
				String company = null,sSchool=null,pSchool=null,college=null,company1= null,sSchool1=null,pSchool1=null,college1=null;
		
// Work Table
		
		if(id.equals("changePSchool"))
		{
			pSchool1=request.getParameter("pSchool");
			pSchool=pSchool1.substring(0, 1).toUpperCase() + pSchool1.substring(1);
		}
		else if(id.equals("changeSSchool"))
		{
			sSchool1=request.getParameter("sSchool");
			sSchool=sSchool1.substring(0, 1).toUpperCase() + sSchool1.substring(1);
		}
		else if(id.equals("changeCollege"))
		{
			college1=request.getParameter("college");
			college=college1.substring(0, 1).toUpperCase() + college1.substring(1);
		}
		else if(id.equals("changeCompany"))
		{
			company1=request.getParameter("company");
			company=company1.substring(0, 1).toUpperCase() + company1.substring(1);
			
		}

//Personal Table variables	
		
		String fname1= null,lname1=null,fname=null,gender=null,bDate=null;
		String lname=null;

//Personal Table

if(id.equals("changeLName"))
{
			lname1=request.getParameter("lname");
			lname=lname1.substring(0, 1).toUpperCase() + lname1.substring(1);
			
}
else if(id.equals("changeGender"))
{
	gender=request.getParameter("gender");
}

else if(id.equals("changeBDate"))
{
	bDate=request.getParameter("bDate");
}
else if(id.equals("changeFName"))
{
	fname1=request.getParameter("fname");
	fname=fname1.substring(0, 1).toUpperCase() + fname1.substring(1);
	
}
		
//Relation Table variables	

String status = null;

//Relation Table

if(id.equals("changeStatus"))
{
	status=request.getParameter("status");
}



//Password variables	

String password= null,newPassword = null,reNewPassword=null;

//Password Table

if(id.equals("changePassword"))
{
	password=request.getParameter("oldPassword");
	newPassword=request.getParameter("newPassword");
	reNewPassword=request.getParameter("reNewPassword");

	
	
}

try
		{
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
// Contact Tbale Updation
			
			if(id.equals("changeCity"))
			{
				PreparedStatement ps=conn.prepareStatement("update  contact set city=? where email=?");
				ps.setString(1, city);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editContact.jsp");
				rd.forward(request, response);
			}
			
			else if(id.equals("changeCountry"))
			{
				PreparedStatement ps=conn.prepareStatement("update  contact set country=? where email=?");
				ps.setString(1, country);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editContact.jsp");
				rd.forward(request, response);
				
			}
			
			else if(id.equals("changePhone"))
			{
				PreparedStatement ps=conn.prepareStatement("update  contact set phone=? where email=?");
				ps.setString(1, phone);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editContact.jsp");
				rd.forward(request, response);
				
			}
		
			else if(id.equals("changeEmail"))
			{
				PreparedStatement ps=conn.prepareStatement("update  contact set email=? where email=?");
				ps.setString(1, newEmail);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editContact.jsp");
				rd.forward(request, response);
				
			}
			
// Work Tabale Updation

			if(id.equals("changeCollege"))
			{
				PreparedStatement ps=conn.prepareStatement("update  eduwork set college=? where email=?");
				ps.setString(1, college);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editWork.jsp");
				rd.forward(request, response);
			}
			
			else if(id.equals("changeCompany"))
			{
				PreparedStatement ps=conn.prepareStatement("update  eduwork set company=? where email=?");				
				ps.setString(1, company);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editWork.jsp");
				rd.forward(request, response);
				
			}
			
			else if(id.equals("changePSchool"))
			{
				PreparedStatement ps=conn.prepareStatement("update  eduwork set pSchool=? where email=?");
				ps.setString(1, pSchool);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editWork.jsp");
				rd.forward(request, response);
				
			}
		
			else if(id.equals("changeSSchool"))
			{
				PreparedStatement ps=conn.prepareStatement("update  eduwork set sSchool=? where email=?");
				ps.setString(1, sSchool);
				ps.setString(2, email);
			
				ps.executeUpdate();
				RequestDispatcher rd=request.getRequestDispatcher("editWork.jsp");
				rd.forward(request, response);
				
			}	
			
// Personal Tabale Updation

						if(id.equals("changeFName"))
						{
							PreparedStatement ps=conn.prepareStatement("update  personal set fname=? where email=?");
							ps.setString(1,fname);
							ps.setString(2,email);
						
							ps.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("editPersonal.jsp");
							rd.forward(request, response);
						}
						
						else if(id.equals("changeLName"))
						{
							PreparedStatement ps=conn.prepareStatement("update  personal set lname=? where email=?");				
							ps.setString(1,lname);
							ps.setString(2,email);
						
							ps.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("editPersonal.jsp");
							rd.forward(request, response);
							
						}
						
						else if(id.equals("changeGender"))
						{
							PreparedStatement ps=conn.prepareStatement("update  personal set gender=? where email=?");
							ps.setString(1, gender);
							ps.setString(2, email);
						
							ps.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("editPersonal.jsp");
							rd.forward(request, response);
							
						}
					
						else if(id.equals("changeSSchool"))
						{
							PreparedStatement ps=conn.prepareStatement("update  personal set bDate=? where email=?");
							ps.setString(1, bDate);
							ps.setString(2, email);
						
							ps.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("editPersonal.jsp");
							rd.forward(request, response);
							
						}	
						
// Relation Table Updation

						if(id.equals("changeStatus"))
						{
							PreparedStatement ps=conn.prepareStatement("update relation set status=? where email=?");
							ps.setString(1, status);
							ps.setString(2, email);
						
							ps.executeUpdate();
							RequestDispatcher rd=request.getRequestDispatcher("editRelp.jsp");
							rd.forward(request, response);
						}

// Password Table Updation

						if(id.equals("changePassword"))
						{
							
							
//Password Match LOgic
							
							PreparedStatement ps=conn.prepareStatement("select password from users where email=?");
							ps.setString(1, email);
							
							PrintWriter out=response.getWriter();
							
							ResultSet rs=ps.executeQuery();
							
							System.out.println("-------------------------111111111111");
							
							if(rs.next())
							{
								String dbpassword=rs.getString(1);
								
								if((password.equals(dbpassword)))
								{
									if(newPassword.equals(reNewPassword))
									{
										ps=conn.prepareStatement("update users set password=? where email=?");
										ps.setString(1, newPassword);
										ps.setString(2, email);

										System.out.println("-------------------------22222222222222");
											
										ps.executeUpdate();
										
										out.println("<script type=\"text/javascript\">");
										out.println("alert('Password Changed ');");
										out.println("</script>");
										
										RequestDispatcher rd=request.getRequestDispatcher("editPassword.jsp");
										rd.include(request, response);
									}
									else
									{
										out.println("<script type=\"text/javascript\">");
										out.println("alert('Enter Matching Passwords');");
										out.println("</script>");
										
										RequestDispatcher rd=request.getRequestDispatcher("editPassword.jsp");
										rd.include(request, response);
									}
								}
								else
								{
									out.println("<script type=\"text/javascript\">");
									out.println("alert('You have entered wrong current password');");
									out.println("</script>");
									
									RequestDispatcher rd=request.getRequestDispatcher("editPassword.jsp");
									rd.include(request, response);
								}

							}
							
							
							
						}
							
				
				conn.close();
					
				
			
			}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
		
	}

}
