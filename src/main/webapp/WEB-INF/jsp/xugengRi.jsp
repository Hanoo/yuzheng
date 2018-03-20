<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>巡更系统</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <STYLE TYPE="text/css">
        <!--
        <%--BODY {--%>
        <%--background-image: URL(<%=request.getContextPath()%>/style/images/ri03.jpg);--%>
        <%--background-position: left;--%>
        <%--background-repeat: no-repeat;--%>
        <%--background-attachment: scroll;--%>

        <%--}--%>
        #backgroundImage {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
        }

        -->
    </STYLE>
</head>
<body class="body01">
<!-----head 开始------>
<jsp:include page="head.jsp"/>
<div class="main"></div>
<div class="nav" style="margin-top:30px;">
    <ul>
        <li class="nico01"><a href="###" onclick="choose(1)">首页</a></li>
        <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
        <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
        <li class="nico04on" onclick="choose(5)">巡更系统</li>
        <li class="nico05"><a href="###" onclick="choose(6)">数据汇总</a></li>
    </ul>
</div>
<div style="float: left;"></div>
<div style="width:900px; height: 550px; float:left; margin-left: 160px;overflow: hidden;padding: 5px;">
    <img alt="" src="../../style/images/ri04.png" style="width: 900px;height: 540px;"/>
</div>

<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p></div>
</body>
</html>