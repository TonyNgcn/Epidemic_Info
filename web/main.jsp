<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/2/26
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>疫情发布系统后台管理</title>
    <jsp:include page="template/bootstrap_common.jsp"/>
</head>
<body>
    <div class="container">
        <jsp:include page="template/top.jsp"/>
        <div class="row">
            <jsp:include page="template/menu.jsp"/>
            <div class="col-md-9">
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/main.jsp">主页</a></li>
                    <li class="active">后台主页</li>
                </ol>
                这是主页的内容
            </div>
        </div>
        <div class="row">

        </div>

    </div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>
