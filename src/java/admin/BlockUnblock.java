
package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author bhupendraVerma
 */
@WebServlet(name = "BlockUnblock", urlPatterns = {"/BlockUnblock"})
public class BlockUnblock extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("email");
            int status =Integer.parseInt(request.getParameter("status"));
            out.print(email + status);
            DBCon db = new DBCon();
            if(status==1){
                status=0;
            }else {
                status=1;
            }
            db.pstmt=db.con.prepareStatement("update login set ac_status=? where user=?");
                db.pstmt.setInt(1, status);
                db.pstmt.setString(2, email); 
            int rowAffected=db.pstmt.executeUpdate();
            if(rowAffected!=0){
                response.sendRedirect("EmployeeList.jsp?msg=success");
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
