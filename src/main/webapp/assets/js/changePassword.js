$("#saveButton").on("click", function(){
    var oldPasswd = $("#oldPasswd").val();
    if(!oldPasswd) {
        showChangePwdMsg("请输入旧密码", "error");
        return false;
    }
    var newPasswd = $("#newPasswd").val();
    if(!oldPasswd) {
        showChangePwdMsg("请输入新密码", "error");
        return false;
    }
    if(newPasswd.length<6 || newPasswd.length>10) {
        showChangePwdMsg("密码长度应大于6位小于10位", "error");
        return false;
    }
    var conPasswd = $("#conPasswd");
    if(!conPasswd.val()) {
        showChangePwdMsg("请再次输入新密码", "error");
        return false;
    }
    if(conPasswd.val()!=newPasswd) {
        showChangePwdMsg("两次输入的内容不一致", "error");
        return false;
    }
    $.ajax({
        type:"post",
        url:"statistic/doResetPasswd",
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify({"oldPasswd":hashCode(oldPasswd),"newPasswd":hashCode(newPasswd)}),
        dataType: 'json',
        success:function(data){
            if(data.msg=="wrong"){
                showChangePwdMsg("用户旧密码输入错误！", "error");
            } else if (data.msg=="error") {
                showChangePwdMsg("服务器内部错误！", "error");
            } else {
                showChangePwdMsg("修改成功", "info");
                setInterval(function () {
                    cleanPage();
                }, 2000);
            }
        }
    });

});

function showChangePwdMsg(msg, type){
    var fontColor = "green";
    if("error"==type) {
        fontColor = "red";
    }
    $("#chgPwdMsg").css("color", fontColor).html(msg);
}

function cleanPage() {
    $("#oldPasswd").val("");
    $("#newPasswd").val("");
    $("#conPasswd").val("");
    showChangePwdMsg("", "");
}