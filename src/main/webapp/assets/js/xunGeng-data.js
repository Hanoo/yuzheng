function refXunGeng() {
    console.log("获取巡更数据中···");
    $.ajax({
        type: 'POST',
        url: '/toXgsj',
        success: function(data){
            $("#xgTime").html(data.replace(",","-"));
        },
        error:function () {
            alert("获取时间段失败");
        }
    });

    var pIcons = $(".bg-icon");
    pIcons.each(function (i, e) {
        $(this).removeClass("bg-icon-success").removeClass("bg-icon-danger").addClass("bg-icon-inverse");
    });

    $.ajax({
        type: 'POST',
        url: '/toXGaddr',
        success: function(data){
            var json =  eval(data);

            $.each(json,function(index,entry){
                var addrID = entry["addrID"];
                var addrName = entry["addrName"];
                var logDate = entry["logDate"];
                var lineID =  entry["lineID"];
                var xgp = $("#xgp"+addrID);
                xgp.find("div .text-muted").html(addrName);
                if(lineID == "0"){
                    xgp.find("div .bg-icon").removeClass("bg-icon-inverse").addClass("bg-icon-danger").removeClass("bg-icon-success");
                }else{
                    xgp.find("div .bg-icon").removeClass("bg-icon-inverse").removeClass("bg-icon-danger").addClass("bg-icon-success");
                }
            })
        },
        error:function () {
            alert("获取巡更信息失败！");
        }
    });
}