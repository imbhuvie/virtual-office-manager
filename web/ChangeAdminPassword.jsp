<%-- 
    Document   : ChangePassword
    Created on : 27 Aug 2024, 3:46:26 pm
    Author     : bhupendraVerma
--%>
<%
          if(session.getAttribute("user")==null){
          response.sendRedirect("index.jsp?error=please login");
    }
          %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp" %>

<h1>Change Password</h1>
<center>
    <div >
        <form action="AdminChangePassword" >
            <table border="1" cellspacing="0" width="500" cellpadding="15" style="background-color: lightgrey; color:black; font-size: 15px;">
                <tr><td>Old password</td><td><input type="password" name="oldpassword"></td></tr>
                <tr><td>New password</td><td><input type="password" name="newpassword"></td></tr>
                <tr><td>Confirm password</td><td><input type="password" name="confirmpassword"></td></tr>
                <tr><td><input type="submit" style="border: none; width: 80px; border: 1px solid green; background-color: green; color: white; font-size: 15px; font-weight: bold;padding: 8px; border-radius: 5px;"></td>
                    <td><input type="reset" style="border: none; width: 80px; border: 1px solid red; background-color: red; color: white; font-size: 15px; font-weight: bold;padding: 8px; border-radius: 5px;"></td></tr>
               
                
                                  <%
            if(request.getParameter("msg")!=null ||request.getParameter("error")!=null){
                if(request.getParameter("msg")!=null){
                String msg=request.getParameter("msg");
                out.println("<tr><td colspan='2'><p style='color:green;font-size:15px;font-weight:bold;text-align:center;' >"+msg+"</p></td></tr>");
                       }
                if(request.getParameter("error")!=null){
                String error=request.getParameter("error");
                out.println("<tr><td colspan='2'><p style='color:red;font-size:15px;font-weight:bold;text-align:center;' >"+error+"</p></td></tr>");
                       }
            }
            %>
                    
            </table>
        </form>
  
    </div>
</center>
</body>
</html>