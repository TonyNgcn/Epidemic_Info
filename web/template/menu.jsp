<%--
  Created by IntelliJ IDEA.
  User: Tony Ng
  Date: 2020/3/7
  Time: 0:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <a href="${pageContext.request.contextPath}/admin/data_input.jsp" class="list-group-item">数据录入</a>
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