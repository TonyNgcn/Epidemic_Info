<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/3/7
  Time: 0:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" style="background-color: #006AC2; margin-bottom: 3px">
    <div class="col-md-6 logo">
        疫情数据发布系统
    </div>
    <div class="col-md-2 col-md-offset-4">
        <p>欢迎你:<span class="label label-info">${loginedUser.userName}</span></p><br>
        <a href="${pageContext.request.contextPath}/user/logout" class="btn btn-danger">退出系统</a>
    </div>
</div>