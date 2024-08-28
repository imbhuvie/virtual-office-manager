<%-- 
    Document   : EditEmpProfile
    Created on : 28 Aug 2024, 4:39:06 pm
    Author     : bhupendraVerma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="EmployeeHeader.jsp" %>
<%@page import="DB.DBCon" %>

        <h1>Edit your profile</h1>
<center>
                       <%
            if(request.getParameter("msg")!=null ||request.getParameter("error")!=null){
                if(request.getParameter("msg")!=null){
                String msg=request.getParameter("msg");
                out.println("<p style='color:green;font-size:15px;font-weight:bold;text-align:center;margin-top:15px;' >"+msg+"</p>");
                       }
                if(request.getParameter("error")!=null){
                String error=request.getParameter("error");
                out.println("<p style='color:red;font-size:15px;font-weight:bold;text-align:center;margin-top:15px;' >"+error+"</p>");
                       }
            }
            %>
          <%
        try{
        String email=session.getAttribute("user").toString();
        DBCon db=new DBCon();
        db.pstmt=db.con.prepareStatement("Select * from emp_mstr where email=?");
        db.pstmt.setString(1,email);
        db.rst=db.pstmt.executeQuery();
        if(db.rst.next()) 
        { 
        out.println("<center><div style='width:500px;height:700px; margin-top:15px;'>" 
                +"<form action=EditEmpProfile method=post style='background-color:lightgreen;' >" 
                +"<table width=500 border=1 cellpadding=13>" 
                +"<tr><td>Employee Code</td><td style='color:black;'>"+db.rst.getString(1)+"</td></tr>"   
                +"<tr><td>Id Number</td><td style='color:black;'>"+db.rst.getString(11)+"</td></tr>"   
                +"<tr><td>Id Name</td><td style='color:black;'>"+db.rst.getString(10)+"</td></tr>"   
                +"<tr><td>E Mail</td><td style='color:black;'>"+db.rst.getString(9)+"</td></tr>"   
                +"<tr><td>Post</td><td style='color:black;'>"+db.rst.getString(5)+"</td></tr>"   
                +"<tr><td>Employee Name</td><td><input type=text name=name value='"+db.rst.getString(2)+"'></td></tr>"   
                +"<tr><td>Date of Birth</td><td><input type=date name=dob value='"+db.rst.getString(3)+"'></td></tr> "  
                +"<tr><td>Gender</td><td style='color:black;'><input type=radio name=gen value=Male ");
                if(db.rst.getString(4).equalsIgnoreCase("male")){
                out.print("checked");
    }
                out.print(" >Male <input type=radio name=gen value=Female ");
                                if(db.rst.getString(4).equalsIgnoreCase("female")){
                out.print("checked");
    }
                out.print(" >Female</td></tr>"   
                +"<tr><td>Address</td><td><input type=text name=addr value='"+db.rst.getString(6)+"'></td></tr>"   
                +"<tr><td>City</td><td><input type=text name=city value='"+db.rst.getString(7)+"'></td></tr> "  
                +"<tr><td>Contact</td><td><input type=number name=cont value='"+db.rst.getString(8)+"'></td></tr>"   
                +"<tr><th><input type=submit value=Update ></th><td><a href=EmployeeHome.jsp ><input type=button value=Back ></td></tr>"   
                +"</table></center>" 
                +"</form>" 
                +"</div>");     
        } 
              }catch(Exception e){
              out.print(e.getMessage());
              e.printStackTrace();
              }
        
    %>

</center>
</body>
</html>
