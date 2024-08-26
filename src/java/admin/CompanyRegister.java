
package admin;

import DB.DBCon;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author bhupendraVerma
 */
@WebServlet(name = "CompanyRegister", urlPatterns = {"/CompanyRegister"})
public class CompanyRegister extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        try{
        String type=request.getParameter("t1"); 
        String user=request.getParameter("t2"); 
        String pswd=request.getParameter("t3");
        DBCon db =new DBCon();
        db.pstmt=db.con.prepareStatement("insert into login(user,password,user_type,ac_status) values(?,?,?,?)");
        db.pstmt.setString(1, user); 
       db.pstmt.setString(2, pswd); 
       db.pstmt.setString(3, "admin"); 
       db.pstmt.setString(4, "1"); 
       int i=db.pstmt.executeUpdate(); 
       out.print("Done.");
       if(i>0) 
       { 
         response.sendRedirect("index.html?msg=Company Added Successfully"); 
       } 
       }
        catch(Exception e){
            out.print(e.getMessage());
            
        }
    }
    
   
}
