<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=request.getContextPath()%>/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <title>狱政管理后台</title>

    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="plugins/morris/morris.css" rel="stylesheet">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
    <style>
        .title-list{
            width:150px;
        }
        .p-content{
            margin-top: 70px;
            margin-bottom: 70px;
        }
        .topbar .topbar-left{
            background-color: #323b44;
        }
        .topbar .topbar-left span{
            color:#ffffff;
        }
        .footer{
            left:0;
        }
    </style>
</head>

<body class="fixed-left">

<!-- Begin page -->
<div id="wrapper">

    <!-- Top Bar Start -->
    <div class="topbar">

        <!-- LOGO -->
        <div class="topbar-left">
            <div class="text-center">
                <a href="index.html" class="logo"><i class="mdi mdi-radar"></i><span>监狱管理系统后台</span></a>
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
                <li class="list-inline-item dropdown notification-list">
                    <a class="nav-link dropdown-toggle waves-effect waves-light nav-user" data-toggle="dropdown" href="#" role="button"
                       aria-haspopup="false" aria-expanded="false">
                        <img src="assets/images/users/avatar-1.jpg" alt="user" class="rounded-circle">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right profile-dropdown " aria-labelledby="Preview">
                        <!-- item-->
                        <div class="dropdown-item noti-title">
                            <h5 class="text-overflow"><small>欢迎使用</small> </h5>
                        </div>
                        <!-- item-->
                        <a href="javascript:void(0);" class="dropdown-item notify-item">
                            <i class="mdi mdi-logout"></i> <span>登出</span>
                        </a>
                    </div>
                </li>
            </ul>
        </nav>

    </div>
    <!-- Top Bar End -->

    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="p-content">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <div class="row">

                    <div class="col-md-12">
                        <div class="card-box">
                            <ul class="nav nav-pills navtab-bg nav-justified tabs-bordered">
                                <li class="text-center title-list" >
                                    <a href="#profile1" data-toggle="tab" aria-expanded="true" class=" nav-link active m-b-5">
                                        管理信息
                                    </a>
                                </li>
                                <li class="text-center title-list" id="listHome">
                                    <a href="#home1" data-toggle="tab" aria-expanded="false" class="nav-link m-b-5">
                                        值班信息
                                    </a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="profile1">
                                    <div class="form-group row">
                                        <label for="mpQuantity" class="col-3 text-right col-form-label">警察总数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="mpQuantity" placeholder="警察总数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerQuantity" class="col-3 text-right col-form-label">押犯总数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerQuantity" placeholder="押犯总数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonAreaQuantity" class="col-3 text-right col-form-label">监区数量</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonAreaQuantity" placeholder="监区数量">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="policeOnDuty" class="col-3 text-right col-form-label">值班警力</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="policeOnDuty" placeholder="值班警力">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="policeOnPatrol" class="col-3 text-right col-form-label">执勤警力</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="policeOnPatrol" placeholder="执勤警力">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="policeInReserve" class="col-3 text-right col-form-label">备勤警力</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="policeInReserve" placeholder="备勤警力">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerInReprieve" class="col-3 text-right col-form-label">死缓犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerInReprieve" placeholder="死缓犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerInLife" class="col-3 text-right col-form-label">无期犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerInLife" placeholder="无期犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerInRoc" class="col-3 text-right col-form-label">限减犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerInRoc" placeholder="限减犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerRecidivist" class="col-3 text-right col-form-label">累惯犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerRecidivist" placeholder="累惯犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerDrugRelated" class="col-3 text-right col-form-label">涉毒犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerDrugRelated" placeholder="涉毒犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerMobdomRelated" class="col-3 text-right col-form-label">涉黑犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerMobdomRelated" placeholder="涉黑犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerCultRelated" class="col-3 text-right col-form-label">邪教犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerCultRelated" placeholder="邪教犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerOldSick" class="col-3 text-right col-form-label">病弱犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerOldSick" placeholder="病弱犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerOutsider" class="col-3 text-right col-form-label">外省犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerOutsider" placeholder="外省犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerForeigner" class="col-3 text-right col-form-label">外籍犯数 </label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerForeigner" placeholder="外籍犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerParole" class="col-3 text-right col-form-label">假释犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerParole" placeholder="假释犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerProbation" class="col-3 text-right col-form-label">保外犯数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerProbation" placeholder="保外犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerAtLarge" class="col-3 text-right col-form-label">在逃犯数 </label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerAtLarge" placeholder="在逃犯数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerImprison" class="col-3 text-right col-form-label">收监人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerImprison" placeholder="收监人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerRelease" class="col-3 text-right col-form-label">释放人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerRelease" placeholder="释放人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerMedicalParole" class="col-3 text-right col-form-label">外诊人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerMedicalParole" placeholder="外诊人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerConfine" class="col-3 text-right col-form-label">禁闭人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerConfine" placeholder="禁闭人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="prisonerStrickCtrl" class="col-3 text-right col-form-label">严管人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="prisonerStrickCtrl" placeholder="严管人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="meetingQuantity" class="col-3 text-right col-form-label">会见人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="meetingQuantity" placeholder="会见人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="assistorQuantity" class="col-3 text-right col-form-label">外协人员</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="assistorQuantity" placeholder="外协人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="externalVehicle" class="col-3 text-right col-form-label">外来车辆</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="externalVehicle" placeholder="外来车辆">
                                        </div>
                                    </div>
                                    <div class="form-group m-b-0 row">
                                        <label for="chiefOfficerTel" class="col-3 text-right col-form-label"></label>
                                        <div class="col-7">
                                            <button type="button" id="subManage" class="btn btn-info waves-effect waves-light">提交</button>
                                        </div>

                                    </div>
                                </div>
                                <div class="tab-pane fade" id="home1">
                                    <div class="form-group row">
                                        <label for="pQuantity" class="col-3 text-right col-form-label">押犯总数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="pQuantity" placeholder="押犯总数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pRealQuantity" class="col-3 text-right col-form-label">实押人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="pRealQuantity" placeholder="实际押犯数量">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="policeQuantity" class="col-3 text-right col-form-label">干警总数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="policeQuantity" placeholder="干警总数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="policeOnDutyQuantity" class="col-3 text-right col-form-label">执勤人数</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="policeOnDutyQuantity" placeholder="执勤人数">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="chiefOfficer" class="col-3 text-right col-form-label">总值班长</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="chiefOfficer" placeholder="总值班长">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="officer" class="col-3 text-right col-form-label">值班长</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="officer" placeholder="值班长">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="chiefOfficerTel" class="col-3 text-right col-form-label">总值班长电话</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="chiefOfficerTel" placeholder="总值班长电话">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="officerTel" class="col-3 text-right col-form-label">值班长电话</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="officerTel" placeholder="值班长电话">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pOnDuty" class="col-3 text-right col-form-label">值班员</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="pOnDuty" placeholder="值班员">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pInStation" class="col-3 text-right col-form-label">检查站人员</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="pInStation" placeholder="检查站人员">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="pInCommandCenter" class="col-3 text-right col-form-label">指挥中心人员</label>
                                        <div class="col-7">
                                            <input type="text" class="form-control" id="pInCommandCenter" placeholder="指挥中心人员">
                                        </div>
                                    </div>
                                    <div class="form-group m-b-0 row">
                                        <label for="chiefOfficerTel" class="col-3 text-right col-form-label"></label>
                                        <div class="col-7">
                                            <button type="button" id="subDuty" class="btn btn-info waves-effect waves-light">提交</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div>
                <!-- end container -->
            </div>
            <!-- end content -->

        </div>
        <!-- ============================================================== -->
        <!-- End Right content here -->
        <!-- ============================================================== -->

    </div>
</div>
    <footer class="footer">
        2016 - 2017 © Minton <span class="hide-phone">- Coderthemes.com</span>
    </footer>
    <!-- END wrapper -->

    <!-- Plugins  -->
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
    <script src="assets/js/prison.js"></script>
    <script src="assets/js/modernizr.min.js"></script>
    <script>
        var firstLoad = true;
        $(document).ready(function(){
            var dutyInfo = ${dutyInfo};
            if(dutyInfo && "null"!=dutyInfo) {
                loadData(dutyInfo);
            }
            var manageInfo = ${manageInfo};
            if(manageInfo && "null"!=manageInfo) {
                loadData(manageInfo);
            }

            $("#subDuty").on("click", function (){
                var dutyInfo = JSON.stringify({
                    "pQuantity":$("#pQuantity").val(),
                    "pRealQuantity":$("#pRealQuantity").val(),
                    "policeQuantity":$("#policeQuantity").val(),
                    "policeOnDutyQuantity":$("#policeOnDutyQuantity").val(),
                    "chiefOfficer":$("#chiefOfficer").val(),
                    "officer":$("#officer").val(),
                    "chiefOfficerTel":$("#chiefOfficerTel").val(),
                    "officerTel":$("#officerTel").val(),
                    "pOnDuty":$("#pOnDuty").val(),
                    "pInStation":$("#pInStation").val(),
                    "pInCommandCenter":$("#pInCommandCenter").val(),
                });
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/bigBoard/editDutyInfo",
                    contentType: 'application/json;charset=UTF-8',
                    data: dutyInfo,
                    dataType: 'json',
                    async: false,
                    success:function(msg){
                        if(msg=="InvalidSession"){
                            alert("会话超时！");
                        } else if(msg==true){
                            alert("保存信息成功。");
                        } else {
                            alert("保存信息失败！");
                        }
                    }

                })
            });

            $("#subManage").on("click", function(){
                var manageInfo = JSON.stringify({
                    "policeQuantity":$("#mpQuantity").val(),
                    "prisonerQuantity":$("#prisonerQuantity").val(),
                    "prisonAreaQuantity":$("#prisonAreaQuantity").val(),
                    "policeOnDuty":$("#policeOnDuty").val(),
                    "policeOnPatrol":$("#policeOnPatrol").val(),
                    "policeInReserve":$("#policeInReserve").val(),
                    "prisonerInReprieve":$("#prisonerInReprieve").val(),
                    "prisonerInLife":$("#prisonerInLife").val(),
                    "prisonerInRoc":$("#prisonerInRoc").val(),
                    "prisonerRecidivist":$("#prisonerRecidivist").val(),
                    "prisonerDrugRelated":$("#prisonerDrugRelated").val(),
                    "prisonerMobdomRelated":$("#prisonerMobdomRelated").val(),
                    "prisonerCultRelated":$("#prisonerCultRelated").val(),
                    "prisonerOldSick":$("#prisonerOldSick").val(),
                    "prisonerOutsider":$("#prisonerOutsider").val(),
                    "prisonerForeigner":$("#prisonerForeigner").val(),
                    "prisonerParole":$("#prisonerParole").val(),
                    "prisonerProbation":$("#prisonerProbation").val(),
                    "prisonerAtLarge":$("#prisonerAtLarge").val(),
                    "prisonerImprison":$("#prisonerImprison").val(),
                    "prisonerRelease":$("#prisonerRelease").val(),
                    "prisonerMedicalParole":$("#prisonerMedicalParole").val(),
                    "prisonerConfine":$("#prisonerConfine").val(),
                    "prisonerStrickCtrl":$("#prisonerStrickCtrl").val(),
                    "meetingQuantity":$("#meetingQuantity").val(),
                    "assistorQuantity":$("#assistorQuantity").val(),
                    "externalVehicle":$("#externalVehicle").val()
                });
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/bigBoard/editManageInfo",
                    contentType: 'application/json;charset=UTF-8',
                    data: manageInfo,
                    dataType: 'json',
                    async: false,
                    success:function(msg){
                        if(msg=="InvalidSession"){
                            alert("会话超时！");
                        } else if(msg==true){
                            alert("保存信息成功。");
                        } else {
                            alert("保存信息失败！");
                        }
                    }

                })
            });

            $(".notify-item").on("click", function(){
                window.location.href = "bigBoard/logout";
            });
        });
    </script>
</body>
</html>
