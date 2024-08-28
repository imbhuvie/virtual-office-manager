
package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out =response.getWriter();
        
        HttpSession session=request.getSession();
        if(session.getAttribute("user")==null){
            response.sendRedirect("index.jsp?error=Please login");
            
        }
        else{
            session.removeAttribute("user");
            response.sendRedirect("index.jsp?msg=logout success");
            
        }
        
    }
        
}
