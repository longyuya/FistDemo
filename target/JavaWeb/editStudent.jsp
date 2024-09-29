<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>编辑学生信息</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
</head>
<body>
<div class="container">
  <h1>编辑学生信息</h1>
  <form action="editStudent.jsp" method="post">
    <div class="mb-3">
      <label for="num" class="form-label">学号</label>
      <input type="text" class="form-control" id="num" name="num" readonly value="<%=request.getParameter("id")%>">
    </div>
    <div class="mb-3">
      <label for="name" class="form-label">姓名</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="mb-3">
      <label for="gender" class="form-label">性别</label>
      <select class="form-select" id="gender" name="gender" required>
        <option value="男">男</option>
        <option value="女">女</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="tel" class="form-label">电话</label>
      <input type="text" class="form-control" id="tel" name="tel" required>
    </div>
    <div class="mb-3">
      <label for="emerpeople" class="form-label">紧急联系人</label>
      <input type="text" class="form-control" id="emerpeople" name="emerpeople" required>
    </div>
    <div class="mb-3">
      <label for="emertel" class="form-label">紧急联系人电话</label>
      <input type="text" class="form-control" id="emertel" name="emertel" required>
    </div>
    <button type="submit" class="btn btn-primary">保存</button>
  </form>
</div>
</body>
</html>