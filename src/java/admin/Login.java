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

@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String userType = request.getParameter("t1");
            String userName = request.getParameter("t2");
            String userPwsd = request.getParameter("t3");
            DBCon db = new DBCon();
            db.pstmt = db.con.prepareStatement("select ac_status from login where user=? and password=? and user_type=?");
            db.pstmt.setString(1, userName);
            db.pstmt.setString(2, userPwsd);            
            db.pstmt.setString(3, userType);

            db.rst = db.pstmt.executeQuery();
            if (db.rst.next()) {
                if (db.rst.getInt(1) == 1) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userName);
                    if (userType.equalsIgnoreCase("admin")) {
                        response.sendRedirect("AdminHome.jsp?msg=success");
                    } else {
                        response.sendRedirect("EmployeeHome.jsp?msg=success");
                    }
                } else {
                    response.sendRedirect("index.jsp?error=Your account has been blocked.");

                }

            } else {
                response.sendRedirect("index.jsp?error=Username or password is incorrect.");
            }
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

}
