<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/style/js/easyui/themes/black/easyui.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/echarts.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.easyui.min.js"></script>


</head>
<body class="body01">
<jsp:include page="head.jsp"/>
<!-----主体 开始------>

<%--对话框--%>
<div id="dlg"></div>
<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01"><a href="###" onclick="choose(1)">首页</a></li>
            <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
            <li class="nico03on">点名系统</li>
            <li class="nico04"><a href="###" onclick="choose(4)">巡更系统</a></li>
            <li class="nico05"><a href="###" onclick="choose(6)">数据汇总</a></li>
        </ul>
    </div>
    <!-----导航 结束------>
    <!-----内容 开始------>

    <div style="width:1120px; float:left; margin-top:0px; margin-left: 160px;">


        <div class="itemwrap">
            <div class="itemwrap01">
                <div class="tborder3"></div>
                <div class="tit02">
                    服刑人员出工汇总
                </div>
                <div class="tborder1"></div>
                <div class="tcont01">出工
                    <b class="greens" id="sdNumAll"></b>
                    全部<b class="whites" id="ydNumAll"></b>
                    未出工<b class="reds" id="wdNumAll"></b>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="tborder5"></div>
            </div>
            <div class="itemwrap02">
                <div class="tborder3"></div>
                <div class="tit02">警力汇总</div>
                <div class="tborder1"></div>
                <div class="tcont01">值勤<b class="greens" id="realCountAll"></b>
                    全部<b class="whites" id="planCountAll"></b>
                    未值勤<b class="reds" id="wdjlCountAll"></b>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="tborder5"></div>
            </div>
            <div class="itemwrap03">
                <div class="tborder3"></div>
                <div class="tit02">警力匹配度</div>
                <div class="tborder1"></div>
                <div class="tcont01">匹配度<b class="greens" id="percAll"></b>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="tborder5"></div>
            </div>
            <div class="clear"></div>
            <div class="tborder7"></div>
        </div>

        <div class="h20"></div>

        <div class="itemwrap">
            <div class="itemw01">
                <div id="main" style="width: 640px;height:440px;margin-top: 10px;padding: 10px;">

                </div>
            </div>
            <div class="itemw02">
                <div class="tityellow"><span id="jqname"></span>统计汇总</div>
                <div class="tit02">
                    服刑人员出工汇总
                </div>
                <div class="tborder1yellow"></div>
                <div class="tcont01">出工<b class="greens" id="sdNum">-</b>
                    全部<b class="whites" id="ydNum">-</b>
                    未出工<a onclick="wdDm()"><b class="reds" id="wdNum">-</b></a>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="h20"></div>
                <div class="tit02">警力汇总</div>
                <div class="tborder1yellow"></div>
                <div class="tcont01">值勤<a onclick="wdjlYesDm()"><b class="greens" id="realCount">-</b></a>
                    全部<b class="whites" id="planCount">-</b>
                    未值勤<a onclick="wdjlNotDm()"><b class="reds" id="wdjlNum">-</b></a>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="h20"></div>
                <div class="tit02">警力匹配度</div>
                <div class="tborder1yellow"></div>
                <div class="tcont01">匹配度<b class="greens" id="perc">-</b>
                    <%--<span>预警</span><b class="whites">&nbsp;-</b>--%>
                </div>
                <div class="tborder5yellow"></div>
            </div>
        </div>
    </div>
    <!-----内容 结束------>
</div>
<!-----主体 结束------>
<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p>
</div>

<script type="text/javascript">

    //定义全局变量序号
    var xh = '';
    //定义全局变量监区名称
    var jqmc = '';
    //异步刷新pie
    function refData() {
        $.ajax({

            type: 'POST',
            url: '/toDmAjax',

            success: function (data) {

                var obj = eval(data);

                var list = data["list"];
                jsons = JSON.parse(list);
                var sdNumAll = data["sdNum"];
                var ydNumAll = data["ydNum"];
                var realCountAll = data["realCount"];
                var planCountAll = data["planCount"];
                var percAll = data["perc"];
                var wdjlCountAll = planCountAll - realCountAll;


                var wdNumAll = ydNumAll - sdNumAll;

                $("#sdNumAll").html(sdNumAll);
                $("#wdNumAll").html(wdNumAll);
                $("#wdjlCountAll").html(wdjlCountAll);
                $("#ydNumAll").html(ydNumAll);
                $("#realCountAll").html(realCountAll);
                $("#planCountAll").html(planCountAll);
                $("#percAll").html(percAll);

                var serie = [];

                for (var i = 0; i < jsons.length; i++) {
                    serie.push({"value": jsons[i].value, "name": jsons[i].name});
                }

                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {

                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },

//                    toolbox: {
//                        show: true,
//                        feature: {
//                            mark: {show: true},
//                            dataView: {show: true, readOnly: false},
//                            magicType: {
//                                show: true,
//                                type: ['pie', 'funnel'],
//                                option: {
//                                    funnel: {
//                                        x: '25%',
//                                        width: '50%',
//                                        funnelAlign: 'left',
//                                        max: 1548
//                                    }
//                                }
//                            },
//                            restore: {show: true},
//                            saveAsImage: {show: true}
//                        }
//                    },
                    calculable: true,
                    series: [
                        {
                            name: '监区点名',
                            type: 'pie',
                            selectedMode: 'single',
                            radius: '90%',
                            center: ['50%', '50%'],
                            data: serie
                        }
                    ]
                };
//                myChart.showLoading({
//                    text: '数据获取中',
//                    effect: 'whirling'
//                });

                // 为echarts对象加载数据
                myChart.setOption(option);


                myChart.on('click', function (params) {
                    var serie;
                    var str = '0';
                    var str1 = '0';
                    var realCount = '0';
                    var planCount = '0';
                    var perc = '0';
                    //未到人员
                    var wdNum = '0';
                    //未到警力
                    var wdjlNum = '0';
                    jqmc = params.name;
                    for (var i = 0; i < jsons.length; i++) {

                        if (params.name == jsons[i].name) {
                            str = jsons[i].value;
                            str1 = jsons[i].pcount;
                            realCount = jsons[i].realCount;
                            planCount = jsons[i].planCount;
                            perc = jsons[i].perc;
                            xh = jsons[i].xh;
                            wdNum = str1 - str;
                            wdjlNum = planCount - realCount;
                        }
                    }
                    $("#sdNum").html(str);
                    $("#wdjlNum").html(wdjlNum);
                    $("#wdNum").html(wdNum);
                    $("#ydNum").html(str1);
                    $("#realCount").html(realCount);
                    $("#planCount").html(planCount);
                    $("#perc").html(perc);

                    $("#jqname").text(jqmc);
                });

            }, error: function () {
                alert("error");
            }
        });
    }


    function refXunGeng() {

    }
    function wdDm() {
        $('#dlg').dialog({
            width: 800,
            title: "未到人员明细表",
            height: 600,
            closed: false,
            cache: false,
            href: '/toWd?xh=' + xh,
            modal: true
        });
    }
    function wdjlNotDm() {
        $('#dlg').dialog({
            width: 800,
            title: "未到警力明细表（" + jqmc + "）",
            height: 600,
            closed: false,
            cache: false,
            href: '/toJlAbsentPageByDeptName?deptName=' + jqmc,
            modal: true
        });
    }

    function wdjlYesDm() {
        $('#dlg').dialog({
            width: 800,
            title: "实到警力明细表（" + jqmc + "）",
            height: 600,
            closed: false,
            cache: false,
            href: '/toJlWorkPageByDeptName?deptName=' + jqmc,
            modal: true
        });
    }

</script>

</body>
</html>
