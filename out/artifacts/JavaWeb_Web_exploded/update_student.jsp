<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/3
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>修改数据</title>
  <% if (request.getAttribute("message") != null) { %>
  <div class="layui-form-mid layui-word-aux"><%= request.getAttribute("message") %></div>
  <% } %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form action="update_student" method="post">
  <input type="hidden" name="action" value="update">
  <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
  <div class="mb-3">
    <label for="formGroupExampleInput" class="form_label">学号</label>
    <input type="text" class="form-control" id="formGroupExampleInput"  name="num" placeholder="请输入学号" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput2" class="form_label">姓名</label>
    <input type="text" class="form-control" id="formGroupExampleInput2" name="name" placeholder="请输入姓名" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput3" class="form_label">性别</label>
    <input type="text" class="form-control" id="formGroupExampleInput3" name="gender" placeholder="请输入性别男或者女" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput4" class="form_label">电话</label>
    <input type="text" class="form-control" id="formGroupExampleInput4" name="tel" placeholder="请输入自己的电话" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput5" class="form_label">紧急联系人</label>
    <input type="text" class="form-control" id="formGroupExampleInput5" name="emerpeople" placeholder="请输入自己的紧急联系人" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput6" class="form_label">紧急联系人电话</label>
    <input type="text" class="form-control" id="formGroupExampleInput6" name="emertel" placeholder="请输入紧急联系人电话" required>
  </div>
  <div class="mb-3">
    <label for="formGroupExampleInput7" class="form_label">班级</label>
    <input type="text" class="form-control" id="formGroupExampleInput7" name="classID" placeholder="请输入班级编号" required>
  </div>

  <div class="mb-3">
    <input type="submit" value="提交修改">
  </div>
</form>
</body>
</html>
