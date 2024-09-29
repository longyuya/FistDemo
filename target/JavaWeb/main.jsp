<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/3
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*,java.util.*,java.lang.String,com.servlet.Student,com.servlet.StudentServlet" contentType="text/html; charset=GBK"
        pageEncoding="GBK"%>
<html>
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>班级数据查询</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
        <a class="navbar-brand" href="#">数据详情</a>
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>">数据添加 <span class="sr-only"></span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="KaiFazhong();">待开发~</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="KaiFazhong();">待开发~</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">搜索</button>
        </form>
    </div>
</nav>
<table class="table table-striped">
    <thead>
    <tr>
        <td>序号</td>
        <td>姓名</td>
        <td>年龄</td>
        <td>出生年份</td>
        <td>辅导员</td>
        <td>院系</td>
        <td>学号</td>
        <td>创建时间</td>
        <td>修改时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <%
        List<Student> datas = (List<Student>)request.getAttribute("students");
        int i= 0;
        if(datas != null){

            for(Student st:datas){
                ++i;
    %>
    <tr>
        <td><%=i %></td>
        <td><%=st.getName() %></td>
        <td><%=st.getAge()%></td>
        <td><%=st.getYear() %></td>
        <td><%=st.getFudaoyuan() %></td>
        <td><%=st.getDepart() %></td>
        <td><%=st.getNumid() %></td>
        <td><%=st.getCreate_time() %></td>
        <td><%=st.getUpdate_time() %></td>
        <td><a href="<%=request.getContextPath()%>/student?action=delete&id=<%=st.getId()%>" onclick="return confirmDelete();">删除</a>
        <a href="#" onclick="KaiFazhong();">修改</a></td>
    </tr>
    <script>
        function confirmDelete() {
            return confirm("确认删除该数据吗？！！");
        }

        function KaiFazhong(){
            return confirm("慢慢摸索中捏~~");
        }
    </script>
    <%
            }
        }
    %>
</table>

</body>
</html>