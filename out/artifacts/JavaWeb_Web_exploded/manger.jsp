<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主界面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//cdn.staticfile.org/layui/2.8.18/css/layui.css" rel="stylesheet">
    <link href="./layui/css/layui.css" rel="stylesheet">
</head>
<body>

<script src="//cdn.staticfile.org/layui/2.8.18/layui.js"></script>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">管理员端</div>
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
                        <dd><a href="javascript:void(0);" onclick="loadPage('selectstudent.jsp')">查看学生信息</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('add_student.jsp')">添加学生信息</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('update_student.jsp')">修改学生信息</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">假期管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="loadPage('publish_holiday.jsp')">假期发布</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('holiday_management.jsp')">假期管理</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('student_history.jsp')">学生填写记录</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">班级管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="loadPage('selectclass.jsp')">查看班级</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('add_class.jsp')">添加班级</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">去向</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="loadPage('findstudent.jsp')">去向查询</a></dd>
                        <dd><a href="javascript:void(0);" onclick="loadPage('tongji.jsp')">去向统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">个人信息</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:void(0);" onclick="loadPage('change_password.jsp')">个人密码修改</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <div style="padding: 15px;">
            <div class="layui-card layui-panel">
                <div class="layui-card-header">假期去向登记表</div>
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
