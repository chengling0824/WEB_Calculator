<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
      <title>四则运算在线答题系统</title>

  </head>
  
  <body>
  <%
  session.invalidate(); 
   response.sendRedirect("index.jsp"); 
   %>
   正在注销. <br>
  </body>
</html>
