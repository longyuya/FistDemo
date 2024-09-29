<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/12/24
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加班级</title>
    <% if (request.getAttribute("message") != null) { %>
    <div class="layui-form-mid layui-word-aux"><%= request.getAttribute("message") %></div>
    <% } %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<form action="add_class" method="post">
    <input type="hidden" name="action" value="add">
    <div class="mb-3">
        <label for="formGroupExampleInput" class="form_label">班级名称</label>
        <input type="text" class="form-control" id="formGroupExampleInput"  name="name" placeholder="请输入班级名称" required>
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput2" class="form_label">入学年份</label>
        <input type="text" class="form-control" id="formGroupExampleInput2" name="enreryear" placeholder="请输入入学年份" required>
    </div>
    <div class="mb-3">
        <label for="formGroupExampleInput3" class="form_label">所属学院</label>
        <input type="text" class="form-control" id="formGroupExampleInput3" name="colleagename" placeholder="请输入所属学院" required>
    </div>


    <div class="mb-3">
        <input type="submit" value="提交">
    </div>


</form>


</body>
</html>