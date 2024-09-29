<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>假期管理</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f8f8f8;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-top: 20px;
            display: none;
        }

        .action-buttons {
            margin-bottom: 20px;
        }

        button {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-right: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            border: none;
            padding: 12px;
            cursor: pointer;
            border-radius: 4px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/min/moment.min.js"></script>

    <script>
        function showForm(action) {
            var forms = document.getElementsByName("actionForm");
            for (var i = 0; i < forms.length; i++) {
                forms[i].style.display = "none";
            }
            document.getElementById(action + "Form").style.display = "block";
        }

    </script>
</head>
<body>

<h2>假期管理</h2>

<%
    String action = request.getParameter("action");

    if (action != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
            String user = "root";
            String password = "123456";
            Connection conn = DriverManager.getConnection(url, user, password);

            switch (action) {
                case "add":
                    String holidayYear = request.getParameter("holidayYear");
                    String holidayname = request.getParameter("holidayname");
                    String beginDate = request.getParameter("beginDate");
                    String endDate = request.getParameter("endDate");

                    String addSql = "INSERT INTO holiday (holidayYear, holidayname, beginDate, endDate) VALUES (?, ?, ?, ?)";
                    PreparedStatement addPstmt = conn.prepareStatement(addSql);
                    addPstmt.setString(1, holidayYear);
                    addPstmt.setString(2, holidayname);
                    addPstmt.setString(3, beginDate);
                    addPstmt.setString(4, endDate);

                    addPstmt.executeUpdate();
                    addPstmt.close();
                    break;

                case "update":
                    int updateId = Integer.parseInt(request.getParameter("updateId"));
                    String updateYear = request.getParameter("updateYear");
                    String updatename = request.getParameter("updatename");
                    String updateBeginDate = request.getParameter("updateBeginDate");
                    String updateEndDate = request.getParameter("updateEndDate");

                    String updateSql = "UPDATE holiday SET holidayYear=?, holidayname=?, beginDate=?, endDate=? WHERE id=?";
                    PreparedStatement updatePstmt = conn.prepareStatement(updateSql);
                    updatePstmt.setString(1, updateYear);
                    updatePstmt.setString(2, updatename);
                    updatePstmt.setString(3, updateBeginDate);
                    updatePstmt.setString(4, updateEndDate);
                    updatePstmt.setInt(5, updateId);

                    updatePstmt.executeUpdate();
                    updatePstmt.close();
                    break;

                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("deleteId"));
                    String deleteSql = "DELETE FROM holiday WHERE id=?";
                    PreparedStatement deletePstmt = conn.prepareStatement(deleteSql);
                    deletePstmt.setInt(1, deleteId);

                    deletePstmt.executeUpdate();
                    deletePstmt.close();
                    break;
            }

            conn.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/studentdb?serverTimezone=UTC";
        String user = "root";
        String password = "123456";
        Connection conn = DriverManager.getConnection(url, user, password);

        String sql = "SELECT * FROM holiday";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>

<div class="action-buttons">
    <button onclick="showForm('add')">添加假期</button>
    <button onclick="showForm('update')">修改假期</button>
    <button onclick="showForm('delete')">删除假期</button>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>年份</th>
        <th>假期</th>
        <th>开始时间</th>
        <th>结束时间</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("holidayYear") %></td>
        <td><%= rs.getString("holidayname") %></td>
        <td><%= rs.getString("beginDate") %></td>
        <td><%= rs.getString("endDate") %></td>
    </tr>
    <%
        }
    %>
</table>

<%
        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }
%>

<form action="holiday_management.jsp" method="post" name="actionForm" id="addForm">
    <h3>添加假期</h3>
    <div>
        <label for="holidayYear">年份:</label>
        <input type="text" id="holidayYear" name="holidayYear" required>
    </div>
    <div>
        <label for="holidayname">假期</label>
        <input type="text" id="holidayname" name="holidayname" required>
    </div>
    <div>
        <label for="beginDate">开始时间:</label>
        <input type="datetime-local" id="beginDate" name="beginDate" required>
    </div>
    <div>
        <label for="endDate">结束时间:</label>
        <input type="datetime-local" id="endDate" name="endDate" required>
    </div>
    <div>
        <input type="hidden" name="action" value="add">
        <input type="submit" value="添加假期">
    </div>
</form>

<form action="holiday_management.jsp" method="post" name="actionForm" id="updateForm">
    <h3>修改假期</h3>
    <div>
        <label for="updateId">ID:</label>
        <input type="text" id="updateId" name="updateId" required>
    </div>
    <div>
        <label for="updateYear">年份:</label>
        <input type="text" id="updateYear" name="updateYear" required>
    </div>
    <div>
        <label for="updatename">假期名称</label>
        <input type="number" id="updatename" name="updatename" required>
    </div>
    <div>
        <label for="updateBeginDate">开始时间:</label>
        <input type="text" id="updateBeginDate" name="updateBeginDate" required>
    </div>
    <div>
        <label for="updateEndDate">结束时间:</label>
        <input type="text" id="updateEndDate" name="updateEndDate" required>
    </div>
    <div>
        <input type="hidden" name="action" value="update">
        <input type="submit" value="修改假期">
    </div>
</form>

<form action="holiday_management.jsp" method="post" name="actionForm" id="deleteForm">
    <h3>删除假期</h3>
    <div>
        <label for="deleteId">ID:</label>
        <input type="text" id="deleteId" name="deleteId" required>
    </div>
    <div>
        <input type="hidden" name="action" value="delete">
        <input type="submit" value="删除假期">
    </div>
</form>

</body>
</html>
