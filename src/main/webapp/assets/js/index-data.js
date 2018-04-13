$(function() {
    $(".knob").knob();
    $('.circliful-chart').circliful();

    // 一次性加载，不需要定时更新的
    $.ajax({
        type:"get",
        url: "/statistic/getAgeGroups",
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success:function(msg){
            if(msg && msg.length>0){
                var groupName = [];
                var groupCount = [];
                for(var i=0;i<msg.length;i++) {
                    groupName[i] = msg[i].ageGroup;
                    groupCount[i] = msg[i].count;
                }

                var fzsl_option = {
                    textStyle: {color: '#ccc'},
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : groupName,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'数量',
                            type:'bar',
                            barWidth: '50%',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'top'
                                }
                            },
                            data:groupCount
                        }
                    ]
                };
                var fzslBar = echarts.init(document.getElementById('fzslBar'));
                // fzlx_pie.showLoading({
                //     text: '数据获取中',
                //     effect: 'whirling'
                // });
                fzslBar.setOption(fzsl_option);
            } else {
                console.log("获取人员年龄统计失败！");
            }
        }
    });
    // 加载罪犯刑期统计
    $.ajax({
        type:"get",
        url: "/statistic/getSentenceLength",
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success:function(msg){
            if(msg.length>0) {
                var stensData = [];
                for(var i=0;i<msg.length;i++) {
                    var disName;
                    switch (msg[i].ageGroup) {
                        case 1:
                            disName = "一年以下";
                            break;
                        case 3:
                            disName = "一至三年";
                            break;
                        case 10:
                            disName = "三至十年";
                            break;
                        case 15:
                            disName = "十到十五年";
                            break;
                        case 20:
                            disName = "二十年以下";
                            break;
                        case 100:
                            disName = "无期徒刑";
                            break;
                        default:
                            disName = "其他";
                    }
                    stensData[i] = {"value":msg[i].count,"name":disName}
                }
                var whcd_option = {
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    legend: {
                        x : 'right',
                        y : 'top',
                        data:['初中','小学','高中','大学']
                    },
                    color: ['#D66B94', '#4d88f3', '#EDA936', '#64e886', '#e8db25', '#e85a4e'],
                    series: [
                        {
                            name:'数量',
                            type:'pie',
                            radius: ['50%', '70%'],
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: true,
                                    position: 'left'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '30',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data:stensData
                        }
                    ]
                };
                echarts.init(document.getElementById('whcdBar')).setOption(whcd_option);
            }
        }
    });

    // 加载各监区囚徒数量
    $.ajax({
        type:"get",
        url: "/statistic/getPCountByArea",
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success:function(dmInfoList){
            if(dmInfoList.length>0) {
                var nameList = [];
                var countList = [];
                for (var i = 0; i < dmInfoList.length; i++) {
                    nameList[i] = dmInfoList[i].name.replace("点名","");
                    countList[i] = dmInfoList[i].pcount;
                }
                var jqNum_option = {
                    textStyle: {color: '#ccc'},
                    color: ['#3398DB'],
                    tooltip : {
                        trigger: 'axis',
                        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            data : nameList,
                            axisTick: {
                                alignWithLabel: true
                            }
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            name:'数量',
                            type:'bar',
                            barWidth: '50%',
                            label: {
                                normal: {
                                    show: true,
                                    position: 'top'
                                }
                            },
                            data:countList
                        }
                    ]
                };
                var jqNumBar = echarts.init(document.getElementById('jqNumBar'));
                jqNumBar.setOption(jqNum_option);
            }
        },
        error:function () {
            alert("加载监区囚犯数量失败！");
        }
    });

    // 加载各民族囚徒数量
    $.ajax({
        type:"get",
        url: "/statistic/getPCountInNation",
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success:function(countInNationList){
            var dataList = [];
            var nameList = [];
            for(var i=0;i<countInNationList.length;i++) {
                dataList[i] = {"name":countInNationList[i].name, "value":countInNationList[i].count};
                nameList[i] = countInNationList[i].name;
            }
            //民族
            var mz_option = {

                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x : 'right',
                    y : 'top',
                    data: nameList,
                    textStyle: {color: '#ccc'}
                },
                color: ['#F3E59A', '#E87355', '#87CDF3', '#CDCD00', '#4A81D2'],
                series : [
                    {
                        name: '数量',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:dataList,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };

            var mzBar = echarts.init(document.getElementById('mzBar'));
            mzBar.setOption(mz_option);
        }
    });

    // 按犯罪类型统计
    $.ajax({
        type:"get",
        url: "/statistic/getPCountByCrimeType",
        contentType: 'application/json;charset=UTF-8',
        dataType: 'json',
        success:function(pCountList){
            var dataList = [];
            var nameList = [];
            for(var i=0;i<pCountList.length;i++) {
                var pCount = pCountList[i];
                dataList[i] = {"value":pCount.count, "name":pCount.name};
                nameList[i] = pCount.name;
            }
            var fzlx_option = {
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    x : 'right',
                    y : 'top',
                    data: nameList,
                    selectedMode: true,
                    textStyle: {color: '#ccc'}
                },
                title: {
                    // text: '犯罪类型统计',
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
                color: ['#D66B94', '#4d88f3', '#EDA936', '#E87355'],
                calculable : true,
                series : [
                    {
                        name:'罪犯人数及所占比',
                        type:'pie',
                        radius : [30, 110],
                        center : ['50%', '50%'],
                        roseType : 'area',
                        data:dataList
                    }
                ]
            };
            var fzlx_pie = echarts.init(document.getElementById('fzlxPie'));
            fzlx_pie.setOption(fzlx_option);
        }
    });


});

var radius = [25, 35];//pie内外半径
var dianming_radius = [47, 57];//pie内外半径
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
};

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
            fontSize: 18,
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

dianming_option = {
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
            fontSize: 18,
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

//dianmingPie
var pie = echarts.init(document.getElementById('jlPie'));
var dianming_pie = echarts.init(document.getElementById('dianmingPie'));
pie.showLoading({
    text: '数据获取中',
    effect: 'whirling'
});
pie.setOption(option);
dianming_pie.setOption(dianming_option);

// 需要定时更新的
function refData() {
    console.log(new Date());

    // 读取监区点名数据
    $.ajax({
        type: 'POST',
        url: '/getFxryInfo',
        success: function (data) {
            var d = eval("(" + data + ")");
            $("#jfyd").text(d['ydNum']);
            $("#jfsd").text(d['sdNum']);
            $("#jfwd").text(d['wdNum']);
        },
        error: function () {
            alert("获取数据失败，请保证网络畅通!");
        }
    });

    // 读取警力分布数据
    $.ajax({
        type: 'post',
        url: '/toJlEmpTypeHJ',
        cache: false,
        dataType: 'json',
        success: function (data) {

            $("#empTypeHJ").empty();

            data.forEach(function (val, index) {

                $("#empTypeHJ").append(
                    '<div class="itemwrap01" style="width:215px">' +
                    '<div class="tit02">' + val.typeName + '：' + '<b class="greens">' + val.realCount +
                    '</b></div></div>');
            });
        }
    });

    // 异步获取各监区警力数据并显示饼图
    $.ajax({
        type: 'GET',
        url: '/toJlSync',
        success: function (data) {
            var optionNew = pie.getOption();
            optionNew.series = getSeries_data(data);
            optionNew.legend.data = legend_data;
            pie.setOption(optionNew);
            pie.hideLoading();

        }
    });

    // 异步获取各监区出工数据并显示饼图
    $.ajax({
        type: 'GET',
        url: '/statistic/getCGInfo',
        success: function (data) {
            var optionNew2 = dianming_pie.getOption();
            optionNew2.series = getSeries_data_dianming(data);
            optionNew2.legend.data = legend_data;
            dianming_pie.setOption(optionNew2);
            dianming_pie.hideLoading();
        }
    });

    loadAlarmData();

}

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
                {key: 0, deptId: m.deptID, name: m.deptName, value: m.realCount, planValue: m.planCount, itemStyle: labelTop, realValue: m.realCount},
                {key: 1, deptId: m.deptID, name: m.deptName, value: m.planCount - m.realCount, planValue: m.planCount, itemStyle: labelBottom, realValue: m.realCount}
            ]
        }
        series_data[i] = s;
    }
    return series_data;
}

/*获取pie-option-series 所需数据*/
function getSeries_data_dianming(json) {
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
            radius: dianming_radius,
            x: '0%',
            itemStyle: labelFromatter,
            clickable: true,
            data: [
                // {key: 1, deptId: m.deptID, name: m.name, value: m.realCount, planValue: m.pcount, itemStyle: labelBottom, realValue: m.realCount},
                // {key: 0, deptId: m.deptID, name: m.name, value: m.pcount - m.realCount, itemStyle: labelTop}

                {key: 0, deptId: m.deptID, name: m.name, value: m.realCount, planValue: m.pcount, itemStyle: labelTop, realValue: m.realCount},
                {key: 1, deptId: m.deptID, name: m.name, value: m.pcount - m.realCount, planValue: m.pcount, itemStyle: labelBottom,realValue: m.realCount}
            ]
        }
        series_data[i] = s;
    }
    return series_data;
}

setInterval(refData, 1000 * 60 * 5);// 每隔五分钟重新读取数据
setInterval(showTime, 1000);
refData();

// 加载预警信息并且轮播
function loadAlarmData() {
    $.ajax({
        type: 'GET',
        url: '/statistic/getWarningInfo',
        cache: false,
        dataType: 'json',
        success: function (jsonData) {
            var data = jsonData.resList;
            var dmAlarm = $("#dmAlarm");
            var othAlarm = $("#othAlarm");
            var dmAlarmContent = "";
            var othAlarmContent = "";
            var i = 0, j=0, k=0, l=0;
            while(j<10 && i<data.length) {
                var dataMap = data[i];
                i++;
                if(dataMap.name=="点名预警") {
                    k ++;
                    if(k<9) {
                        dmAlarmContent += "<li class='list-group-item dmAlarm-li' endTime='"+jsonData.endTime+"'>" + "<i class='mdi mdi-bell noti-icon'></i>" +
                            " <a href='javascript:void(0);' data-toggle='modal' data-target='#warning-modal'>"+dataMap.info+"</a></li>";
                    }
                } else if(dataMap.name=="巡更异常") {
                    j++;
                    othAlarmContent += "<li class='list-group-item xgAlarm-li' LogDate='" + dataMap.LogDate + "' RegDate='" + dataMap.RegDate + "' AddrID='" + dataMap.AddrID +
                        "'><a href='javascript:void(0);' data-toggle='modal' data-target='#XG-modal'>[" + dataMap.name + "]" + dataMap.info + "</a></li>";
                } else {
                    l ++;
                    if(l<9) {
                        othAlarmContent += "<li class='list-group-item jlAlarm-li' starttime='"+dataMap.starttime+"' endtime='"+dataMap.endtime+"' dept_id='"+dataMap.dept_id+
                            "'><a href='javascript:void(0);' data-toggle='modal' data-target='#JL-modal'>["+dataMap.name+"]"+dataMap.info+"</a></li>";
                    }
                }
            }
            if(k>0) {
                dmAlarm.empty();
                dmAlarm.append(dmAlarmContent);
            }
            if(j>0) {
                othAlarm.empty();
                othAlarm.append(othAlarmContent);
            }
            if(k>1) {
                if(scrollQ1) {
                    cleanScrollQ(scrollQ1);
                }

                scrollQ1 = $("#dmAlarm").scrollQ({
                    line:1,
                    scrollNum:1,
                    scrollTime:3500
                });
            }
            if(j>3) {
                if(scrollQ2) {
                    cleanScrollQ(scrollQ2);
                }
                scrollQ2 = $("#othAlarm").scrollQ({
                    line:3,
                    scrollNum:1,
                    scrollTime:2500
                });
            }
        },
        error: function() {
            console.log("Get warning info failed.");
        }
    });
}
var switchVar = 1;
setInterval(function(){
    if(switchVar==1) {
        $(".mdi-bell").css("color", "red");
        switchVar = 2;
    } else {
        $(".mdi-bell").css("color", "yellow");
        switchVar = 1;
    }

}, 500);

function cleanScrollQ(ulObject){
    clearInterval(ulObject.scrollTimer);
    ulObject.eleUL.unbind("mouseover");
    ulObject.eleUL.unbind("mouseout");
    ulObject.eleUL.removeProp("scrollQ");
}

function showTime() {
    var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
    var myDate = new Date();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    if (month < 10) month = "0" + month;
    if (day < 10) {
        day = "0" + day
    }

    var ymd = myDate.getFullYear() + '-' + month + '-' + day;
    var hour = myDate.getHours();
    if (hour < 10) hour = "0" + hour;
    var min = myDate.getMinutes();
    if (min < 10) {
        min = "0" + min;
    }
    var mi = myDate.getSeconds();
    if (mi < 10) mi = "0" + mi;
    var result = hour + ":" + min + ":" + mi;
    $("#sfm").html(result);
    $("#nyr").html(ymd + "  " + today[myDate.getDay()]);
}