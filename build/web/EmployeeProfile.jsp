<%-- 
    Document   : EmployeeProfile
    Created on : 28 Aug 2024, 3:38:43 pm
    Author     : bhupendraVerma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="EmployeeHeader.jsp" %>
<%@page import="DB.DBCon"%> 
<h1>Employee Profile</h1>
<center>
  
    <table border="1" cellpadding="10" cellspacing="0" style="font-weight: bold; font-size: 15px; color:blue; margin-top: 15px;">
          <%
        try{
        String email=session.getAttribute("user").toString();
        DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("Select * from emp_mstr where email=?");
        db.pstmt.setString(1,email);
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next()){
            out.print("<tr><td colspan=2>Employee Id Number</td><td colspan=2 style='color:green;'>"+db.rst.getString(11)+"</td></tr>"
            +"<tr><td>Employee Code</td><td style='color:green;'>"+db.rst.getString(1)+"</td><td>Employee Name</td><td style='color:green;'>"+db.rst.getString(2)+"</td><tr>"
            +"<tr><td>Employee DOB </td><td style='color:green;'>"+db.rst.getString(3)+"</td><td>Employee Gender</td><td style='color:green;'>"+db.rst.getString(4)+"</td></tr>"
            +"<tr><td>Employee Post</td><td style='color:green;'> "+db.rst.getString(5)+"</td><td>Employee Address</td><td style='color:green;'>"+db.rst.getString(6)+"</td></tr>"
            + "<tr><td>Employee City</td><td style='color:green;'> "+db.rst.getString(7)+"</td><td>Employee Contact</td><td style='color:green;'>"+db.rst.getString(8)+"</td></tr>"
            + "<tr><td>Employee Email</td><td style='color:green;'>"+email+"</td><td>Employee Id Name</td><td style='color:green;'> "+db.rst.getString(10)+"</td></tr>"
            + "<tr><td colspan=4><a href=EditEmpProfile.jsp ><input type=button value='Edit Profile' style='width:160px; height:50px;font-size:20px;margin-left:170px;border:none;background-color:green;border-radius:10px; color:white;font-weight:bold;'></a></td></tr>");

              }
              }catch(Exception e){
              out.print(e.getMessage());
              e.printStackTrace();
              }
        
    %>

    </table>
</center>
</body>
</html>
