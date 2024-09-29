<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/12/24
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看班级</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      max-width: 800px;
      margin: 50px auto;
      background-color: #ffffff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #007bff;
    }

    .alert {
      margin-top: 20px;
    }

    .table-container {
      margin-top: 20px;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>班级信息</h2>

  <% if (request.getAttribute("message") != null) { %>
  <div class="alert alert-info" role="alert"><%= request.getAttribute("message") %></div>
  <% } %>

  <div class="table-container">
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">序号</th>
        <th scope="col">班级</th>
        <th scope="col">年级</th>
        <th scope="col">所属学院</th>
        <th scope="col">操作</th>

      </tr>
<script>
  function deleteClass(id) {
  var confirmed = confirm("确认删除该数据吗？！！");
  if (confirmed) {
    window.location.href = "<%=request.getContextPath()%>/deleteclass?id=" + id;
  }
}
</script>
      </thead>

      <%
        String driverClass="com.mysql.cj.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user="root";
        String password="123456";
        Connection conn;
        try{
          Class.forName(driverClass);
          conn= DriverManager.getConnection(url, user, password);
          Statement stmt=conn.createStatement();
          String sql="select * from t_class";
          ResultSet rs=stmt.executeQuery(sql);
          while(rs.next()){

      %>
      <tbody>
      <tr>
        <td><%= rs.getString("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("enreryear") %></td>
        <td><%= rs.getString("colleagename") %></td>
        <td>
          <button onclick="deleteClass('<%=rs.getString("id") %>')">删除</button>
        </td>
      </tr>

      </tbody>
      <%
          }
        }catch (Exception ex){
          ex.printStackTrace();

        }
      %>
    </table>
  </div>
</div>

</body>
</html>