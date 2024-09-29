<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/12/26
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生去向查询</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        function queryStudent() {
            var studentNum = document.getElementById('studentNum').value;
            var studentName = document.getElementById('studentName').value;
            var className = document.getElementById('className').value;

            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        document.getElementById('resultTable').innerHTML = xhr.responseText;
                    } else {
                        console.error('请求失败');
                    }
                }
            };
            xhr.open('POST', 'jieshou.jsp', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.send('studentNum=' + studentNum + '&studentName=' + studentName + '&className=' + className);
        }
    </script>
</head>
<body>
<div class="container">
    <h1>查询学生信息</h1>
    <div class="mb-3">
        <label for="studentNum" class="form-label">学号:</label>
        <input type="text" class="form-control" id="studentNum">
    </div>
    <div class="mb-3">
        <label for="studentName" class="form-label">姓名:</label>
        <input type="text" class="form-control" id="studentName">
    </div>
    <div class="mb-3">
        <label for="className" class="form-label">班级:</label>
        <input type="text" class="form-control" id="className">
    </div>
    <button type="button" class="btn btn-primary" onclick="queryStudent()">查询</button>
</div>
<div class="container mt-4" id="resultTable"></div>
</body>
</html>