<%@ page import="com.css.entity.YuzhengUser" %>
<%@ page import="com.css.util.IConstant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    YuzhengUser user = (YuzhengUser) session.getAttribute(IConstant.SESSION_ATTRIBUTE_USER);
%>
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
    <style>
        .entrance{
            width:80%;
            margin: 90px auto;
        }
        .ent-border{
            border-radius: 500px;
        }
        .ent-width{
            width: 20%;
            margin: 0 33px;
            text-align: center;
        }
        .ent-center{
            margin: 0 10%;
            width: 100%;
            text-align: center;
        }
        .text-p{
            position: absolute;
            bottom: 30px;
            left: 0 ;
            right: 0;

        }
    </style>
</head>
<body class="widescreen fixed-left-void">

    <div class="entrance">

        <div class="text-center">
            <a href="javascript:void(0);" class="logo-lg">
                <i class="mdi mdi-radar"></i>
                <span>欢迎您的使用</span>
            </a>
        </div>
        <div class="container-fluid">
<%
    if(IConstant.ADMIN_AREA.equals(user.getPrisonArea())) {
%>
            <div class="row col-lg-12 entrance">
                <div class="col-lg-3 ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/statistic/index">
                            <h3 class="text-success counter font-bold mt-0">数据中心</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>

                <div class="col-lg-3 ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/bigBoard/dutyInfo">
                            <h3 class="text-primary counter font-bold mt-0">值班信息</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>

                <div class="col-lg-3 ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/bigBoard/manageInfo">
                            <h3 class="text-pink font-bold mt-0">管理信息</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/bigBoard/editManageInfo">
                            <h3 class="text-white counter font-bold mt-0">编辑界面</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>
            </div>
<%
    } else {
%>
            <div class="row ent-center">
                <div class="ent-width ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/statistic/index">
                            <h3 class="text-success counter font-bold mt-0">数据中心</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>

                <div class="ent-width ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/bigBoard/dutyInfo">
                            <h3 class="text-primary counter font-bold mt-0">值班信息</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>

                <div class="ent-width ">
                    <div class="widget-simple text-center card-box ent-border">
                        <a href="/bigBoard/manageInfo">
                            <h3 class="text-pink font-bold mt-0">管理信息</h3>
                            <p class="text-muted mb-0">点击进入</p>
                        </a>
                    </div>
                </div>
            </div>
<%
    }
%>
            <!-- end row -->
            <div class="text-center text-p"><p>版权信息</p></div>
        </div>
    </div>
</body>
</html>
