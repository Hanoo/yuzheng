<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/choose.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/scroll.js"></script>
    <script type="text/javascript">

        /**页面初始化方法*/
        $(document).ready(function () {
            // 获取巡更分析

            for (var j = 1; j < 16; j++) {
                $("#alarm" + j).css("display", "none");
                $("#d" + j).css("display", "none");
            }

            // $("#xgul").scrollQ();
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
                        var idx = entry['code'];
                        var show = entry['qxyy'];
                        if (show == "true") {
                            $("#d" + idx).css("display", "");
                        }
                        //  实际警力
                        var realCount = entry['realCount'];
                        // 实际服刑
                        var value = entry['value'];

                        if (idx <= 10) {
                            $("#index" + idx).html(realCount + "/" + entry['planCount']);
                            $("#index" + idx + idx).html(value + "/" + entry['pcount']);
                        } else {
                            $("#index" + idx + "a").html(realCount + "/" + entry['planCount']);
                            $("#index" + idx + "b").html(value + "/" + entry['pcount']);

                        }

                        // 实际警力 少于 服刑人员的 20% 就预警
                        if (parseFloat(realCount) / parseFloat(value) < 0.2) {
                            $("#alarm" + idx).css("display", "");
                            $("#alarm" + idx).attr("title", "警力不足20%，预警！");
                            $("#no" + idx).removeClass("nobgyellow");
                            $("#no" + idx).addClass("nobgred");
                        }

                    })
                },
                error: function () {
                    alert("获取数据失败，请保证网络畅通!");
                }
            })
        }

        function refXunGeng() {
            /*
             * 获取点名数据
             * */
            $.ajax({
                type: 'POST',
                url: '/getDmCount',
                success: function (data) {
                    var result = eval(data);
                    $("#dmjq").text(result['dmjq']);
                    $("#wdmjq").text(result['wdmjq']);
                }
            })
        }


    </script>
</head>
<body class="body01">
<jsp:include page="head.jsp"/>
<!-----主体 开始------>
<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01on">首页</li>
            <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
            <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
            <li class="nico04"><a href="###" onclick="choose(4)">巡更系统</a></li>
            <li class="nico05"><a href="###" onclick="choose(6)">数据汇总</a></li>
        </ul>
    </div>

    <div class="tablearea" style="margin-top: 50px;">
        <div class="tborder7"></div>
        <div class="tit01">基本信息</div>
        <div class="tborder3"></div>
        <div class="h30"></div>
        <div class="tit02">警力汇总</div>
        <div class="tborder1"></div>

        <div class="tconta01">全部<b class="whites" id="jlyd"></b></div>
        <div class="tborder1"></div>
        <div class="tcont01">值勤<b class="greens" id="jlsd"></b>

            未值勤<b class="reds" id="jlwd"></b></div>
        <div class="tborder3"></div>

        <div class="h30"></div>
        <div class="tit02">
            服刑人员出工汇总
        </div>
        <div class="tborder1"></div>
        <div class="tconta01">全部<b class="whites" id="jfyd"></b></div>
        <div class="tborder1"></div>
        <div class="tcont01">
            出工<b class="greens" id="jfsd"></b>

            未出工<b class="reds" id="jfwd"></b></div>

        <%--<div class="h20"></div>
        <div class="tborder3"></div>
        <div class="tit02">巡更分析 <span id="xgsjd"></span></div>
        <div class="tborder1"></div>
        <div class="tcont02" id="divul">
            <ul id="xgul">
            </ul>
        </div>--%>
        <div class="tborder3"></div>
        <div class="h10"></div>
        <div class="tit02">监区点名状态</div>
        <div class="tborder1"></div>
        <div class="tcont01">
            点名监区数<b class="greens" id="dmjq"></b>
            未点名监区数<b class="reds" id="wdmjq"></b>
        </div>

        <div class="tborder1"></div>
    </div>


    <div class="maparea">
        <div class="map"></div>
        <div class="no01 nobgyellow" id="no1">1</div>
        <div class="no02 nobgyellow" id="no2">2</div>
        <div class="no03 nobgyellow" id="no3">3</div>
        <div class="no04 nobgyellow" id="no4">4</div>
        <div class="no05 nobgyellow" id="no5">5</div>
        <div class="no06 nobgyellow" id="no6">6</div>
        <div class="no07 nobgyellow" id="no7">7</div>
        <div class="no08 nobgyellow" id="no8">8</div>
        <div class="no09 nobgyellow" id="no9">9</div>
        <div class="no10 nobgyellow" id="no10">10</div>
        <div class="no11 nobgyellow" id="no11">11</div>
        <div class="no12 nobgyellow" id="no12">12</div>
        <div class="no13 nobgyellow" id="no13">13</div>
        <div class="no14 nobgyellow" id="no14">14</div>
        <div class="no15 nobgyellow" id="no15">15</div>

        <div class="co02 cop01" id="d1">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index1"></span></p>
                <p class="whites"> 服刑人员出勤 <br/><span id="index11"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa01"></div>
        </div>

        <div class="co02 cop02" id="d2">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index2"></span></p>
                <p>服刑人员出勤 <br/><span id="index22"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa02"></div>
        </div>
        <div class="co02 cop03" id="d3">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index3"></span></p>
                <p class="whites">服刑人员出勤<br/> <span id="index33"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa03"></div>
        </div>
        <div class="co02 cop04" id="d4">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index4"></span></p>
                <p class="whites">服刑人员出勤 <br/><span id="index44"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa04"></div>
        </div>
        <div class="co02 cop05" id="d5">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index5"></span></p>
                <p class="whites">服刑人员出勤 <br/><span id="index55"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa05"></div>
        </div>
        <div class="co02 cop06" id="d6">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index6"></span></p>
                <p class="whites">服刑人员出勤 <br/><span id="index66"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa06"></div>
        </div>
        <div class="co02 cop07" id="d7">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index7"></span></p>
                <p>服刑人员出勤 <br/><span id="index77"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa07"></div>
        </div>
        <div class="co02 cop08" id="d8">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index8"></span></p>
                <p>服刑人员出勤<br/> <span id="index88"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa08"></div>
        </div>
        <div class="co02 cop09" id="d9">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index9"></span></p>
                <p class="whites">服刑人员出勤 <br/><span id="index99"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa09"></div>
        </div>
        <div class="co02 cop10" id="d10">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index10"></span></p>
                <p>服刑人员出勤 <br/><span id="index1010"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa10"></div>
        </div>
        <div class="co02 cop11" id="d11">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index11a"></span></p>
                <p>服刑人员出勤 <br/><span id="index11b"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa11"></div>
        </div>
        <div class="co02 cop12" id="d12">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index12a"></span></p>
                <p>服刑人员出勤 <br/><span id="index12b"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa12"></div>
        </div>
        <div class="co02 cop13" id="d13">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index13a"></span></p>
                <p>服刑人员出勤 <br/><span id="index13b"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa13"></div>
        </div>
        <div class="co02 cop14" id="d14">
            <div class="box01top"></div>
            <div class="box01mid">
                <p>警力分析 <span id="index14a"></span></p>
                <p>服刑人员出勤 <br/><span id="index14b"></span></p>
            </div>
            <div class="box01bot"></div>
            <div class="coa14"></div>
        </div>
        <div class="co02 cop15" id="d15">
            <div class="box02top"></div>
            <div class="box02mid">
                <p class="whites">警力分析 <span id="index15a"></span></p>
                <p class="whites">服刑人员出勤 <br/><span id="index15b"></span></p>
            </div>
            <div class="box02bot"></div>
            <div class="coa15"></div>
        </div>
        <div class="alarm01" id="alarm1"></div>
        <div class="alarm02" id="alarm2"></div>
        <div class="alarm03" id="alarm3"></div>
        <div class="alarm04" id="alarm4"></div>
        <div class="alarm05" id="alarm5"></div>
        <div class="alarm06" id="alarm6"></div>
        <div class="alarm07" id="alarm7"></div>
        <div class="alarm08" id="alarm8"></div>
        <div class="alarm09" id="alarm9"></div>
        <div class="alarm10" id="alarm10"></div>
        <div class="alarm11" id="alarm11"></div>
        <div class="alarm12" id="alarm12"></div>
        <div class="alarm13" id="alarm13"></div>
        <div class="alarm14" id="alarm14"></div>
        <div class="alarm15" id="alarm15"></div>
    </div>
    <!-----导航 结束------>
</div>
<!-----主体 结束------>

<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p></div>

</body>