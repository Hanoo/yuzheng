<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>数据汇总</title>

    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/style/js/easyui/themes/black/easyui.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/js/easyui/themes/icon.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.easyui.min.js"></script>


</head>
<body class="body01">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/customdatagrid.css"/>

<jsp:include page="head.jsp"/>
<!-----主体 开始------>

<div class="main" style="margin-left: 240px">

    <table class="easyui-datagrid"
           style="  width:1200px;height:560px; align:'center'"
           data-options="rownumbers:true,singleSelect:true,url:'/toJkxx',method:'get'">
        <thead>
        <tr style="height:40px ;align:'center'">
            <th colspan="7"><h2>监狱实时监控信息表</h2></th>
        </tr>
        <tr>
            <th data-options="field:'itemid',width:200"></th>
            <th colspan="2" data-options="field:'itemid',width:380,align:'center'">民警出勤数/民警总数</th>
            <th colspan="2" data-options="field:'productid',width:380,align:'center' ">现场人数/押犯总数</th>
            <th colspan="2" data-options="field:'code',width:190,align:'center'">总值班：${zzbr}</th>
        </tr>
        <tr>
            <th data-options="field:'name',width:150">监区</th>
            <th data-options="field:'realCount',width:150">出勤数</th>
            <th data-options="field:'planCount',width:150">干警总数</th>
            <th data-options="field:'value',width:150">出工人数</th>
            <th data-options="field:'pcount',width:150">押犯总人数</th>
            <th data-options="field:'caption',width:180">带班长</th>
            <th data-options="field:'xh',width:230">联系电话</th>
        </tr>
        </thead>
    </table>
</div>


<!-----主体 结束------>
<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p>
</div>


</body>
</html>