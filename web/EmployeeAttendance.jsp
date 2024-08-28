<%-- 
    Document   : EmployeeAttendance
    Created on : 28 Aug 2024, 3:13:01 pm
    Author     : bhupendraVerma
--%>
<%
          if(session.getAttribute("user")==null){
          response.sendRedirect("index.jsp?error=please login");
    }
          %>

          <%@include file="AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attendance</title>
    </head>
    <body>
        <h1>Employee Attendance</h1>
    </body>
</html>
