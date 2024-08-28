<%-- 
    Document   : AdminHome
    Created on : Feb 26, 2024, 6:34:09 PM
    Author     : Asus
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
          if(session.getAttribute("user")==null){
          response.sendRedirect("index.jsp?error=please login");
    }
          %>

<%@include file="AdminHeader.jsp" %>     
     
      <div class="clr"></div>
      <%
          if(session.getAttribute("user")!=null){
          String username=(String)session.getAttribute("user");
          out.print("<h1 >Welcome back "+username+"!</h1></br><h2 style='text-align:center;margin-top:0;'>How are you?</h2>");
          }
          %>
  </body>
</html>