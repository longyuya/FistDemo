<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/12/26
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%

  String driverClass = "com.mysql.cj.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
  String user = "root";
  String password = "123456";
  Connection conn = null;
  try {
    Class.forName(driverClass);
    conn = DriverManager.getConnection(url, user, password);

    String studentNum = request.getParameter("studentNum");
    String studentName = request.getParameter("studentName");
    String studentClass = request.getParameter("studentClass");

    String sql = "SELECT * FROM t_student s,t_class c WHERE 1=1";
    if (studentNum != null && !studentNum.isEmpty()) {
      sql += "AND num = ?";
    }
    if (studentName != null && !studentName.isEmpty()) {
      sql += "AND name = ?";
    }
    if (studentClass != null && !studentClass.isEmpty()) {
      sql += "AND c.name = ?";
    }

    PreparedStatement stmt = conn.prepareStatement(sql);

    int parameterIndex = 1;
    if (studentNum != null && !studentNum.isEmpty()) {
      stmt.setString(parameterIndex, studentNum);
      parameterIndex++;
    }
    if (studentName != null && !studentName.isEmpty()) {
      stmt.setString(parameterIndex, studentName);
      parameterIndex++;
    }
    if (studentClass != null && !studentClass.isEmpty()) {
      stmt.setString(parameterIndex, studentClass);
      parameterIndex++;
    }

    ResultSet rs = stmt.executeQuery();
%>
<table class="table">
  <thead>
  <tr>
    <th>学号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>电话</th>
    <th>紧急联系人</th>
    <th>紧急联系人电话</th>
    <th>去向地址</th>
  </tr>
  </thead>
  <tbody>
  <%
    if (rs.next()) {
      rs.beforeFirst();
      while (rs.next()) {
  %>
  <tr>
    <td><%= rs.getString("num") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("gender") %></td>
    <td><%= rs.getString("tel") %></td>
    <td><%= rs.getString("emerpeople") %></td>
    <td><%= rs.getString("emertel") %></td>
    <td><%= rs.getString("province") + rs.getString("city") + rs.getString("village") %></td>
  </tr>
  <% }
  } else { %>

  <% } %>
  </tbody>
</table>
<%
  } catch (Exception ex) {
    ex.printStackTrace();
  } finally {
    if (conn != null) {
      try {
        conn.close();
      } catch (Exception ex) {
        ex.printStackTrace();
      }
    }
  }
%>
