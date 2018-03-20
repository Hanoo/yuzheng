<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Calendar calendar = Calendar.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">
    <title>辽宁省第二监狱管理信息</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/yz.css" rel="stylesheet" type="text/css">
</head>


<body class="fixed-left">

<!-- Begin page -->
<div id="wrapper">

    <!-- Top Bar Start -->
    <div class="">
        <h1 class="text-center title-name">辽宁省第二监狱管理信息</h1>
    </div>
    <!-- Top Bar End -->

    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <h4 class=" text-center">
                                <span class="color-g"><%=calendar.get(Calendar.YEAR)%> </span>年
                                <span class="color-g"><%=calendar.get(Calendar.MONTH)+1%></span> 月
                                <span class="color-g"><%=calendar.get(Calendar.DAY_OF_MONTH)%></span> 日
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <h3 class="m-t-0  text-center zb-bottom shou2-title">管理信息</h3>
                            <div class="shou2-bottom">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            警察总数<code id="pQuantity">555</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            押犯总数 <code id="prisonerQuantity">2921</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            监区数量 <code id="prisonAreaQuantity">13</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            值班警力 <code id="policeOnDuty">36</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            执勤警力 <code id="policeOnPatrol">276</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-16 m-b-20">
                                            备勤警力 <code id="policeInReserve">23</code>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="shou2-bottom">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            死缓犯数 <code class="text-pink">937</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            无期犯数 <code class="text-pink">746</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            限减犯数 <code class="text-pink">17</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            累惯犯数 <code class="text-pink">179</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            涉毒犯数 <code class="text-pink">718</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            涉黑犯数 <code class="text-pink">40</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            邪教犯数 <code class="text-pink">0</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            人员总数 <code class="text-pink">417</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            外省犯数 <code class="text-pink">1327</code>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="shou2-bottom">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            外籍犯数 <code class="text-warning">0</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            假释犯数 <code class="text-warning">0</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            保外犯数 <code class="text-warning">12</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            在逃犯数 <code class="text-warning">0</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            收监人数 <code class="text-warning">0</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            释放人数 <code class="text-warning">0</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            外诊人数 <code class="text-warning">4</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            禁闭人数 <code class="text-warning">28</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            严管人数 <code class="text-warning">32</code>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            会见人数 <code class="text-warning">14</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            外协人员 <code class="text-warning">76</code>
                                        </p>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <p class="text-muted font-14 m-b-20">
                                            外来车辆 <code class="text-warning">4</code>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            2017 - 2018 © copy <span class="hide-phone">- lingyuanjianju.com</span>
        </footer>
    </div>
</div>
</body>
</html>
