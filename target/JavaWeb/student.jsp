<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//cdn.staticfile.org/layui/2.8.18/css/layui.css" rel="stylesheet">
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">学生端</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide layui-show-sm-inline-block">
                <a href="exit.jsp">退出</a>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">学生信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="loadPage('DestinationRegistrationServlet.jsp')">填表</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('view_history.jsp')">查看历史</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('change_password.jsp')">密码修改</a></dd>

                    </dl>
                </li>

            </ul>
        </div>
    </div>
    <div class="layui-body">
        <div style="padding: 15px;">
            <div class="layui-card layui-panel">
                <div class="layui-card-header">学生信息</div>
                <div class="layui-card-body" style="display: flex;flex-direction: column;height: 100vh">
                    <iframe id="main" name="main" style="width: 100%;height: auto;flex-grow: 1"></iframe>
                </div>
            </div>
            <br><br>
        </div>
    </div>
</div>

<script src="//cdn.staticfile.org/layui/2.8.18/layui.js"></script>
<script>
    function loadPage(page) {
        document.getElementById('main').src = page;
    }
</script>

</body>
</html>
