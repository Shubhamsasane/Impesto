

import java.io.IOException;
import java.io.PrintStream;
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
 * Servlet implementation class verify
 */
@WebServlet("/verify")
public class verify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verify() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		PrintWriter out=response.getWriter();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
			
			PreparedStatement ps=conn.prepareStatement("select email,password from users where email=? AND password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			
			
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				
				String dbemail=rs.getString(1);
				String dbpassword=rs.getString(2);
				
				
				if(dbemail.equals(email)&&(dbpassword.equals(password)))
				{
					HttpSession session=request.getSession();
					session.setAttribute("email",email);
					
					RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
					rd.forward(request, response);
				}
				
				else if(dbemail==null || dbpassword==null)
				{
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Invalid Email or Password');");
					out.println("</script>");
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
					
				}
				else
				{
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Invalid Email or Password');");
					out.println("</script>");
					RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
					rd.forward(request, response);
				}
				
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Invalid Email or Password');");
				out.println("</script>");
				
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
			}
		}
		catch(Exception e)
		{
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Email or Password');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

}
