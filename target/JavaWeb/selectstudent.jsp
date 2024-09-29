<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/30
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看学生信息</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/2.0.5/FileSaver.min.js"></script>
    <script src="./js/areas.js"></script>
</head>
<body>
<table class="table">
    <tr>
        <th><button id="exportBtn">导出数据</button></th>
    </tr>
<thead>
    <tr>
        <th>班级</th>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话</th>
        <th>紧急联系人</th>
        <th>紧急联系人电话</th>
        <th>去向地址</th>
        <th>数据操作</th>
    </tr>

<script>
    document.getElementById('exportBtn').addEventListener('click', function() {
        var tableData = [];
        var rows = document.querySelectorAll('table tr');
        for (var i = 1; i < rows.length; i++) {
            var rowData = [];
            var cells = rows[i].querySelectorAll('td, th');
            for (var j = 0; j < cells.length; j++) {
                rowData.push(cells[j].innerText);
            }
            tableData.push(rowData);
        }


        var workbook = XLSX.utils.book_new();
        var worksheet = XLSX.utils.aoa_to_sheet(tableData);
        XLSX.utils.book_append_sheet(workbook, worksheet, 'Sheet1');


        XLSX.writeFile(workbook, '学生信息.xlsx');
    });
    function deleteData(num) {
        var confirmed = confirm("确认删除该数据吗？！！");
        if (confirmed) {
            window.location.href = "<%=request.getContextPath()%>/delete?num=" + num;
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
            String sql="select * from t_student s, t_class c where s.classID=c.id";
            ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){

    %>
    <tbody>
    <tr>
        <td><%=rs.getString("c.name") %></td>
        <td><%=rs.getString("num") %></td>
        <td><%=rs.getString("name") %></td>
        <td><%=rs.getString("gender") %></td>
        <td><%=rs.getString("tel") %></td>
        <td><%=rs.getString("emerpeople") %></td>
        <td><%=rs.getString("emertel") %></td>
        <td><%=rs.getString("province")+ rs.getString("city")+rs.getString("village")%></td>
        <td>
        <button onclick="deleteData('<%=rs.getString("num") %>')">删除</button>
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
<script>
    region_init("select_province","select_city","select_area");
</script>

</body>
</html>
