<%@ page import="com.css.entity.YuzhengUser" %>
<%@ page import="com.css.util.IConstant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
%>
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

    <!-- Top Bar Start -->
    <div class="topbar">

        <!-- LOGO -->
        <div class="topbar-left">
            <div class="text-center">
                <a href="index.html" class="logo"><i class="mdi mdi-radar"></i> <span></span></a>
            </div>
        </div>

        <!-- Button mobile view to collapse sidebar menu -->
        <nav class="navbar-custom">

            <ul class="list-inline float-right mb-0">

                <li class="list-inline-item notification-list hide-phone">
                    <a class="nav-link waves-light waves-effect" href="#" id="btn-fullscreen">
                        <i class="mdi mdi-crop-free noti-icon"></i>
                    </a>
                </li>

                <li class="list-inline-item notification-list">
                    <a class="nav-link right-bar-toggle waves-light waves-effect" href="#">
                        <i class="mdi mdi-dots-horizontal noti-icon"></i>
                    </a>
                </li>

                <li class="list-inline-item dropdown notification-list">
                    <a class="nav-link dropdown-toggle arrow-none waves-light waves-effect" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="false" aria-expanded="false">
                        <i class="mdi mdi-bell noti-icon"></i>
                        <span class="badge badge-pink noti-icon-badge">4</span>
                    </a>

                </li>

                <li class="list-inline-item dropdown notification-list">
                    <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="false" aria-expanded="false">
                        <img src="assets/images/users/avatar-1.jpg" alt="user" class="rounded-circle">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right profile-dropdown " aria-labelledby="Preview">
                        <!-- item-->
                        <div class="dropdown-item noti-title">
                            <h5 class="text-overflow"><small>欢迎您：<%=user.getDisplayName()%></small> </h5>
                        </div>

                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <i class="mdi mdi-settings"></i>
                            <span>修改密码</span>
                        </a>

                        <!-- item-->
                        <a href="/statistic/logout" class="dropdown-item notify-item">
                            <i class="mdi mdi-logout"></i>
                            <span>登出</span>
                        </a>

                    </div>
                </li>

            </ul>

            <ul class="list-inline menu-left mb-0">
                <li class="float-left">
                    <button class="button-menu-mobile open-left waves-light waves-effect">
                        <i class="mdi mdi-menu"></i>
                    </button>
                </li>

                <li>

                    <img src="assets/images/logo1.png" height="80px"/>
                </li>

            </ul>
        </nav>

    </div>
    <!-- Top Bar End -->


    <!-- ========== Left Sidebar Start ========== -->
    <div class="left side-menu">
        <div class="sidebar-inner slimscrollleft">
            <!--- Divider -->
            <div id="sidebar-menu">
                <ul>
                    <li>
                        <a href="index.html" class="waves-effect waves-primary">
                            <i class="ti-home"></i><span> 首页 </span>
                        </a>
                    </li>
                    <li class="has_sub">
                        <a href="javascript:void(0);" class="waves-effect waves-primary">
                            <i class=" ti-user"></i> <span>警力分布</span>
                        </a>

                    </li>
                    <li>
                        <a href="typography.html" class="waves-effect waves-primary"><i
                                class=" ti-pencil-alt"></i><span> 点名系统 </span></a>
                    </li>
                    <li>
                        <a href="typography.html" class="waves-effect waves-primary">
                            <i class=" ti-loop"></i><span> 巡更系统 </span>
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
                                    <div  style="background:#EFF0EC; height:280px;"
                                          id="fzlxPie"></div>
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
                                            <div class="tit02">全部：<b class="cyans" id="jfyd">123</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tborder3"></div>
                                            <div class="tit02">出工：<b class="greens" id="jfsd">456</b></div>
                                        </div>
                                        <div class="itemwrap01" style="width:215px">
                                            <div class="tborder3"></div>
                                            <div class="tit02">未出工：<b class="reds" id="jfwd">789</b></div>
                                        </div>
                                    </div>
                                    <div class="widget-chart text-left">
                                        <div style="background:#EFF0EC; height:550px;" id="dianmingPie"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="float: right;" class="col-lg-5">
                                <div style="width: 100%"  >
                                    <div class="card-box">
                                        <h4 class="header-title m-t-0 m-b-30">
                                            实时预警平台
                                        </h4>

                                        <div class="widget-chart text-left" id="yjMsg" style="height: 130px;overflow-y: hidden;">

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
                                        <div style="background:#EFF0EC; height:450px;" id="jqNumBar"></div>
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

<!-- Plugins  -->
<script src="assets/js/modernizr.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
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

<!-- EASY PIE CHART JS -->
<script src="plugins/jquery.easy-pie-chart/dist/easypiechart.min.js"></script>
<script src="plugins/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
<script src="assets/pages/easy-pie-chart.init.js"></script>

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
<script src="assets/js/index-data.js" type="text/javascript"></script>
<script>
    var resizefunc = [];
    var contextPath = '${pageContext.request.contextPath}';
</script>
<script src="assets/js/index-data.js" type="text/javascript"></script>
</body>
</html>
