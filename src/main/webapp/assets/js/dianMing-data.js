var dianming_radius = [47, 57];//pie内外半径
var legend_data = [];//pie图例
var dianming_pie = echarts.init(document.getElementById('dianmingPie'));
var xh;

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

var dianming_option = {
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

dianming_pie.setOption(dianming_option);

/*获取pie-option-series 所需数据*/
function getSeries_data_dianming(json) {
    var series_data = [];
    for (var i = 0; i < json.length; i++) {
        var m = json[i];
        //计算pie环图坐标
        var x = (0.1 + (i % 6) * 0.16) * 100 + '%';
        var y = (0.22 + Math.floor(i / 6) * 0.26) * 100 + '%';

        var a = Math.random() * 100;
        var deptName = m.name.replace("点名","");
        //全局变量legend_data赋值
        legend_data[i] = deptName;

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

                {key: 0, deptId: m.deptID, name: deptName, value: m.realCount, planValue: m.pcount, itemStyle: labelTop, realValue: m.realCount},
                {key: 1, deptId: m.deptID, name: deptName, value: m.pcount - m.realCount, planValue: m.pcount, itemStyle: labelBottom,realValue: m.realCount}
            ]
        }
        series_data[i] = s;
    }
    return series_data;
}

function refDianming() {
    // 读取监区点名数据
    $.ajax({

        type: 'POST',
        url: '/toDmAjax',

        success: function (data) {

            var list = data["list"];
            var jsons = JSON.parse(list);
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


            dianming_pie.on('click', function (params) {
                console.log("Pie on click");
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

        },
        error: function () {
            alert("获取数据失败，请检查网络是否畅通！");
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
        },
        error: function () {
            alert("获取数据失败，请保证网络畅通!");
        }
    });
}
function wdDm() {
    if(xh) {
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
}
