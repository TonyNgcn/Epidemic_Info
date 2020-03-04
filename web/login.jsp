<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/2/26
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>
    <style type="text/css">
        #body1{
            background-color: #10AEB5;
        }
    </style>
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/bootstrap/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body id="body1">

<div id="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div style="height: 200px"></div>
            <h1>登录系统</h1>
            <form action="${pageContext.request.contextPath}/user/login" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-md-2 control-label" for="account">账号：</label>
                    <div class="col-md-8"><input type="text" name="account" id="account" class="form-control"></div>
                </div>
                <div class="form-group">
                    <label class="col-md-2 control-label" for="password">密码：</label>
                    <div class="col-md-8"><input type="password" name="password" id="password" class="form-control"></div>
                </div>
                <div class="form-group">
                    <div class="col-md-4 col-md-offset-2">
                        <input type="submit" value="登录" class="btn btn-primary">
                    </div>
                </div>
            </form>
        </div>

        <c:if test="${not empty msg}">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert">
                            <span>&times;</span>
                        </button>
                            ${msg}
                    </div>
                </div>
            </div>
        </c:if>


    </div>

</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>


