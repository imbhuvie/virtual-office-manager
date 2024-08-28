<%-- 
    Document   : EmployeeList
    Created on : 26 Aug 2024, 4:31:30 pm
    Author     : bhupendraVerma
--%>
<%
          if(session.getAttribute("user")==null){
          response.sendRedirect("index.jsp?error=please login");
    }
          %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp" %>

<%@page import="DB.DBCon"%> 
<%@page import="java.sql.*"%> 

<div>
    <center>
        <h2>Employee List</h2>
        <table width="1200" cellpadding="10" cellspacing="0" border="1" >
            <tr bgcolor="blue" style="color: white;">
                <th>Emp. Code</th>
                <th>Name</th>
                <th>DOB</th>
                <th>Post</th>
                <th>Address</th>
                <th>City</th>
                <th>Contact</th>
                <th>Email</th>
                <th>Id Name</th>
                <th>Id No.</th>
                <th>Acc. Status</th>
                <th>Action</th>
               
            </tr>
            <%
                DBCon db=new DBCon();
                db.pstmt=db.con.prepareStatement("Select * from emp_mstr");
                db.rst=db.pstmt.executeQuery();
                int i=1;
                while(db.rst.next()){
                out.print("<tr style='color:black;'> "
                + "<td> "+ db.rst.getString(1) +"</td> "
                + "<td> "+ db.rst.getString(2) +"</td> "
                + "<td> "+ db.rst.getString(3) +"</td> "
                + "<td> "+ db.rst.getString(5) +"</td> "
                + "<td> "+ db.rst.getString(6) +"</td> "
                + "<td> "+ db.rst.getString(7) +"</td> "
                + "<td> "+ db.rst.getString(8) +"</td> "
                + "<td> "+ db.rst.getString(9) +"</td> "
                + "<td> "+ db.rst.getString(10) +"</td> "
                + "<td> "+ db.rst.getString(11) +"</td> ");
                String email=db.rst.getString(9);
                db.pstmt=db.con.prepareStatement("select ac_status from login where user=?");
                db.pstmt.setString(1,email);
                ResultSet rs=db.pstmt.executeQuery();
                if(rs.next()){
                 if(rs.getInt(1)==1){
                    out.print("<td style='color:green;font-weight:bold; font-size:14px;'>Active</td> "
                    + "<td> <a href=BlockUnblock?email="+email+"&status=1>"
                    + "<input type=button  value='Deactivate' "
                    + "style='border:none; border:1px solid red; border-radius:4px;color:white;background-color:red; padding:8px; width:100px;'>"
                    + "</a></td>");
                    }
                    else{
                    out.print("<td style='color:red; font-weight:bold; font-size:14px;'>Inactive</td> "
                    + "<td> <a href=BlockUnblock?email="+email+"&status=0> "
                    + "<input type=button  value='Activate' "
                    + "style='border:none; border:1px solid green; border-radius:4px;color:white;background-color:green; padding:8px;width:100px;'>"
                    + "</a></td>");
                }
                }
                out.print("</tr>");
                }
               
                %>
            
        </table>
    </center>
</div>