<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>假期去向登记</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   <link href="//cdn.staticfile.org/layui/2.8.18/css/layui.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
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

        form {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-check-input {
            margin-top: 8px;
        }

        .mb-3 {
            margin-bottom: 20px;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
    <script src="//cdn.staticfile.org/layui/2.8.18/layui.js"></script>

    <script src="./js/jquery-3.7.1.js"></script>
    <script src="./dist/js/city-picker.data.js"></script>
    <script src="./dist/js/city-picker.js"></script>
    <link rel="stylesheet" type="text/css" href="./dist/css/city-picker.css"/>
</head>
<body>
<div class="container">
    <h2>假期去向登记</h2>

    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-info" role="alert"><%= request.getAttribute("message") %></div>
    <% } %>

    <form action="dest_registration" method="post">
        <input type="hidden" name="action" value="registerDest">

        <div class="mb-3">
            <label class="form-label">学号</label>
            <input type="text" class="form-control" name="num" placeholder="请输入学号" required>
        </div>
        <div class="mb-3">
            <label class="form-label">姓名</label>
            <input type="text" class="form-control" name="name" placeholder="请输入姓名" required>
        </div>
        <div class="mb-3">
            <label class="form-label">性别</label>
            <input type="text" class="form-control" name="gender" placeholder="请输入性别男或者女" required>
        </div>
        <div class="mb-3">
            <label class="form-label">联系电话</label>
            <input type="text" class="form-control" name="tel" placeholder="请输入联系电话" required>
        </div>
        <div class="mb-3">
            <label class="form-label">紧急联系人</label>
            <input type="text" class="form-control" name="emerpeople" placeholder="请输入紧急联系人" required>
        </div>
        <div class="mb-3">
            <label class="form-label">紧急联系人电话</label>
            <input type="text" class="form-control" name="emertel" placeholder="请输入紧急联系人电话" required>
        </div>
        <div class="mb-3">
            <label class="form_label">班级编号</label>
            <input type="text" class="form-control" id="classID" name="classID" placeholder="请输入班级编号" required>
        </div>
        <div class="mb-3">
            <label class="form_label">省份</label>
            <div data-role="controlgroup" data-ajax="false">
                <select type="text" id="select_province" name="province" value="region_init('select_province')"></select>
            </div>
        </div>
        <div class="mb-3">
            <label class="form_label">市州</label>
            <div data-role="controlgroup" data-ajax="false">
                <select type="text" id="select_city" name="city" value="region_init('select_city')"></select>
            </div>
        </div>
        <div class="mb-3">
            <label class="form_label">乡镇</label>
            <div data-role="controlgroup" data-ajax="false">
                <select type="text" id="select_area" name="village" value="region_init('select_area')"></select>
            </div>
        </div>
        <script src="./js/areas.js"></script>

        <div class="mb-3">
            <label class="form-label">交通工具</label>
            <input type="text" class="form-control" name="vehicle" placeholder="请输入乘坐的交通工具" required>
        </div>

        <div class="mb-3">
            <label class="form-label">是否离校</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="lixiao" value="离校" checked>
                <label class="form-check-label">是</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="lixiao" value="不离校">
                <label class="form-check-label">否</label>
            </div>
        </div>

        <div class="mb-3">
            <input type="submit" class="btn btn-primary" value="提交登记">
        </div>
    </form>
</div>


<script type="text/javascript">
    $(function () {
        $('#leaveDatePicker').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: false
        });
    });
</script>
<script>
    region_init("select_province","select_city","select_area");
</script>
</body>
</html>
