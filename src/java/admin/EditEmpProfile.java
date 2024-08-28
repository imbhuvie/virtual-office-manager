/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package admin;

import DB.DBCon;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author bhupendraVerma
 */
@WebServlet(name = "EditEmpProfile", urlPatterns = {"/EditEmpProfile"})
public class EditEmpProfile extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            String email = session.getAttribute("user").toString();
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gen");
            String address = request.getParameter("addr");
            String city = request.getParameter("city");
            String contact = request.getParameter("cont");
            DBCon db = new DBCon();
            db.pstmt = db.con.prepareStatement("update emp_mstr set "
                    + "ename=?, edob=?, egender=?, eaddress=?, ecity=?, econtact=? "
                    + "where email=?");
            db.pstmt.setString(1, name);
            db.pstmt.setString(2, dob);
            db.pstmt.setString(3, gender);
            db.pstmt.setString(4, address);
            db.pstmt.setString(5, city);
            db.pstmt.setString(6, contact);
            db.pstmt.setString(7, email);
            out.print(db.pstmt);
            int rowAffected = db.pstmt.executeUpdate();
            if (rowAffected != 0) {
                response.sendRedirect("EditEmpProfile.jsp?msg=Profile updated.");
            } else {
                response.sendRedirect("EditEmpProfile.jsp?error=Profile not updated.");

            }
            out.print("hello");
        } catch (Exception e) {
            out.print(e.getMessage());
            e.printStackTrace();
        }
    }

}
