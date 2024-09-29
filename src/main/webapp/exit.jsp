<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/28
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
<% session.invalidate(); %>
<jsp:forward page="index.jsp"></jsp:forward>
</body>
</html>
