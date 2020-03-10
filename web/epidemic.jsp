<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/2/24
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>疫情信息</title>
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
    <div class="container">
        <div class="row" style="height: 500px">
            ditu
        </div>
        <div class="row" style="height: 400px;">
            <div class="col-md-12">
                <table class="table table-hover table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>省份</th>
                            <th>确诊人数</th>
                            <th>疑似人数</th>
                            <th>隔离人数</th>
                            <th>治愈人数</th>
                            <th>死亡人数</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <div class="row">
            <a href="login.jsp" class="btn btn-primary">登录</a>
        </div>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            //发送请求获取数据
            $.get("${pageContext.request.contextPath}/epidemicData/ajax/latestData",{},function (response) {
                console.info(response);

            },"json");

        });
    </script>
</body>
</html>
