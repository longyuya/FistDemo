<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2023/11/16
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="loginstyle.css">
    <script type="text/javascript" src="js/jquery-3.7.1.js"></script>

</head>
<body>
<form method="post" action="<%=request.getContextPath()%>/LoginServlet">
    <input type="hidden" name="action" value="Login">
<div class="box">
    <h2>Login</h2>
    <div class="input-box">
        <table>
            <tr>
                <td>账号</td>
                <td><input name="username" type="text" id="username" placeholder="请输入账号" required></td>
            </tr>
        </table>
    </div>
    <div class="input-box">
        <table>
            <tr>
        <td>密码</td>
        <td><input name="pwd" type="password" id="pwd" placeholder="请输入密码" required></td>
            </tr>
        </table>
    </div>

    <div class="btn-box">
        <div>

                <button type="submit" value="login" style="width:120px;
                height:35px;
                color:rgba(255,255,255,0.9);
                border:1px solid rgba(192, 119, 91, 0.7);
                background:rgba(192, 119, 91, 0.5);
                font-size:14px;
                border-radius:5px;
                outline:none;">
                    登录
                </button>
                <button type="reset" class="clear" style="width:120px;
                height:35px;
                margin-left:10px;
                color:rgba(255,255,255,0.9);
                border:1px solid rgba(192, 119, 91, 0.7);
                background:rgba(192, 119, 91, 0.5);
                font-size:14px;
                border-radius:5px;
                outline:none;">
                    清除
                </button>
        </div>
    </div>

</div>
<script>

</script>
</form>
</body>
</html>
