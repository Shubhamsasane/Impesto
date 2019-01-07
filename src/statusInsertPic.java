


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/statusInsertPic")
// @MultipartConfig
public class statusInsertPic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public statusInsertPic() {
        super();
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
		
			String sqlImageInsertDatabase,em,email,name,value;
			
			
			
			HttpSession session=request.getSession();
			email=(String)session.getAttribute("email");

			session.setAttribute("email",email);
			//String status=request.getParameter("status");

//Conversion to Text
			
			em=email.replaceAll("[^a-zA-Z0-9]", "");
			
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/freak","root","1234");
				
					PreparedStatement psImageInsertDatabase=null; 
				
		        byte[] b=null; 
		        
		        String status="";
		      
		    	sqlImageInsertDatabase="insert into timeline(pic,status,email) values(?,?,?)"; 
		    	
		        psImageInsertDatabase=conn.prepareStatement(sqlImageInsertDatabase); 
		            
		           DiskFileItemFactory factory = new DiskFileItemFactory(); 

		           ServletFileUpload sfu = new ServletFileUpload(factory); 
		           List items = sfu.parseRequest(request); 
		           
		           Iterator iter = items.iterator(); 
		          
		           while(iter.hasNext()) { 
		        	   
		        	   
		        	   
		              FileItem item = (FileItem) iter.next(); 
		             		              if (!item.isFormField()) { 
		                   b = item.get(); 
		                  
		               } 
		             		              else
		             		              {
		             		            	 value = item.getFieldName();//text1
		             		                 status = item.getString();
		             		                 
		             		              }
		           } 
		        
		        psImageInsertDatabase.setBytes(1,b); 
		      	psImageInsertDatabase.setString(2,status);
		      	psImageInsertDatabase.setString(3,email);
		        psImageInsertDatabase.executeUpdate(); 
		          
		           RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
		           rd.forward(request, response);
			
			}
			catch(Exception e)
			{
				 	RequestDispatcher rd=request.getRequestDispatcher("statusChoose.jsp");
		            rd.include(request, response);
				
		           out.println("<script type=\"text/javascript\">");
		           out.println("alert('Insert  Image With smaller Size');");
		           out.println("</script>");
				e.printStackTrace();
			}
		       
	}

}
