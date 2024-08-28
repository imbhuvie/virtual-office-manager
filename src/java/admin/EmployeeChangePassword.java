
package admin;

import DB.DBCon;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author bhupendraVerma
 */
@WebServlet(name = "EmployeeChangePassword", urlPatterns = {"/ChangeEmpPassword"})
public class EmployeeChangePassword extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try{
            HttpSession session=request.getSession();
            String username = (String) session.getAttribute("user");
            out.print("username :=> "+username);
            
            String oldpassword =request.getParameter("oldpassword");
            String newpassword =request.getParameter("newpassword");
            String confirmpassword =request.getParameter("confirmpassword");
            
            DBCon db =new DBCon();
            db.pstmt=db.con.prepareStatement("select * from login where user=? and password=? ");
            db.pstmt.setString(1, username);
            db.pstmt.setString(2, oldpassword);
            out.print("query for check if in DB :"+db.pstmt);
            db.rst=db.pstmt.executeQuery();
            if(db.rst.next()){
                if(newpassword.equals(confirmpassword)){
                    db.pstmt=db.con.prepareStatement("update login set password=? where user=?");
                    db.pstmt.setString(1, newpassword);
                    db.pstmt.setString(2, username);
                                out.print("Query for update :"+db.pstmt);

                    int rowAffected=db.pstmt.executeUpdate();
                    if(rowAffected!=0){
                        response.sendRedirect("ChangeEmpPassword.jsp?msg=password changed successfull");
                    }
            }else{
                   response.sendRedirect("ChangeEmpPassword.jsp?error=new password and confirm password does not match");

                
                }
            }else{
                response.sendRedirect("ChangeEmpPassword.jsp?error=Old password is inccorect");
            }
            
        }catch(Exception e){
            out.print(e.getMessage());
            e.printStackTrace();
        }
    }

    
    
}
