<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <title>预警</title>

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
                                                        预警信息导出
                                                    </h4>
                                                    <div class="col-1">
                                                        <button type="button" id="exportDM" class="col-12 btn btn-warning waves-effect waves-light btn-md" onclick="window.location.href='/toYcdc'">
                                                            导出
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr style="border-color:#656565;">
                                    <div class="row">
                                        <jsp:include page="/statistic/wRecord"/>
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
<script src="assets/js/modernizr.min.js"></script>

</body>
</html>