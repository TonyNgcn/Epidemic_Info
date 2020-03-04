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
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/bootstrap/js/html5shiv.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .logo{
            height: 79px;
            background-image: url('${pageContext.request.contextPath}/img/logo.png');
            background-repeat: no-repeat;
            font-size: 42px;
            font-family: "微软雅黑","黑体","楷体","宋体",Arial;
            color: orange;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row" style="background-color: #006AC2; margin-bottom: 3px">
            <div class="col-md-6 logo">
                疫情数据发布系统
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="panel-group" id="menu">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#menu" href="#div1">
                                    数据管理
                                </a>
                            </h4>
                        </div>
                        <div id="div1" class="panel-collapse in">
                            <div class="list-group">
                                <a href="#" class="list-group-item">数据录入</a>
                                <a href="#" class="list-group-item">数据查询</a>
                                <a href="#"class="list-group-item">图表</a>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#menu"
                                   href="#div2">系统管理</a>
                            </h4>
                        </div>
                        <div id="div2" class="panel-collapse collapse">
                            <div class="list-group">
                                <a href="#" class="list-group-item">录入用户</a>
                                <a href="#" class="list-group-item">查询用户</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">

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
