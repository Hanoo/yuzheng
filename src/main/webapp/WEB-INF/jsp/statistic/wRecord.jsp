<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">
    <link rel="shortcut icon" href="assets/images/favicon_1.ico">

    <title>点名</title>

    <link href="style/js/easyui/themes/black/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/statistic.css" rel="stylesheet" type="text/css"/>
    <style>
        .card-box {
            padding: 20px;
            border: 1px solid rgba(54, 64, 74, 0.08);
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -moz-border-radius: 5px;
            background-clip: padding-box;
            margin-bottom: 20px;
            background-color: #36404a;
            width: 100%;
        }
        .header-title {
            text-transform: uppercase;
            font-size: 21px;
            font-weight: 700;
            line-height: 16px;
            margin-bottom: 8px;
            margin-top: 0;
        }
        .tborder3 {
            clear: both;
            font-size: 1px;
            height: 3px;
            line-height: 3px;
            background: #fff;
            -moz-opacity: 0.4;
            -khtml-opacity: 0.4;
            opacity: 0.4;
            filter: alpha(opacity=40);
        }
        .tit02 {
            font-size: 21px;
            color: #fff;
            font-weight: bold;
            height: 44px;
            line-height: 44px;
        }
        .greens {
            color: #00ff00;
        }
        .s-left{
            margin-right: 15px;
            color:#98a6ad;
        }
        .hz-right{
            margin-top: 60px;
            padding: 30px 5px;
            background-color: #3c4652;
            border-radius: 8px;
        }
        .hz-r-bj{
            background-color: #3c4652;
            margin-bottom: 0;
        }
        .line-2{
            border-color:#55616d;
        }
    </style>
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
                    <div class="col-lg-12" >
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-box">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="page-title-box" style="box-shadow:none;margin: 0;">
                                                <div class=" row">
                                                    <h4 class="col-2 header-title m-t-0 " style="margin-bottom: 0;padding: 14px 10px 10px 0;">
                                                        实时监区点名汇总
                                                    </h4>
                                                    <label class="col-4 col-form-label text-right" style="line-height: 30px">请输入查询日期：</label>
                                                    <div class="col-2">
                                                        <input class="form-control" type="date" id="date">
                                                    </div>

                                                    <div class="col-2">
                                                        <input class="form-control" type="time" id="time" value="00:00">
                                                    </div>
                                                    <div class="col-1">
                                                        <button type="button" id="searchDM" class="col-12 btn btn-primary waves-effect waves-light btn-md">
                                                            搜索
                                                        </button>
                                                    </div>
                                                    <div class="col-1">
                                                        <button type="button" id="exportDM" class="col-12 btn btn-warning waves-effect waves-light btn-md">
                                                            导出
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr style="border-color:#656565;">
                                    <div class="row" id="empTypeHJ2">
                                        <div class="itemwrap01 col-lg-4 text-center ">
                                            <div class="tit02">
                                                <h4>服刑人员出工汇总</h4>
                                                <hr>
                                                <h5>
                                                    <span class="s-left">出工：<b class="greens" id="sdNumAll">586</b></span>
                                                    <span class="s-left">全部：<b class="text-white" id="ydNumAll">2831</b></span>
                                                    <span class="s-left">未出工：<b class="text-danger" id="wdNumAll">2245</b></span>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="itemwrap01 col-lg-4 text-center">
                                            <div class="tit02">
                                                <h4>警力汇总</h4>
                                                <hr>
                                                <h5>
                                                    <span class="s-left">执勤：<b class="greens" id="realCountAll">561</b></span>
                                                    <span class="s-left">全部：<b class="text-white" id="planCountAll">561</b></span>
                                                    <span class="s-left">未执勤：<b class="text-danger" id="wdjlCountAll">0</b></span>
                                                </h5>
                                            </div>
                                        </div>
                                        <div class="itemwrap01 col-lg-4 text-center">
                                            <div class="tit02">
                                                <h4>警力匹配度</h4>
                                                <hr>
                                                <h5>
                                                    <span class="s-left">匹配度：<b class="greens" id="percAll">95.73%</b></span>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row col-sm-12">
                                        <div class="col-lg-8 ">
                                            <div class="widget-chart ">
                                                <div style="background:#EFF0EC; height:550px;" id="dianmingPie"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 hz-right">
                                            <div class="card-box hz-r-bj">
                                                <h4><span id="jqname"></span>统计汇总</h4>
                                                <hr class="line-2">
                                                <p>
                                                    <span class="s-left">出工：<b class="greens" id="sdNum">-</b></span>
                                                    <span class="s-left">全部：<b class="text-white" id="ydNum">-</b></span>
                                                    <span class="s-left"><a href="javascript:wdDm();">未出工：<b class="text-danger" id="wdNum">-</b></a></span>
                                                </p>
                                            </div>
                                            <div class="card-box hz-r-bj">
                                                <h4>警力汇总</h4>
                                                <hr class="line-2">
                                                <p>
                                                    <span class="s-left">执勤：<b class="greens" id="realCount">-</b></span>
                                                    <span class="s-left">全部：<b class="text-white" id="planCount">-</b></span>
                                                    <span class="s-left">未执勤：<b class="text-danger" id="wdjlNum">-</b></span>
                                                </p>
                                            </div>
                                            <div class="card-box hz-r-bj">
                                                <h4>警力匹配度</h4>
                                                <hr class="line-2">
                                                <p>
                                                    <span class="s-left">匹配度：<b class="greens" id="perc">--</b></span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="dlg"></div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end content -->

</div>
<!-- ============================================================== -->
<!-- End Right content here -->
<!-- ============================================================== -->

</div>
<!-- END wrapper -->

<script>
    var resizefunc = [];
</script>

<!-- Plugins  -->
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
<script src="assets/js/modernizr.min.js"></script>
<script src="style/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="assets/js/dianMing-data.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){

    });
</script>
</body>
</html>
