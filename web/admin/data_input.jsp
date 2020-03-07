<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/3/7
  Time: 1:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情数据录入</title>
    <jsp:include page="../template/bootstrap_common.jsp"/>
    <link rel="stylesheet" type="text/css" href="../bootstrap/datepicker/bootstrap-datepicker3.css">
   </head>
<body>
<div class="container">
    <jsp:include page="../template/top.jsp"/>
    <div class="row">
        <jsp:include page="../template/menu.jsp"/>
        <div class="col-md-9">
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/main.jsp">主页</a></li>
                <li class="active">数据录入</li>
            </ol>
            <div class="row">
                <div class="form-group">
                    <div class="input-group date col-md-4" id="datepicker" data-date-format="yyyy-mm-dd">
                        <div class="input-group-addon">数据日期</div>
                        <input class="form-control" size="16" type="text" value="" readonly>
                        <div class="input-group-addon">
                            <span class="add-on glyphicon glyphicon-calendar"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

    </div>

</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.zh-CN.min.js"></script>

<script type="text/javascript">
    $(function () {
        let dp=$("#datepicker");
        dp.datepicker({
            language:"zh-CN",
            autoclose: true,
            todayBtn: true
        });
        let currentDate=new Date();
        dp.datepicker("setDate",currentDate);
        let startDate=new Date();
        startDate.setDate(currentDate.getDate()-31);
        dp.datepicker("setStartDate",startDate);
        dp.datepicker("setEndDate",currentDate);
    });
</script>
</body>
</html>
