<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/12/26
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  String driver = "com.mysql.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
  String username = "root";
  String password = "123456";

  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;
  int leaveCount = 0;
  int notLeaveCount = 0;
  int quanbucount = 0;

  try {
    Class.forName(driver);
    conn = DriverManager.getConnection(url, username, password);

    String sqlLeave = "SELECT COUNT(*) FROM t_student WHERE lixiao='离校'";
    String sqlNotLeave = "SELECT COUNT(*) FROM t_student WHERE lixiao!='离校' AND lixiao IS NOT NULL";
    String sqlsum = "SELECT COUNT(*) FROM t_student";

    stmt = conn.createStatement();

    rs = stmt.executeQuery(sqlLeave);

    if (rs.next()) {
      leaveCount = rs.getInt(1);
    }

    rs = stmt.executeQuery(sqlNotLeave);

    if (rs.next()) {
      notLeaveCount = rs.getInt(1);
    }
    rs = stmt.executeQuery(sqlsum);

    if (rs.next()) {
      quanbucount = rs.getInt(1);
    }


  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    if (rs != null) rs.close();
    if (stmt != null) stmt.close();
    if (conn != null) conn.close();
  }
%>

<!DOCTYPE html>
<html>
<head>
  <title>统计学生数据个数</title>
</head>
<body>
<h1>已填表学生人数为: <%= quanbucount %></h1>
<h1>需要离校的学生人数为: <%= leaveCount %></h1>
<h1>不需要离校的学生人数为: <%= notLeaveCount %></h1>
</body>
</html>
