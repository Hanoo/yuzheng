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
    <title>辽宁省第二监狱值班信息</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <link href="assets/css/yz.css" rel="stylesheet" type="text/css">
</head>

<body class="fixed-left">
<!-- Begin page -->
<div id="wrapper">
    <!-- Top Bar Start -->
    <div class="">
        <h1 class="text-center title-name">辽宁省第二监狱值班信息</h1>
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
                                <span class="color-g"><%=calendar.get(Calendar.MONTH)%></span> 月
                                <span class="color-g"><%=calendar.get(Calendar.DAY_OF_MONTH)%></span> 日
                            </h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="widget-simple text-center card-box">
                            <h3 class=" text-pink counter font-bold mt-0" id="pQuantity">2562</h3>
                            <p class="text-muted mb-0">押犯总数</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="widget-simple text-center card-box">
                            <h3 class="text-success font-bold mt-0"><span class="counter" id="pRealQuantity">480</span></h3>
                            <p class="text-muted mb-0">实押人数</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="widget-simple text-center card-box">
                            <h3 class="text-primary counter font-bold mt-0" id="policeQuantity">5685</h3>
                            <p class="text-muted mb-0">干警总数</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="widget-simple text-center card-box">
                            <h3 class="text-warning counter font-bold mt-0" id="policeOnDutyQuantity">62</h3>
                            <p class="text-muted mb-0">执勤人数</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card-box">
                            <h3 class="m-t-0 text-center zb-bottom">值班信息</h3>
                            <table class="table  table-bordered table-striped tablesaw">
                                <thead class="thead-default">
                                <tr>
                                    <th >部门中心</th>
                                    <th >负责人</th>
                                    <th >联系电话</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>总值班长：</td>
                                    <td><span class="zhiban-name" id="chiefOfficer">王兴国</span></td>
                                    <td id="chiefOfficerTel">87665900-01</td>
                                </tr>
                                <tr>
                                    <td>值&nbsp;&nbsp;班&nbsp;&nbsp;长：</td>
                                    <td><span class="zhiban-name" id="officer">王兴国</span></td>
                                    <td id="officerTel">87665900-01</td>
                                </tr>
                                <tr>
                                    <td>值&nbsp;&nbsp;班&nbsp;&nbsp;员：</td>
                                    <td><span class="zhiban-name" id="pOnDuty">王兴国</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>检&nbsp;&nbsp;查&nbsp;&nbsp;站：</td>
                                    <td><span class="zhiban-name" id="pInStation">王兴国</span></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>指挥中心：</td>
                                    <td><span class="zhiban-name" id="pInCommandCenter">王兴国</span></td>
                                    <td></td>
                                </tr>
                                </tbody>
                            </table>
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
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/prison.js"></script>
<script>
    $(document).ready(function(){
        var dutyInfo = ${dutyInfo};
        if(dutyInfo!="null") {
            loadData(dutyInfo);
        }
    });
</script>