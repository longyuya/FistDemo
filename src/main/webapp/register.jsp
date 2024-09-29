<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>发布假期时间</title>
  <% if (request.getAttribute("message") != null) { %>
  <div class="alert alert-info" role="alert"><%= request.getAttribute("message") %></div>
  <% } %>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-datetime-picker@4.17.47/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap-datetime-picker@4.17.47/build/js/bootstrap-datetimepicker.min.js"></script>
</head>
<body>
<form action="publish_holiday" method="post">
  <input type="hidden" name="action" value="publish">
  <div class="mb-3">
    <label for="holidayYear" class="form-label">年份</label>
    <input type="text" class="form-control" id="holidayYear" name="holidayYear" placeholder="请输入年份" required>
  </div>
  <div class="mb-3">
    <label for="holidayV" class="form-label">假期名称</label>
    <input type="text" class="form-control" id="holidayV" name="holidayV" placeholder="请输入假期名称" required>
  </div>
  <div class="mb-3">
    <label for="beginDate" class="form-label" id="begindate">假期开始时间</label>

    <div class="input-group date" id="beginDatePicker" data-target-input="nearest">
      <input type="text" class="form-control datetimepicker-input" data-target="#beginDatePicker" name="beginDate" required/>
      <div class="input-group-append" data-target="#beginDatePicker" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
      </div>
    </div>
  </div>
  <div class="mb-3">
    <label for="endDate" class="form-label" id="enddate">假期结束时间</label>
    <div class="input-group date" id="endDatePicker" data-target-input="nearest">
      <input type="text" class="form-control datetimepicker-input" data-target="#endDatePicker" name="endDate" required/>
      <div class="input-group-append" data-target="#endDatePicker" data-toggle="datetimepicker">
        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
      </div>
    </div>
  </div>
  <div class="mb-3">
    <input type="submit" class="btn btn-primary" value="发布假期">
  </div>
</form>

<script type="text/javascript">
  $(function () {
    $('#beginDatePicker, #endDatePicker').datetimepicker({
      format: 'YYYY-MM-DD HH:mm:ss',
      useCurrent: false
    });
  });
</script>

</body>
</html>
