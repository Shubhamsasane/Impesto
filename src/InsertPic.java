/*
 * @Author:Sneha
 * */


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/InsertPic")
public class InsertPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public InsertPic() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			String sqlImageInsertDatabase;
			
			String temp=request.getParameter("temp");
        	String value,status="";
			
			HttpSession session=request.getSession();
			String email=(String)session.getAttribute("email");
			
			
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
				
				 email=(String)session.getAttribute("email");
				
				PreparedStatement psImageInsertDatabase=null; 
		        
		        byte[] b=null; 
		      
		    if(temp.equals("dp"))
		    {
		        sqlImageInsertDatabase="update profile_pic set dp=? where email=?"; 
		        status="Updated Profile Picture";
		    }
		    else
		    {
		    	sqlImageInsertDatabase="update profile_pic set wallpic=? where email=?"; 
		        status="Updated Wall Picture";
	
		    }
		    
		        psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase); 
		            
		           DiskFileItemFactory factory = new DiskFileItemFactory(); 

		           ServletFileUpload sfu = new ServletFileUpload(factory); 
		           List items = sfu.parseRequest(request); 
		           
		           Iterator iter = items.iterator(); 
		          
		           while (iter.hasNext()) { 
		        	   
		        	   
		        	   
		              FileItem item = (FileItem) iter.next(); 
		             		              if (!item.isFormField()) { 
		                   b = item.get(); 
		               } 
		           } 
		           psImageInsertDatabase.setBytes(1,b); 
		           psImageInsertDatabase.setString(2,email);
		           psImageInsertDatabase.executeUpdate(); 
		           
		           // Insertion Into Profile or Wall pic
				    	sqlImageInsertDatabase="insert into timeline(pic,status,email) values(?,?,?)"; 
				    	
				        psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase); 
				            
				            
				        psImageInsertDatabase.setBytes(1,b); 
				      	psImageInsertDatabase.setString(2,status);
				      	psImageInsertDatabase.setString(3,email);
				        psImageInsertDatabase.executeUpdate(); 
				           
				   
		           
		           RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
		           rd.forward(request, response);
			
			}
			catch(Exception e)
			{
				 	RequestDispatcher rd=request.getRequestDispatcher("imageUpload.jsp");
		            rd.include(request, response);
				
		           out.println("<script type=\"text/javascript\">");
		           out.println("alert('Insert  Image With smaller Size');");
		           out.println("</script>");
				e.printStackTrace();
			}
		       
	}

}
