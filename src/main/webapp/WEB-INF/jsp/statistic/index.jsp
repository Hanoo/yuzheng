<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <base href="<%=request.getContextPath()%>/">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">

    <title>首页</title>

    <link href="plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
</head>


<body class="widescreen fixed-left-void">

<!-- Begin page -->
<div id="wrapper" class="forced enlarged">

    <%@ include file="topBar.jsp" %>

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-lg-3" >
                        <div class="row">
                            <div class="card-box">
                                <h4 class="header-title m-t-0 m-b-30">犯罪出生年段统计</h4>
                                <div class="widget-chart text-center">
                                    <div style="background:#EFF0EC; height:300px;" id="fzslBar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-box">
                                <h4 class=" header-title m-t-0 m-b-30">犯罪人员刑期统计</h4>

                                <div class="widget-chart text-center">
                                    <div  style="background:#EFF0EC; height:200px;" id="whcdBar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-box">
                                <h4 class=" header-title m-t-0 m-b-30">犯罪人员名族分布</h4>

                                <div class="widget-chart text-center">
                                    <div  style="background:#EFF0EC; height:200px;"
                                          id="mzBar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="card-box">
                                <h4 class=" header-title m-t-0 m-b-30">犯罪类型统计</h4>

                                <div class="widget-chart">
                                    <div  style="background:#EFF0EC; height:280px;" id="fzlxPie"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9" >
                        <div class="row">
                            <div style="float: left" class="col-lg-7">
                                <div class="card-box">
                                    <h4 class=" header-title m-t-0 m-b-30">
                                        实时监区点名汇总
                                    </h4>
                                    <div class="row" id="empTypeHJ2">
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tit02">全部：<b class="cyans" id="jfyd">-</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tit02">出工：<b class="greens" id="jfsd">-</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tit02">未出工：<b class="reds" id="jfwd">-</b></div>
                                        </div>
                                    </div>
                                    <div class="widget-chart text-left">
                                        <div style="background:#EFF0EC; height:720px;" id="dianmingPie"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="float: right;" class="col-lg-5">
                                <div style="width: 100%"  >
                                    <div class="card-box">
                                        <h4 class="header-title m-t-0 m-b-30">
                                            实时预警平台
                                        </h4>

                                        <div class="card m-b-20" style="height: 48px;overflow-y: hidden;">
                                            <ul class="list-group list-group-flush" id="dmAlarm">
                                                <li class='list-group-item'>暂无点名预警</li>
                                            </ul>
                                        </div>
                                        <div class="card m-b-20" style="height: 144px;overflow-y: hidden;">
                                            <ul class="list-group list-group-flush" id="othAlarm">
                                                <li class="list-group-item">暂无巡更或警力预警</li>
                                                <li class="list-group-item">暂无巡更或警力预警</li>
                                                <li class="list-group-item">暂无巡更或警力预警</li>
                                                <li class="list-group-item">暂无巡更或警力预警</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div style="width: 100%"  >
                                    <div class="card-box">
                                        <h4 class=" header-title m-t-0 m-b-30">
                                            警力分布
                                        </h4>
                                        <div class="row" id="empTypeHJ">
                                            <div class="clear"></div>
                                        </div>
                                        <div class="widget-chart text-left">
                                            <div  style="background:#EFF0EC; height:340px;" id="jlPie">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-lg-12"  >
                                <div class="card-box">
                                    <h4 class=" header-title m-t-0 m-b-30">
                                        各监区人数统计
                                    </h4>

                                    <div class="widget-chart text-center">
                                        <div style="background:#EFF0EC; height:430px;" id="jqNumBar"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->
    <div id="warning-modal" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">点名预警消除</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="operator" class="control-label">操作人</label>
                                <input type="text" class="form-control" id="operator" value="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="pcount" class="control-label">应到人数</label>
                                <input type="text" class="form-control" id="pcount" placeholder="应到人数">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="pcountsum" class="control-label">实到人数</label>
                                <input type="text" class="form-control" id="pcountsum" placeholder="实到人数">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group no-margin">
                                <label for="description" class="control-label">消除说明</label>
                                <textarea class="form-control" id="description" placeholder="请填写消除说明"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="eliminateMsg"></div>
                    <input type="hidden" id="endTime" value="" />
                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">关闭</button>
                    <button type="button" id="eliminate" class="btn btn-info waves-effect waves-light">消除</button>
                </div>
            </div>
        </div>
    </div>
    <div id="XG-modal" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">巡更异常处理</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="OpeName" class="control-label">操作人</label>
                                <input type="text" class="form-control" id="OpeName" value="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group no-margin">
                                <label for="EvenRec" class="control-label">消除说明</label>
                                <textarea class="form-control" id="EvenRec" placeholder="请填写消除说明"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="XGeliminateMsg"></div>
                    <input type="hidden" id="LogDate" value="" />
                    <input type="hidden" id="RegDate" value="" />
                    <input type="hidden" id="AddrID" value="" />
                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">关闭</button>
                    <button type="button" id="XGeliminate" class="btn btn-info waves-effect waves-light">处理</button>
                </div>
            </div>
        </div>
    </div>
    <div id="JL-modal" class="modal fade" tabindex="-1"
         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">警力异常处理</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="Oper" class="control-label">操作人</label>
                                <input type="text" class="form-control" id="Oper" value="">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group no-margin">
                                <label for="desc" class="control-label">解除说明</label>
                                <textarea class="form-control" id="desc" placeholder="请填写解除说明"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="JLeliminateMsg"></div>
                    <input type="hidden" id="starttime" value="" />
                    <input type="hidden" id="jlendtime" value="" />
                    <input type="hidden" id="dept_id" value="" />
                    <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">关闭</button>
                    <button type="button" id="JLeliminate" class="btn btn-info waves-effect waves-light">处理</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->

<!-- Plugins  -->
<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/popper.min.js"></script><!-- Popper for Bootstrap -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/detect.js"></script>
<script src="assets/js/fastclick.js"></script>
<script src="assets/js/jquery.slimscroll.js"></script>
<script src="assets/js/jquery.blockUI.js"></script>
<script src="assets/js/waves.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/jquery.nicescroll.js"></script>
<script src="assets/js/jquery.scrollTo.min.js"></script>
<script src="plugins/switchery/switchery.min.js"></script>

<!-- KNOB JS -->
<!--[if IE]>
<script src="plugins/jquery-knob/excanvas.js" type="text/javascript"></script>
<![endif]-->
<script src="plugins/jquery-knob/jquery.knob.js"></script>

<!-- Circliful -->
<script src="plugins/jquery-circliful/js/jquery.circliful.min.js"></script>

<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>
<script src="style/js/echart3/echarts.min.js"></script>
<script src="assets/js/jquery.scrollQ.js" type="text/javascript"></script>
<script type="text/javascript">
    var scrollQ1,scrollQ2;
    var timerMapper = new Array();
    var resizefunc = [];
    var contextPath = '${pageContext.request.contextPath}';
    var elimateTarget;
    $(document).on("click", ".dmAlarm-li", function(){
        elimateTarget = $(this);
        $("#endTime").val($(this).attr("endTime"));
        var area = $("#eliminateMsg");
        showFdBkInfo("", area, "success");
    });

    $(document).on("click", ".xgAlarm-li", function(){
        elimateTarget = $(this);
        $("#LogDate").val($(this).attr("LogDate"));
        $("#RegDate").val($(this).attr("RegDate"));
        $("#AddrID").val($(this).attr("AddrID"));
        var area = $("#XGeliminateMsg");
        showFdBkInfo("", area, "success");
    });

    $(document).on("click", ".jlAlarm-li", function(){
        elimateTarget = $(this);
        $("#starttime").val($(this).attr("starttime"));
        $("#jlendtime").val($(this).attr("endtime"));
        $("#dept_id").val($(this).attr("dept_id"));
        var area = $("#JLeliminateMsg");
        showFdBkInfo("", area, "success");
    });

    // 消除点名预警
    $(document).ready(function(){
        $("#eliminate").on("click", function(){
            var area = $("#eliminateMsg");
            showFdBkInfo("", area, "success");
            if(isSupervise) {
                showFdBkInfo("监管员无权消除预警！", area, "error");
                return false;
            }
            var description = $("#description").val();
            if(!description) {
                showFdBkInfo("请填写消除预警的描述", area, "error");
                return false;
            }
            $.ajax({
                type:"post",
                url:"statistic/eliminateDM",
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({"endTime":$("#endTime").val(),"pcount":$("#pcount").val(), "pcountsum":$("#pcountsum").val(), "description":description}),
                dataType: 'json',
                success:function(data){
                    if(data.msg=="failed"){
                        showFdBkInfo("消除预警失败！",area, "error");
                    } else if (data.msg=="error") {
                        showFdBkInfo("服务器内部错误！",area, "error");
                    } else {
                        showFdBkInfo("消除预警成功。",area, "success");
                        $("#description").val("");
                        if(elimateTarget) {
                            elimateTarget.remove();
                            if($("#dmAlarm").find("li").length==0) {
                                $("#dmAlarm").append("<li class='list-group-item'>暂无点名预警</li>");
                                if(scrollQ1) {
                                    cleanScrollQ(scrollQ1, "timer1");
                                }
                            }
                        }
                    }
                }

            });
        });

        // 处理巡更异常
        $("#XGeliminate").on("click", function(){
            var area = $("#XGeliminateMsg");
            showFdBkInfo("", area, "success");
            var EvenRec = $("#EvenRec").val();
            if(!EvenRec) {
                showFdBkInfo("请填写异常处理的描述", area, "error");
                return false;
            }
            $.ajax({
                type:"post",
                url:"statistic/eliminateXG",
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({"RegDate":$("#RegDate").val(),"LogDate":$("#LogDate").val(), "AddrID":$("#AddrID").val(), "EvenRec":$("#EvenRec").val(), "OpeName":$("#OpeName").val()}),
                dataType: 'json',
                success:function(data){
                    if(data.msg=="failed"){
                        showFdBkInfo("异常处理失败！", area, "error");
                    } else if (data.msg=="error") {
                        showFdBkInfo("服务器内部错误！", area, "error");
                    } else {
                        showFdBkInfo("异常处理成功。", area, "success");
                        $("#EvenRec").val("");
                        if(elimateTarget) {
                            console.log(elimateTarget.attr("class"));
                            elimateTarget.remove();
                            if($("#othAlarm").find("li").length==0) {
                                $("#othAlarm").append("<li class='list-group-item'>暂无异常需要处理</li>");
                                if(scrollQ2) {
                                    cleanScrollQ(scrollQ2,"timer2");
                                }
                            }
                        }
                    }
                }

            });
        });

        // 处理警力异常
        $("#JLeliminate").on("click", function(){
            var area = $("#JLeliminateMsg");
            showFdBkInfo("", area, "success");
            if(isSupervise) {
                showFdBkInfo("监管员无权消除预警！", area, "error");
                return false;
            }
            var starttime = $("#starttime").val();
            if(!starttime) {
                showFdBkInfo("请先消除点名预警！", area, "error");
                return false;
            }
            var desc = $("#desc").val();
            if(!desc) {
                showFdBkInfo("请填写消除预警的原因描述", area, "error");
                return false;
            }
            $.ajax({
                type:"post",
                url:"statistic/eliminateJl",
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({"operator":$("#Oper").val(),"starttime":starttime, "endtime":$("#jlendtime").val(), "description":$("#desc").val(), "dept_id":$("#dept_id").val()}),
                dataType: 'json',
                success:function(data){
                    if(data.msg=="failed"){
                        showFdBkInfo("警力预警消除失败！", area, "error");
                    } else if (data.msg=="error") {
                        showFdBkInfo("服务器内部错误！", area, "error");
                    } else {
                        showFdBkInfo("警力预警消除成功。", area, "success");
                        $("#desc").val("");
                        if(elimateTarget) {
                            elimateTarget.remove();
                            if($("#othAlarm").find("li").length==0) {
                                $("#othAlarm").append("<li class='list-group-item'>暂无异常需要处理</li>");
                                if(scrollQ2) {
                                    cleanScrollQ(scrollQ2,"timer2");
                                }
                            }
                        }
                    }
                }

            });
        });


    });

    function showFdBkInfo(msg, area, type){
        var fontColor = "green";
        if("error"==type) {
            fontColor = "red";
        }
        area.css("color", fontColor).html(msg);
    }
</script>
<script src="assets/js/index-data.js" type="text/javascript"></script>
</body>
</html>
