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

    <link href="plugins/jquery-circliful/css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/statistic.css" rel="stylesheet" type="text/css"/>
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
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr style="border-color:#656565;">
                                    <div class="row" id="empTypeHJ2">
                                        <div class="itemwrap01 col-lg-3 text-center">
                                            <div class="tit02">全部：<b class="cyans" id="jfyd">561</b></div>
                                        </div>
                                        <div class="itemwrap01 col-lg-3 text-center" >
                                            <div class="tit02">出工：<b class="greens" id="jfsd">166</b></div>
                                        </div>
                                        <div class="itemwrap01 col-lg-3 text-center" >
                                            <div class="tit02">未出工：<b class="reds" id="jfwd">235</b></div>
                                        </div>
                                    </div>
                                    <div class="widget-chart text-left">
                                        <div style="background:#EFF0EC; height:550px;" id="dianmingPie"></div>
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
<script src="assets/js/dianMing-data.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
        refDianming();
        setInterval(refDianming, 1000 * 60 * 10);
    });
</script>
</body>
</html>
