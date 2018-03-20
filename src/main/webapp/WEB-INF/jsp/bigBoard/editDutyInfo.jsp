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
    <title>修改值班信息</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
</head>


<body class="fixed-left">

<!-- Begin page -->
<div id="wrapper">
    <!-- ============================================================== -->
    <!-- Start right Content here -->
    <!-- ============================================================== -->
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container-fluid">

                <div class="row">

                    <div class="col-md-6">
                        <div class="card-box">
                            <h4 class="m-t-0 m-b-30 header-title">编辑值班信息</h4>
                                <div class="form-group row">
                                    <label for="pQuantity" class="col-3 col-form-label">囚犯总数</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="pQuantity" placeholder="囚犯总数">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="pRealQuantity" class="col-3 col-form-label">实际押犯数量</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="pRealQuantity" placeholder="实际押犯数量">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="policeQuantity" class="col-3 col-form-label">狱警数量</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="policeQuantity" placeholder="狱警数量">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="policeOnDutyQuantity" class="col-3 col-form-label">值班狱警数量</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="policeOnDutyQuantity" placeholder="值班狱警数量">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="chiefOfficer" class="col-3 col-form-label">总值班长</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="chiefOfficer" placeholder="总值班长">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="officer" class="col-3 col-form-label">值班长</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="officer" placeholder="值班长">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="chiefOfficerTel" class="col-3 col-form-label">总值班长电话</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="chiefOfficerTel" placeholder="总值班长电话">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="officerTel" class="col-3 col-form-label">值班长电话</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="officerTel" placeholder="值班长电话">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="pOnDuty" class="col-3 col-form-label">值班员</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="pOnDuty" placeholder="值班员">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="pInStation" class="col-3 col-form-label">检查站人员</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="pInStation" placeholder="检查站人员">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="pInCommandCenter" class="col-3 col-form-label">指挥中心人员</label>
                                    <div class="col-9">
                                        <input type="text" class="form-control" id="pInCommandCenter" placeholder="指挥中心人员">
                                    </div>
                                </div>
                                <div class="form-group m-b-0 row">
                                    <div class="offset-3 col-9">
                                        <button type="button" class="btn btn-info waves-effect waves-light">提交</button>
                                    </div>
                                </div>
                        </div>
                    </div>

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
<!-- END wrapper -->
<!-- Plugins  -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/prison.js"></script>
<script>
    $(document).ready(function(){
        $(".btn-info").on("click", function (){
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

        var dutyInfo = ${dutyInfo};
        if(dutyInfo && "null"!=dutyInfo) {
            loadData(dutyInfo);
        }
    });
</script>

</body>
</html>