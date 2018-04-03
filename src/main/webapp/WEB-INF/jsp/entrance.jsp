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
    <title>狱政首页</title>
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">

</head>
<body>

<div class="wrapper-page">

    <div class="text-center">
        <a href="javascript:void(0);" class="logo-lg"><i class="mdi mdi-radar"></i> <span>欢迎您的使用</span> </a>
    </div>
    <div class="container-fluid">

        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="widget-simple text-center card-box">
                    <a href="/statistic/index">
                        <h3 class="text-success counter font-bold mt-0">数据中心</h3>
                        <p class="text-muted mb-0">点击进入</p>
                    </a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="widget-simple text-center card-box">
                    <a href="/bigBoard/dutyInfo">
                        <h3 class="text-primary counter font-bold mt-0">值班信息</h3>
                        <p class="text-muted mb-0">点击进入</p>
                    </a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="widget-simple text-center card-box">
                    <a href="/bigBoard/manageInfo">
                        <h3 class="text-pink font-bold mt-0">管理信息</h3>
                        <p class="text-muted mb-0">点击进入</p>
                    </a>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="widget-simple text-center card-box">
                    <a href="/bigBoard/editManageInfo">
                        <h3 class="text-inverse counter font-bold mt-0">编辑界面</h3>
                        <p class="text-muted mb-0">点击进入</p>
                    </a>
                </div>
            </div>
        </div>
        <!-- end row -->

    </div>
</div>

</body>
</html>
