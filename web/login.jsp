<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/2/26
  Time: 17:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/bootstrap/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<h1>登录系统</h1>
<div id="container">
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        账号：<input type="text" name="account"><br>
        密码：<input type="password" name="password"><br>
        <input type="submit" value="登录">
    </form>
    ${msg}
</div>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>


