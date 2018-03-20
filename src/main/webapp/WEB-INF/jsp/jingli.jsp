<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>警力分布</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/style/js/easyui/themes/black/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/js/easyui/themes/icon.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/echarts.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/date.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>style/js/choose.js"></script>
</head>
<body class="body01">
<jsp:include page="head.jsp"/>
<!-----主体 开始------>
<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01"><a href="###" onclick="choose(1)">首页</a></li>
            <li class="nico02on">警力分布</li>
            <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
            <li class="nico04"><a href="###" onclick="choose(4)">巡更系统</a></li>
            <li class="nico05"><a href="###" onclick="choose(6)">数据汇总</a></li>

        </ul>
    </div>
    <!-----导航 结束------>

    <div style="width:1120px; float:left; margin-top:-25px; margin-left: 160px;">
        <%--<div class="tit01">警力分析图</div>--%>
        <div class="itemwrap" id="empTypeHJ">
            <div class="clear"></div>
        </div>
    </div>

    <div style="width:1052px; float:left; margin-top:5px; margin-left: 160px;">
        <div class="tborder7"></div>
    </div>

    <div class="tablearea02" style="background:#EFF0EC; height:550px;margin-top: -20px;margin-left: 120px;"
         id="jlPie"></div>


    <%--对话框--%>
    <div id="dlg"></div>
</div>
<!-----主体 结束------>
<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p></div>
</body>
</html>
<script type="text/javascript">


    var radius = [46, 65];//pie内外半径
    var legend_data = [];//pie图例

    var labelTop = {
        normal: {
            label: {
                show: true,
                position: 'center',
                formatter: '{b}',
                textStyle: {
                    baseline: 'bottom'
                }
            },
            labelLine: {
                show: false
            }
        }
    };

    var labelFromatter = {
        normal: {
            label: {
                formatter: function (params) {
                    return params.data.realValue + '/' + params.data.planValue;
                },
                textStyle: {
                    baseline: 'top',
                    fontSize: 14,
                    fontWeight: '900'
                }
            }

        }
    }

    var labelBottom = {
        normal: {
            color: '#ccc',
            label: {
                show: true,
                position: 'center'
            },
            labelLine: {
                show: false
            }
        }

    };

    option = {
        legend: {
            x: 'center',
            y: 'bottom',
            data: legend_data,
            selectedMode: true,
            textStyle: {color: 'red'}
        },
        title: {
            //text: '各监区警力分析图',
            //subtext: 'from global web index',
            x: 'center',
            y: '10',
            textStyle: {
                // fontFamily: 'Arial, Verdana, sans...',
                fontSize: 24,
                fontStyle: 'normal',
                fontWeight: 'normal',
                color: '#ff1f1f'
            }
        },
        color: ['#D66B94', '#F3E59A', '#EDA936', '#E87355', '#87CDF3', '#CDCD00', '#4A81D2'],
        toolbox: {
            show: false,
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            width: '20%',
                            height: '30%',
                            itemStyle: {
                                normal: {
                                    label: {
                                        formatter: function (params) {
                                            return 'other\n' + params.value + '%\n'
                                        },
                                        textStyle: {
                                            baseline: 'middle'
                                        }
                                    }
                                },
                            }
                        }
                    }
                },
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        // stillShowZeroSum:false,
        series: []
    };


    var pie = echarts.init(document.getElementById('jlPie'));
    pie.showLoading({
        text: '数据获取中',
        effect: 'whirling'
    });
    pie.setOption(option);


    pie.on('click', function (params) {

        var key = params.data.key;
        var name = params.data.name;
        var deptId = params.data.deptId;

        if (key == 0) {
            $('#dlg').dialog({
                title: '未出勤人员列表' + '（' + name + ')',
                width: 800,
                height: 600,
                closed: false,
                cache: false,
                href: '/toJlAbsentPage?deptId=' + deptId,
                modal: true
            });

        } else if (key == 1) {
            $('#dlg').dialog({
                title: '出勤人员列表' + '（' + name + ')',
                width: 800,
                height: 600,
                closed: false,
                cache: false,
                href: '/toJlWorkPage?deptId=' + deptId,
                modal: true
            });
        }
    });


    //异步刷新pie
    function refData() {
        //异步获取各人员类型出勤统计，并显示页面
        $.ajax({
            type: 'post',
            url: '/toJlEmpTypeHJ',
            data: {},
            cache: false,
            dataType: 'json',
            success: function (data) {

                $("#empTypeHJ").empty();

                data.forEach(function (val, index) {

                    //$("#empTypeHJ").append('<b class="greens">'+val.typeName +':' + val.realCount + '/' +( parseInt(val.realCount)+parseInt(val.absentCount)) +'</b>' + '  ');
                    $("#empTypeHJ").append(
                            '<div class="itemwrap01" style="width:215px">' +
                            '<div class="tborder3"></div>' +
                            '<div class="tit02">' + val.typeName + '：' + '<b class="greens" id="sdNumAll">' + val.realCount + '</b>' + '</div>' +
                            '</div>');

                });


            }
        });

        //异步获取各监区数据并显示饼图
        $.ajax({
            type: 'POST',
            url: '/toJlSync',
            success: function (data) {
                var optionNew = pie.getOption();
                optionNew.series = getSeries_data(data);
                optionNew.legend.data = legend_data;
                pie.setOption(optionNew);
                pie.hideLoading();
            }
        });
    }
    ;

    /*获取pie-option-series 所需数据*/
    function getSeries_data(json) {
        var series_data = [];
        for (var i = 0; i < json.length; i++) {
            var m = json[i];
            //计算pie环图坐标
            var x = (0.1 + (i % 6) * 0.16) * 100 + '%';
            var y = (0.22 + Math.floor(i / 6) * 0.26) * 100 + '%';

            var a = Math.random() * 100;
            //全局变量legend_data赋值
            legend_data[i] = m.deptName;

            var s = {
                type: 'pie',
                center: [x, y],
                radius: radius,
                x: '0%',
                itemStyle: labelFromatter,
                clickable: true,
                data: [
                    {
                        key: 1,
                        deptId: m.deptID,
                        name: m.deptName,
                        value: m.realCount,
                        planValue: m.planCount,
                        itemStyle: labelBottom,
                        realValue: m.realCount
                    },
                    {key: 0, deptId: m.deptID, name: m.deptName, value: m.planCount - m.realCount, itemStyle: labelTop}
                ]
            }
            series_data[i] = s;
        }
        return series_data;
    }

    function refXunGeng() {

    }

</script>
