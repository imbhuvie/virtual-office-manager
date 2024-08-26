<%-- 
    Document   : UpdateEmployee
    Created on : 25 Aug 2024, 12:14:03 pm
    Author     : bhupendraVerma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="AdminHeader.jsp" %>

<h1>Update Employee</h1>

<center>
    <form action="EmployeeDetail.jsp">

        <table width="500" cellpadding="20" border="1" cellspacing="0" bgcolor="lightblue" style="margin-top:20px;">
            <tr> <td style="font-weight: bold;font-size: 13px;">Employee Code or Contact or Email</td><td><input type="search" name="data"></td></tr>
            <tr> <td><input  type="submit" value="search" style="border: none; border: 1px solid black; background-color: green; color: white; font-size: 15px; font-weight: bold;padding: 8px;" ></td> 
                 <td><input type="reset" value="reset" style="border: none; border: 1px solid black; background-color: red; color: white; font-size: 15px; font-weight: bold;padding: 8px;"></td> </tr>
        </table>
    </form>
</center>

</body>
</html>
