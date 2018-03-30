var radius = [25, 35];//pie内外半径
var legend_data = [];//pie图例
var pie = echarts.init(document.getElementById('jlPie'));

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

var option = {
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
pie.setOption(option);
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
// 读取警力分布数据
$.ajax({
    type: 'post',
    url: '/toJlEmpTypeHJ',
    cache: false,
    dataType: 'json',
    success: function (data) {

        $("#empTypeCount").empty();

        data.forEach(function (val, index) {

            $("#empTypeCount").append(
                '<div class="itemwrap01 col-lg-3 text-center">' +
                '<div class="tit02">' + val.typeName + '：' + '<b class="greens">' + val.realCount +
                '</b></div></div>');
        });
    }
});
