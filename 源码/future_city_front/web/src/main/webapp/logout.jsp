<%--
  Created by IntelliJ IDEA.
  User: User_qhn
  Date: 2021/7/15
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        session.invalidate();
        response.sendRedirect("login.jsp");
    %>
</body>
</html>
