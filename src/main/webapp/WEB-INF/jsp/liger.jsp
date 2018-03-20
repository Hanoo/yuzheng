<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/echarts.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/scroll.js"></script>

    <script type="text/javascript">

        /**页面初始化方法*/
        $(document).ready(function () {
            // 获取巡更分析
            $("#xgul").scrollQ();
        });

        /**
         * 定时刷新数据
         * */
        function refData() {
            /*
             * 获取警力分析数据
             * */

            $.ajax({
                type: 'POST',
                url: '/getFxryInfo',
                success: function (data) {
                    var d = eval("(" + data + ")");
                    $("#jfyd").html(d['ydNum']);
                    $("#jfsd").html(d['sdNum']);
                    $("#jfwd").html(d['wdNum']);

                    $("#jlsd").html(d["jlsd"]);
                    $("#jlyd").html(d["jlyd"]);
                    $("#jlwd").html(d["jlwd"]);
                },
                error: function () {
                    alert("获取数据失败，请保证网络畅通!");
                }
            })

            /***
             * 获取各个监区情况
             */

            $.ajax({
                type: 'POST',
                url: '/getJianQuFenBu',
                success: function (data) {
                    var d = eval(data);
                    $.each(d, function (index, entry) {
                        var idx = index + 1;
                        //  实际警力
                        var realCount = entry['realCount'];
                        // 实际服刑
                        var value = entry['value'];

                    })
                },
                error: function () {
                    alert("获取数据失败，请保证网络畅通!");
                }
            })
        }

        function refXunGeng() {
            /*
             * 获取巡更分析列表数据
             * */
            $.ajax({
                type: 'POST',
                url: '/toXGfenxiJosn',
                success: function (data) {
                    var result = eval(data);
                    $("#xgsjd").html("【" + result['xgsjd'] + "】");
                    $.each(result['dataList'], function (index, entry) {
                        $("#xgul").append("<li><span class='whites'>【" + entry["addrName"] + "】</span><span class='reds'>→ 预警！未准时巡更</span></li>");
                    })

                }
            })
        }


    </script>
</head>
<body class="body01">
<jsp:include page="head.jsp"/>
<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01on">首页</li>
            <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
            <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
            <li class="nico04"><a href="###" onclick="choose(4)">巡更系统</a></li>
        </ul>
    </div>
    <!-----导航 结束------>
    <div class="tablearea" style="margin-top: 20px">
        <div class="tborder7"></div>
        <div class="tit01">基本信息</div>
        <div class="tborder3"></div>
        <div class="tit02">警力汇总</div>
        <div class="tborder1"></div>
        <div class="tcont01">值勤<b class="greens" id="jlsd"></b>
            全部<b class="whites" id="jlyd"></b>
            未值勤<b class="reds" id="jlwd"></b></div>

        <div class="h20"></div>
        <div class="tborder3"></div>
        <div class="tit02">
            服刑人员出工汇总</div>
        <div class="tborder1"></div>
        <div class="tcont01">
            出工<b class="greens" id="jfsd"></b>
            全部<b class="whites" id="jfyd"></b>
            未出工<b class="reds" id="jfwd"></b></div>

        <div class="h20"></div>
        <div class="tborder3"></div>
        <div class="tit02">巡更分析 <span id="xgsjd"></span></div>
        <div class="tborder1"></div>
        <div class="tcont02" id="divul">
            <ul id="xgul">
            </ul>
        </div>
        <div class="tborder3"></div>
        <div class="h30"></div>
    </div>


    <div class="maparea" id="main" style="height: 700px;" >


    </div>
</div>

<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p></div>
<script type="text/javascript">

    var myChart = echarts.init(document.getElementById("main"));

    option = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            data: ['警员','服刑人员']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis:  {
            type: 'value'
        },
        yAxis: {
            type: 'category',
            data: ['一监区','二监区','三监区','四监区','五监区','六监区','七监区','八监区','九监区','十监区','十一监区','十二监区','十三监区','十四监区','十五监区','十六监区','十七监区']
        },
        color:['#FF0000','#00CD00'],
        textStyle:{
            color:'#ffFFFF',
            fontWeight:'bold'
        },
        series: [
            {
                name: '警员',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [150, 212, 201, 154, 190, 330, 410,500,300,500, 154, 190, 330, 410,500,300,500]
            },
            {
                name: '服刑人员',
                type: 'bar',
                stack: '总量',
                label: {
                    normal: {
                        show: true,
                        position: 'insideRight'
                    }
                },
                data: [820, 832, 901, 934, 1290, 1330, 1320,600,452,152, 934, 1290, 1330, 1320,600,452,152]
            }
        ]
    };

    myChart.setOption(option);
</script>
</body>
</html>
