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
    <link href="assets/css/statistic.css" rel="stylesheet" type="text/css">
</head>


<body class="widescreen fixed-left-void">

<!-- Begin page -->
<div id="wrapper" class="forced enlarged">

    <%@ include file="topBar.jsp" %>

    <!-- ========== Left Sidebar Start ========== -->
    <div class="left side-menu">
        <div class="sidebar-inner slimscrollleft">
            <!--- Divider -->
            <div id="sidebar-menu">
                <ul>
                    <li>
                        <a href="/statistic/index" class="waves-effect waves-primary">
                            <i class="ti-home"></i>
                            <span> 首页 </span>
                        </a>
                    </li>
                    <li class="has_sub">
                        <a href="/statistic/jingLi" class="waves-effect waves-primary">
                            <i class=" ti-user"></i>
                            <span>警力分布</span>
                        </a>

                    </li>
                    <li>
                        <a href="/statistic/dianMing" class="waves-effect waves-primary">
                            <i class=" ti-pencil-alt"></i>
                            <span> 点名系统 </span>
                        </a>
                    </li>
                    <li>
                        <a href="/statistic/xunGeng" class="waves-effect waves-primary">
                            <i class=" ti-loop"></i>
                            <span> 巡更系统 </span>
                        </a>
                    </li>
                </ul>

                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- Left Sidebar End -->


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
                                            <div class="tborder3"></div>
                                            <div class="tit02">全部：<b class="cyans" id="jfyd">-</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tborder3"></div>
                                            <div class="tit02">出工：<b class="greens" id="jfsd">-</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tborder3"></div>
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
                                            <ul class="list-group list-group-flush bulletin" id="dmAlarm">
                                                <li class="list-group-item">暂无点名预警</li>
                                            </ul>
                                        </div>
                                        <div class="card m-b-20" style="height: 144px;overflow-y: hidden;">
                                            <ul class="list-group list-group-flush bulletin" id="othAlarm">
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
                    <h4 class="modal-title">预警消除</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="operator" class="control-label">操作人</label>
                                <input type="text" class="form-control" id="operator" value="监区管理员">
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
<script src="assets/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script type="text/javascript">

    var resizefunc = [];
    var contextPath = '${pageContext.request.contextPath}';
    $(document).on("click", ".dmAlarm-li", function(){
        $("#endTime").val($(this).attr("endTime"));
    });
    $(document).ready(function(){
        $("#eliminate").on("click", function(){
            showFdBkInfo("", "success");
            if(isSupervise) {
                showFdBkInfo("监管员无权消除预警！", "error");
                return false;
            }
            var description = $("#description").val();
            if(!description) {
                showFdBkInfo("请填写消除预警的描述", "error");
                return false;
            }
            $.ajax({
                type:"post",
                url:"statistic/eliminateWarning",
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({"endTime":$("#endTime").val(),"pcount":$("#pcount").val(), "pcountsum":$("#pcountsum").val(), "description":description}),
                dataType: 'json',
                success:function(data){
                    if(data.msg=="failed"){
                        showFdBkInfo("消除预警失败！", "error");
                    } else if (data.msg=="error") {
                        showFdBkInfo("服务器内部错误！", "error");
                    } else {
                        showFdBkInfo("消除预警成功。", "success");
                        $("#description").val("");
                    }
                }

            });
        });
    });
    function showFdBkInfo(msg, type){
        var fontColor = "green";
        if("error"==type) {
            fontColor = "red";
        }
        $("#eliminateMsg").css("color", fontColor).html(msg);
    }
</script>
<script src="assets/js/index-data.js" type="text/javascript"></script>
</body>
</html>
