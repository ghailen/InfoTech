package infotech ; 
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
 
public class login extends HttpServlet{

   public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
	   String pass = null ; 
       String email = null ; 
      // JDBC driver name and database URL
      //String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
       String DB_URL="jdbc:mysql://localhost:3306/infotech";

      //  Database credentials
      String USER = "root";
       String PASS = "";

      // Set response content type
      response.setContentType("text/html");
      PrintWriter out = response.getWriter();
     
      String mail=request.getParameter("u");  
      String password=request.getParameter("p");  
    
      
      
       Statement stmt=null ; 
      Connection conn=null ;
      try {
         // Register JDBC driver
         Class.forName("com.mysql.jdbc.Driver");

         // Open a connection
         conn = DriverManager.getConnection(DB_URL, USER, PASS);

         // Execute SQL query
         
         //stmt = conn.createStatement();
         //String sql;
         //sql = "SELECT id, email,password FROM user where email="+mail+"";
        // ResultSet rs = stmt.executeQuery(sql);
         PreparedStatement ps=conn.prepareStatement("select * from admin where email=? and password=?");  
         ps.setString(1,mail); 
         ps.setString(2,password); 
         
         ResultSet rs=ps.executeQuery();  
         // Extract data from result set
         
         if(rs.next()){
            //Retrieve by column name
          
             pass = rs.getString("password");
             email= rs.getString("email");
         }
            
            if(mail.equals(email) &&  password.equals(pass)){
            	
    		RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
    			rd.forward(request, response);
    			
    		}
            else{
    			out.print("<center> <font color=white ><p style=margin-top:500px>Sorry username or password error! </p></font></center>");
    			RequestDispatcher rd=request.getRequestDispatcher("alogin.jsp");
    			rd.include(request, response);
    		}
            //Display values
           // out.println("ID: " + id + "<br>");
           // out.println(", email: " + email + "<br>");
            //out.println(", pass: " + pass + "<br>");
      
         
        // out.println("</body></html>");

         // Clean-up environment
         rs.close();
         stmt.close();
         conn.close();
      } catch(SQLException se) {
         //Handle errors for JDBC
         se.printStackTrace();
      } catch(Exception e) {
         //Handle errors for Class.forName
         e.printStackTrace();
      } finally {
         //finally block used to close resources
         try {
            if(stmt!=null)
               stmt.close();
         } catch(SQLException se2) {
         } // nothing we can do
         try {
            if(conn!=null)
            conn.close();
         } catch(SQLException se) {
            se.printStackTrace();
         } //end finally try
      } //end try
   }
} 