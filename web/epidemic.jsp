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
    <script src="${pageContext.request.contextPath}/echarts/echarts.js" type="text/javascript"></script>
</head>
<body id="body1">
    <div class="container">
        <div class="row" style="height: 600px; margin-bottom: 15px;">
            <div class="col-md-12" style="background-color:#fff;margin-top: 5px">
                <div id="myMap" style="height:600px;"></div>
            </div>
        </div>
        <div class="row" style="height: 400px; overflow: auto" >
            <div class="col-md-12" style="background-color: white">
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
                    <tbody id="tbody1"></tbody>
                </table>
            </div>
        </div>
        <div class="row" style="margin-top: 5px">
            <div class="col-md-12">
                <div id="mycharts" style="height: 500px; border: 1px solid gray; background-color:white;"></div>
            </div>
        </div>
        <div class="row" style="margin-top: 15px">
            <div class="col-md-2 col-md-offset-2">
                <a href="login.jsp" class="btn btn-primary">登录</a>
            </div>
        </div>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">

        //初始化图表Echarts
        var myCharts=echarts.init($("#mycharts").get(0));
        var myMap=echarts.init(document.getElementById("myMap"));
        $(function () {
            //发送请求获取数据
            $.get("${pageContext.request.contextPath}/epidemicData/ajax/latestData",{},function (response) {
                console.info(response);
                if(response.code<0){
                    alert(response.msg)
                }else {
                    fillToTable(response.data);
                    fillToChart(response.data);
                }
            },"json");
        });
        //填充装载数据的表格
        function fillToTable(epidemics) {
            let tbody1=$("#tbody1");
            tbody1.empty();
            $.each(epidemics,function (index,epidemic) {
                let tr=$("<tr>");
                let td=$("<td>");
                td.text(epidemic.provinceName);
                tr.append(td);

                td=$("<td>");
                td.html(""+epidemic.affirmedTotal+"<span class='small''>+"+epidemic.affirmed+"</span>");
                tr.append(td);

                td=$("<td>");
                td.html(""+epidemic.suspectedTotal+"<span class='small'>+"+epidemic.suspected+"</span>");
                tr.append(td);

                td=$("<td>");
                td.html(""+epidemic.isolatedTotal+"<span class='small'>+"+epidemic.isolated+"</span>");
                tr.append(td);

                td=$("<td>");
                td.html(""+epidemic.curedTotal+"<span class='small'>+"+epidemic.cured+"</span>");
                tr.append(td);

                td=$("<td>");
                td.html(""+epidemic.deadTotal+"<span class='small'>+"+epidemic.dead+"</span>");
                tr.append(td);

                tbody1.append(tr);
            })
        }
        //将服务器端返回的数据设置到图表上
        function fillToChart(epidemics) {
            let provinceNames=[];
            let affirmedTotals=[];
            let dataYear=epidemics[0].dataYear;
            let dataMonth=epidemics[0].dataMonth;
            let dataDay=epidemics[0].dataDay;
            let date=dataYear+'-'+dataMonth+'-'+dataDay;
            let data=[];
            $.each(epidemics,function (index,epidemic) {
                provinceNames.push(epidemic.provinceName);
                affirmedTotals.push(epidemic.affirmedTotal);
                var obj = {};
                obj.name = epidemic.provinceName;
                obj.value = epidemic.affirmedTotal;
                data.push(obj);
            });
            let option={
                title:{
                    //标题
                    text:"当日全国疫情柱状图",
                    //副标题
                    subtext: date
                },
                legend:{//图例
                    data:[date]
                },
                tooltip:{//触发类型trigger:'item'/'axis'/'none'
                    trigger:'item'
                },
                xAxis:{
                    data:provinceNames
                },
                yAxis:{//最大刻度值 max:200
                    max:2000
                },
                series:[{
                    type:'bar',
                    name: date,
                    data: affirmedTotals
                }]
            };
            myMap.setOption({
                title:{
                    subtext: date
                },
                series: [
                    {
                        name: '累计确诊人数',
                        type: 'map',
                        mapType: 'china',
                        data: data
                    }
                ]
            });
            myCharts.setOption(option);
        }
        //获取地图JSON数据，显示中国地图
        $.get("${pageContext.request.contextPath}/echarts/china.json",{},function (chinaJson) {
            echarts.registerMap("china",chinaJson);
            let option={
                title: {
                    text: "全国确诊人数"
                },
                legend: {
                    data: ["累计确诊人数"]
                },
                tooltip: {},
                visualMap: {
                    type: 'piecewise',
                    min: 0,
                    max: 10000,
                    splitList: [{
                        start: 2000,
                        end: 100000
                    }, {
                        start: 1000,
                        end: 2000
                    }, {
                        start: 500,
                        end: 1000
                    }, {
                        start: 100,
                        end: 500
                    }, {
                        start: 0,
                        end: 100
                    }],
                    textStyle: {
                        color: 'orange'
                    }
                },
                series:[{
                  name:"累计确诊人数",
                  type:'map',
                  mapType:'china',
                  data:[]
                }]
            };
            myMap.setOption(option);
        },"json");
    </script>
</body>
</html>
