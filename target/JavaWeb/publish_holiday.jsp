<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布假期时间</title>
    <% if (request.getAttribute("message") != null) { %>
    <div class="alert alert-info" role="alert"><%= request.getAttribute("message") %></div>
    <% } %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<form action="publish_holiday" method="post">
    <input type="hidden" name="action" value="publish">
    <div class="mb-3">
        <label for="holidayYear" class="form-label">放假年份</label>
        <input type="text" class="form-control" id="holidayYear" name="holidayYear" placeholder="请输入放假年份" required>
    </div>
    <div class="mb-3">
        <label for="holidayname" class="form-label">假期名称</label>
        <input type="text" class="form-control" id="holidayname" name="holidayname" placeholder="请输入假期名称" required>
    </div>
    <div class="mb-3">
        <label for="beginDate" class="form-label">假期开始时间</label>
        <input type="datetime-local" class="form-control" id="beginDate" name="beginDate" required>
    </div>
    <div class="mb-3">
        <label for="endDate" class="form-label">假期结束时间</label>
        <input type="datetime-local" class="form-control" id="endDate" name="endDate" required>
    </div>
    <div class="mb-3">
        <input type="submit" class="btn btn-primary" value="发布假期">
    </div>
</form>
</body>
</html>
