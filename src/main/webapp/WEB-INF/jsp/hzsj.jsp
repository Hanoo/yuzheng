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

<div class="main">
    <!-----导航 开始------>
    <div class="nav" style="margin-top:30px;">
        <ul>
            <li class="nico01"><a href="###" onclick="choose(1)">首页</a></li>
            <li class="nico02"><a href="###" onclick="choose(2)">警力分布</a></li>
            <li class="nico03"><a href="###" onclick="choose(3)">点名系统</a></li>
            <li class="nico04"><a href="###" onclick="choose(4)">巡更系统</a></li>
            <li class="nico05on">数据汇总</li>
        </ul>
    </div>
    <div id="centerId" style=" float:left; margin-top:-680px; margin-left: 270px; height: 750px;
         background: none
    "
         class="easyui-tabs"
         data-options="region:'center',fit:true,border:false,plain:true">
        <div title="巡更" style="padding:10px;background: none">
            <a href="/toXgdc" class="easyui-linkbutton"><font
                    style="font-size: 16px">导 出</font> </a>
            <table id="xg" style="width:1100px" class="easyui-datagrid" title="巡更报告(${time})"
                   data-options="rownumbers:true,singleSelect:true,collapsible:true,autoRowHeight:false,pagination:true,pageSize:20">
                <thead>
                <tr>
                    <th data-options="field:'addrName',width:550,halign:'center'">地址名称</th>
                    <th data-options="field:'xgnum',width:500,halign:'center'">巡更次数</th>
                </tr>
                </thead>
            </table>

        </div>

        <div title="点名" style="padding:10px;background: none">
            <a href="/toDmdc" class="easyui-linkbutton"><font
                    style="font-size: 16px">导 出</font> </a>
            <table id="dm" style="width:1100px"
                   class="easyui-datagrid" title="点名报告(${time})"
                   data-options="rownumbers:true,singleSelect:true,collapsible:true, autoRowHeight:false,pagination:true,pageSize:20">
                <thead>
                <tr>
                    <th data-options="field:'name',width:550,halign:'center'">监区名称</th>
                    <th data-options="field:'pcount',width:500,halign:'center'">点名次数</th>
                </tr>
                </thead>
            </table>

        </div>
        <div title="警力" style="padding:10px;background: none">
            <a href="/toJldc" class="easyui-linkbutton"><font
                    style="font-size: 16px">导 出</font> </a>
            <table id="jl" style="width:1100px" class="easyui-datagrid" title="警力报告(${time})"
                   data-options="rownumbers:true,singleSelect:true,collapsible:true, autoRowHeight:false,pagination:true,pageSize:20">
                <thead>
                <tr>
                    <th data-options="field:'timeNodes',width:250,halign:'center'">时间(点)</th>
                    <th data-options="field:'mjis',width:200,halign:'center'">民警人数</th>
                    <th data-options="field:'sydwis',width:200,halign:'center'">事业单位人数</th>
                    <th data-options="field:'zgis',width:200,halign:'center'">职工人数</th>
                    <th data-options="field:'wdwis',width:200,halign:'center'">外单位人数</th>
                </tr>
                </thead>
            </table>

        </div>

        <div title="预警" style="padding:10px;background: none">
            <a href="/toYcdc" class="easyui-linkbutton"><font
                    style="font-size: 16px">导 出</font> </a>
            <table id="yc" style="width:1100px" class="easyui-datagrid" title="异常报告(${now})"
                   data-options="rownumbers:true,singleSelect:true,collapsible:true,autoRowHeight:false,pagination:true,pageSize:20">
                <thead>
                <tr>
                    <th data-options="field:'name',width:200,halign:'center'">名称</th>
                    <th data-options="field:'info',width:830,halign:'center'">异常</th>
                </tr>
                </thead>
            </table>

        </div>
    </div>
</div>

<!-----主体 结束------>
<div class="ttime"><p class="ttime01" id="sfm"></p>
    <p class="ttime02" id="nyr"></p>
    <p id="nongli"></p>
</div>


<script type="text/javascript">


    (function ($) {
        function pagerFilter(data) {
            if ($.isArray(data)) {	// is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var target = this;
            var dg = $(target);
            var state = dg.data('datagrid');
            var opts = dg.datagrid('options');
            if (!state.allRows) {
                state.allRows = (data.rows);
            }
            if (!opts.remoteSort && opts.sortName) {
                var names = opts.sortName.split(',');
                var orders = opts.sortOrder.split(',');
                state.allRows.sort(function (r1, r2) {
                    var r = 0;
                    for (var i = 0; i < names.length; i++) {
                        var sn = names[i];
                        var so = orders[i];
                        var col = $(target).datagrid('getColumnOption', sn);
                        var sortFunc = col.sorter || function (a, b) {
                                    return a == b ? 0 : (a > b ? 1 : -1);
                                };
                        r = sortFunc(r1[sn], r2[sn]) * (so == 'asc' ? 1 : -1);
                        if (r != 0) {
                            return r;
                        }
                    }
                    return r;
                });
            }
            var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = state.allRows.slice(start, end);
            return data;
        }

        var loadDataMethod = $.fn.datagrid.methods.loadData;
        var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
        $.extend($.fn.datagrid.methods, {
            clientPaging: function (jq) {
                return jq.each(function () {
                    var dg = $(this);
                    var state = dg.data('datagrid');
                    var opts = state.options;
                    opts.loadFilter = pagerFilter;
                    var onBeforeLoad = opts.onBeforeLoad;
                    opts.onBeforeLoad = function (param) {
                        state.allRows = null;
                        return onBeforeLoad.call(this, param);
                    }
                    var pager = dg.datagrid('getPager');
                    pager.pagination({
                        onSelectPage: function (pageNum, pageSize) {
                            opts.pageNumber = pageNum;
                            opts.pageSize = pageSize;
                            pager.pagination('refresh', {
                                pageNumber: pageNum,
                                pageSize: pageSize
                            });
                            dg.datagrid('loadData', state.allRows);
                        }
                    });
                    $(this).datagrid('loadData', state.data);
                    if (opts.url) {
                        $(this).datagrid('reload');
                    }
                });
            },
            loadData: function (jq, data) {
                jq.each(function () {
                    $(this).data('datagrid').allRows = null;
                });
                return loadDataMethod.call($.fn.datagrid.methods, jq, data);
            },
            deleteRow: function (jq, index) {
                return jq.each(function () {
                    var row = $(this).datagrid('getRows')[index];
                    deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                    var state = $(this).data('datagrid');
                    if (state.options.loadFilter == pagerFilter) {
                        for (var i = 0; i < state.allRows.length; i++) {
                            if (state.allRows[i] == row) {
                                state.allRows.splice(i, 1);
                                break;
                            }
                        }
                        $(this).datagrid('loadData', state.allRows);
                    }
                });
            },
            getAllRows: function (jq) {
                return jq.data('datagrid').allRows;
            }
        })
    })(jQuery);


    $(function () {

        $.ajax({
            type: 'post',
            url: '/toXGtongji',
            cache: false,
            dataType: 'json',
            success: function (data) {
                $('#xg').datagrid({data: data}).datagrid('clientPaging');

            }
        });
        $.ajax({
            type: 'post',
            url: '/toDmNum',
            cache: false,
            dataType: 'json',
            success: function (data) {
                $('#dm').datagrid({data: data}).datagrid('clientPaging');
            }
        });
        $.ajax({
            type: 'post',
            url: '/toYc',
            cache: false,
            dataType: 'json',
            success: function (data) {
                $('#yc').datagrid({data: data}).datagrid('clientPaging');
            }
        });
        $.ajax({
            type: 'post',
            url: '/toJlYesterdayTj',
            cache: false,
            dataType: 'json',
            success: function (data) {
                $('#jl').datagrid({data: data}).datagrid('clientPaging');
            }
        });

    });


    function refData() {}
    function refXunGeng() {}

</script>


</body>
</html>