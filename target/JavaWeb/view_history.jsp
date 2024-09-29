<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.*" %>
<%
  HttpSession userSession = request.getSession();
  String username = (String) userSession.getAttribute("username");
%>
<html>
<head>
  <title>历史记录</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
    }

    .container {
      max-width: 1300px;
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
  <h2>历史记录</h2>

  <% if (request.getAttribute("message") != null) { %>
  <div class="alert alert-info" role="alert"><%= request.getAttribute("message") %></div>
  <% } %>

  <div class="table-container">
    <table class="table table-striped">
      <thead>
      <tr>
        <th scope="col">学号</th>
        <th scope="col">班级</th>
        <th scope="col">姓名</th>
        <th scope="col">性别</th>
        <th scope="col">电话</th>
        <th scope="col">紧急联系人</th>
        <th scope="col">紧急联系人电话</th>
        <th scope="col">详细地址</th>
        <th scope="col">交通工具</th>
        <th scope="col">是否离校</th>
      </tr>
      </thead>

      <%
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC", "root", "123456");
          Statement stmt=conn.createStatement();
          String query = "SELECT * FROM t_student s,t_class c,userlogin u where s.classID = c.id and u.username=s.num";
          PreparedStatement pstmt = conn.prepareStatement(query);
          ResultSet rs = pstmt.executeQuery();

          while (rs.next()) {
      %>
      <tbody>
      <tr>
        <td><%=rs.getString("num") %></td>
        <td><%=rs.getString("c.name") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("gender") %></td>
        <td><%=rs.getString("tel") %></td>
        <td><%=rs.getString("emerpeople") %></td>
        <td><%=rs.getString("emertel") %></td>
        <td><%=rs.getString("province")+ rs.getString("city")+rs.getString("village")%></td>
        <td><%=rs.getString("vehicle") %></td>
        <td><%=rs.getString("lixiao") %></td>

      </tr>
      </tbody>
      <%
          }

          rs.close();
          conn.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      %>

    </table>
  </div>
</div>
</body>
</html>
