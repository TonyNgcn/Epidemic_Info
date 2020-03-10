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
                <div class="col-md-4">
                    <div class="input-group date" id="datepicker" data-date-format="yyyy-mm-dd">
                        <div class="input-group-addon">数据日期</div>
                        <input class="form-control" size="16" type="text" value="" readonly id="dataDate">
                        <div class="input-group-addon">
                            <span class="add-on glyphicon glyphicon-calendar"></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <button type="button" class="btn btn-primary" id="btnSubmit">提交<span class="glyphicon glyphicon-log-in"></span></button>
                </div>
            </div>
            <div class="row">
                <table class="table table-striped table-bordered table-hover">
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
                    <tbody id="tbody1">
                    <td>湖北</td>
                    <td><input type="text" name="affirmed" size="5" maxlength="5" class="form-control"></td>
                    <td><input type="text" name="suspected" size="5" maxlength="5" class="form-control"></td>
                    <td><input type="text" name="isolated" size="5" maxlength="5" class="form-control"></td>
                    <td><input type="text" name="cured" size="5" maxlength="5" class="form-control"></td>
                    <td><input type="text" name="dead" size="5" maxlength="5" class="form-control"></td>
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div id="msg"></div>
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
        //设置日期输入框的初始值和取值范围
        var provinces=null;
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
        //给日期选择框设置事件处理函数
        dp.datepicker().on("changeDate",loadProvinceList);
        //装载省份列表
        loadProvinceList();
        //给提交按钮绑定事件处理函数
        $("#btnSubmit").click(checkAndSubmitData);


    });
    function loadProvinceList() {
        //获取日期文本框中的值
        let date=$("#dataDate").val();

        //从服务器中获取未录入数据的省份列表
        $.get("${pageContext.request.contextPath}/province/ajax/noDataList",{date:date},function(response) {
            if(response.code<0){
                alert(response.msg);
            }else {
                fillProvinceToTable(response.data);
            }
        },"json")
    };
    function fillProvinceToTable(array) {
        //清空消息
        let msg=$("#msg");
        msg.html("");
        //清空表格
        let tbody1=$("#tbody1");
        tbody1.empty();
        if(array && array.length>0){
            provinces=array;
            //填充表格
            $.each(provinces,function (index,province) {
                let tr=$("<tr>");
                let td=$("<td>");
                td.text(province.provinceName);
                tr.append(td);

                td=$("<td>");
                td.html('<input type="text" name="affirmed" size="5" maxlength="5" class="form-control" value="0">');
                tr.append(td);
                td=$("<td>");
                td.html('<input type="text" name="suspected" size="5" maxlength="5" class="form-control" value="0">');
                tr.append(td);
                td=$("<td>");
                td.html('<input type="text" name="isolated" size="5" maxlength="5" class="form-control" value="0">');
                tr.append(td);
                td=$("<td>");
                td.html('<input type="text" name="cured" size="5" maxlength="5" class="form-control" value="0">');
                tr.append(td);
                td=$("<td>");
                td.html('<input type="text" name="dead" size="5" maxlength="5" class="form-control" value="0">');
                tr.append(td);

                tbody1.append(tr);
            });
        }else{
            msg.html("本日所有省份已录入数据");
        }
    }
    function checkAndSubmitData() {
        let valid=true;
        let affirmed=$("input[name=affirmed]");
        let suspected=$("input[name=suspected]");
        let isolated=$("input[name=isolated]");
        let cured=$("input[name=cured]");
        let dead=$("input[name=dead]");
        //判断数据是否合法
        affirmed.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid=false;
            }
        });
        suspected.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid=false;
            }
        });
        isolated.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid=false;
            }
        });
        cured.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid=false;
            }
        });
        dead.each(function (index,element) {
            if(isNaN(Number(element.value))){
                valid=false;
            }
        });
        if(valid){
            //可以提交
            let dataArray=[];
            for(let i=0;i<provinces.length;i++){
                let obj={};
                obj.provinceId=provinces[i].provinceId;
                obj.affirmed=affirmed.get(i).value;
                obj.suspected=suspected.get(i).value;
                obj.isolated=isolated.get(i).value;
                obj.cured=cured.get(i).value;
                obj.dead=dead.get(i).value;

                dataArray.push(obj);
            }
            let date=$("#dataDate").val();
            let data={};
            data.date=date;
            data.array=dataArray;
            console.info(data);
            $.ajax({
                url:"${pageContext.request.contextPath}/epidemicData/ajax/input",
                type:"POST",
                contentType:"application/json",
                data:JSON.stringify(data),
                dataType:'json',
                success:function (response) {
                    if(response.code<0){
                        //有错误
                        alert(response.msg);
                    }
                    else{
                        fillProvinceToTable(response.data);
                    }
                }
            })

        }else{
            alert("请检查你的输入，确保输入正确的数据！");
        }
    }
</script>
</body>
</html>
