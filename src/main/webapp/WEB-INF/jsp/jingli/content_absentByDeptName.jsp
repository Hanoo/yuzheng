<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>警力分布</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/js/easyui/themes/black/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/js/easyui/themes/icon.css"/>

    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/echart3/jquery-2.0.3.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/style/js/easyui/jquery.easyui.min.js"></script>
</head>
<body class="body01">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/css/customdatagrid.css"/>

<input type="hidden" name="deptName" id="deptName" value="${deptName}"/>
<table id="dg" style="width:780px;height:560px" data-options="
				rownumbers:true,
				singleSelect:true,
				autoRowHeight:false,
				pagination:true,
				pageSize:20
                " >
    <thead>
    <tr>
        <th field="empName" width="280">姓名</th>
        <th field="typeName" width="300">人员类型</th>
        <th field="status" width="168" data-options="formatter:formatStatus">状态</th>

    </tr>
    </thead>
</table>

<script type="text/javascript">
    /*$(function(){
        var pager = $('#dg').datagrid().datagrid('getPager');	// get the pager of datagrid
        $(pager).pagination({
            pageSize: 10, //每页显示的记录条数，默认为10
            pageList: [5, 10, 15], //可以设置每页记录条数的列表
            onSelectPage: function (pageNumber, pageSize) {
                //alert(pageNumber +" "+pageSize);
                //Query();//分页查询
                query();//分页查询
            }
        });
        pager.pagination({
            buttons:[{
                /!*iconCls:'icon-search',
                handler:function(){
                    alert('search');
                }
            },{
                iconCls:'icon-add',
                handler:function(){
                    alert('add');
                }
            },{
                iconCls:'icon-edit',
                handler:function(){
                    alert('edit');
                }*!/
            }]
        });
    })

    /!*分页查询*!/
    function query() {
        var opts = $('#dg').datagrid('options');
        var page = opts.pageNumber;//获取页码
        var pageSize = opts.pageSize;//获取每页多少记录
        //var handler = "Ajax/GetWellListHandler.ashx?wellNo=" + escape(wellNo) + "&page=" + escape(page)+ "&pageSize=" + escape(pageSize);

        alert(page + "ss" +pageSize);
        //$('#dg').datagrid('options').url = handler; //设置表格数据的来源URL
        //$('#dg').datagrid('reload'); //重新加载表格
    }*/


    (function($){
        function pagerFilter(data){
            if ($.isArray(data)){	// is array
                data = {
                    total: data.length,
                    rows: data
                }
            }
            var target = this;
            var dg = $(target);
            var state = dg.data('datagrid');
            var opts = dg.datagrid('options');
            if (!state.allRows){
                state.allRows = (data.rows);
            }
            if (!opts.remoteSort && opts.sortName){
                var names = opts.sortName.split(',');
                var orders = opts.sortOrder.split(',');
                state.allRows.sort(function(r1,r2){
                    var r = 0;
                    for(var i=0; i<names.length; i++){
                        var sn = names[i];
                        var so = orders[i];
                        var col = $(target).datagrid('getColumnOption', sn);
                        var sortFunc = col.sorter || function(a,b){
                                return a==b ? 0 : (a>b?1:-1);
                            };
                        r = sortFunc(r1[sn], r2[sn]) * (so=='asc'?1:-1);
                        if (r != 0){
                            return r;
                        }
                    }
                    return r;
                });
            }
            var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
            var end = start + parseInt(opts.pageSize);
            data.rows = state.allRows.slice(start, end);
            return data;
        }

        var loadDataMethod = $.fn.datagrid.methods.loadData;
        var deleteRowMethod = $.fn.datagrid.methods.deleteRow;
        $.extend($.fn.datagrid.methods, {
            clientPaging: function(jq){
                return jq.each(function(){
                    var dg = $(this);
                    var state = dg.data('datagrid');
                    var opts = state.options;
                    opts.loadFilter = pagerFilter;
                    var onBeforeLoad = opts.onBeforeLoad;
                    opts.onBeforeLoad = function(param){
                        state.allRows = null;
                        return onBeforeLoad.call(this, param);
                    }
                    var pager = dg.datagrid('getPager');
                    pager.pagination({
                        onSelectPage:function(pageNum, pageSize){
                            opts.pageNumber = pageNum;
                            opts.pageSize = pageSize;
                            pager.pagination('refresh',{
                                pageNumber:pageNum,
                                pageSize:pageSize
                            });
                            dg.datagrid('loadData',state.allRows);
                        }
                    });
                    $(this).datagrid('loadData', state.data);
                    if (opts.url){
                        $(this).datagrid('reload');
                    }
                });
            },
            loadData: function(jq, data){
                jq.each(function(){
                    $(this).data('datagrid').allRows = null;
                });
                return loadDataMethod.call($.fn.datagrid.methods, jq, data);
            },
            deleteRow: function(jq, index){
                return jq.each(function(){
                    var row = $(this).datagrid('getRows')[index];
                    deleteRowMethod.call($.fn.datagrid.methods, $(this), index);
                    var state = $(this).data('datagrid');
                    if (state.options.loadFilter == pagerFilter){
                        for(var i=0; i<state.allRows.length; i++){
                            if (state.allRows[i] == row){
                                state.allRows.splice(i,1);
                                break;
                            }
                        }
                        $(this).datagrid('loadData', state.allRows);
                    }
                });
            },
            getAllRows: function(jq){
                return jq.data('datagrid').allRows;
            }
        })
    })(jQuery);


    $(function(){
        //$('.datagrid-cell').css('font-size','25px');//改的是datagrid中的数据
       // $('.datagrid-header .datagrid-cell span ').css('font-size','36px');//datagrid中的列名称
        //部门编号
        var deptName = $("#deptName").val();

        $.ajax({
            type:'post',
            url:'/toJlAbsentByDeptName',
            data:{deptName:deptName},
            cache:false,
            dataType:'json',
            success:function(data){
                $('#dg').datagrid({data:data}).datagrid('clientPaging');
                }
        });

    });

function formatStatus(val,row) {
    return '未值勤';
}

</script>
</body>
</html>
