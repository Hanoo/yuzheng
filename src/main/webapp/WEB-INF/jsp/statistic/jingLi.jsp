<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Map<String, String> inConfig = (Map<String, String>) session.getAttribute(IConstant.IntervalConfig);
    String refDataIntervalJingLi = inConfig.get("refDataIntervalJingLi")==null?"5":inConfig.get("refDataIntervalJingLi");
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <link href="assets/images/favicon_1.ico" rel="shortcut icon">

    <title>警力</title>
    <link href="style/css/main.css" rel="stylesheet" type="text/css"/>
    <link href="style/js/easyui/themes/black/easyui.css" rel="stylesheet" type="text/css"/>
    <link href="style/js/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
    <link href="plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
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

                                <div >
                                    <div class="card-box">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <div class="page-title-box" style="box-shadow:none;margin: 0;">
                                                    <div class=" row">
                                                        <h4 class="col-2 header-title m-t-0 " style="margin-bottom: 0;padding: 14px 10px 10px 0;">
                                                            警力分布汇总
                                                        </h4>
                                                        <!--
                                                        <label class="col-3 col-form-label text-right" style="line-height: 30px">请输入查询日期：</label>
                                                        <div class="col-3">
                                                            <input class="form-control" type="date" name="date">
                                                        </div>
                                                        <div class=" text-center" style="width: 20px; line-height: 40px">
                                                            至
                                                        </div>
                                                        <div class="col-3">
                                                            <input class="form-control" type="date" name="date">
                                                        </div>
                                                        <button type="submit" class="btn btn-primary waves-effect waves-light btn-md">
                                                            搜索
                                                        </button>
                                                        -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr style="border-color:#656565;">
                                        <div class="row" id="empTypeCount"></div>
                                        <div class="widget-chart text-left">
                                            <div style="background:#EFF0EC; height:550px;" id="jlPie"></div>
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
<script type="text/javascript" src="../plugins/jquery-knob/excanvas.js"></script>
<![endif]-->
<script src="plugins/jquery-knob/jquery.knob.js"></script>

<!-- Circliful -->
<script src="plugins/jquery-circliful/js/jquery.circliful.min.js"></script>
<script src="assets/js/jquery.core.js"></script>
<script src="assets/js/jquery.app.js"></script>
<script src="style/js/echart3/echarts.min.js"></script>
<script src="style/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="assets/js/jingLi-data.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        refData();
        setInterval(refData, 1000 * 60 * <%=refDataIntervalJingLi%>);
    });
</script>
</body>
</html>