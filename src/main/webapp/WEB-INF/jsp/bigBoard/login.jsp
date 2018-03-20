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
    <title>登陆</title>
    <link href="plugins/switchery/switchery.min.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="assets/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="wrapper-page">

    <div class="text-center">
        <a href="index.html" class="logo-lg">
            <i class="mdi mdi-radar"></i>
            <span>狱政系统维护</span>
        </a>
    </div>

    <div class="form-group row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-addon"><i class="mdi mdi-account"></i></span>
                <input class="form-control" id="userName" type="text" required="" placeholder="Username">
            </div>
        </div>
    </div>

    <div class="form-group row">
        <div class="col-12">
            <div class="input-group">
                <span class="input-group-addon"><i class="mdi mdi-radar"></i></span>
                <input class="form-control" id="password" type="password" required="" placeholder="Password">
            </div>
        </div>
    </div>

    <div class="form-group text-right m-t-20">
        <div class="col-xs-12">
            <button class="btn btn-primary btn-custom w-md waves-effect waves-light" type="submit">登陆</button>
        </div>
    </div>
</div>
<!-- Plugins  -->
<script src="assets/js/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $("button.btn").on("click",function(){
            var userName = $("#userName").val();
            var password = $("#password").val();
            $.ajax({
                type:"post",
                url:"bigBoard/doLogin",
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify({"userName":userName,"password":password}),
                dataType: 'json',
                success:function(data){
                    if(data.msg=="error"){
                        alert("用户名或密码错误！");
                    }else{
                        window.location.href= "bigBoard/editManageInfo";
                    }
                }

            });
        });
    });
</script>
</body>
</html>
