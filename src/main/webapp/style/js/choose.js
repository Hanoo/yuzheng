/**页面跳转*/
function choose(n) {
    switch (n) {
        case 1:
            window.location.href = "/toIndex";
            break;
        case 2:
            window.location.href = "/toJl";
            break;
        case 3:
            window.location.href = "/toDm";
            break;
        case 4:
            // 显示日巡更
            window.location.href = "/toXg?name=1";
            break;
        case 5:
            // 显示夜巡更
            window.location.href = "/toXg?name=2";
            break;
        case 6:
            // 汇总数据
            window.location.href = "/toYjInfo";
            break;
        default:
            window.location.href = "/toIndex";
            break;
    }
}

$(document).ready(function () {
    setInterval(showTime, 1000);

    refData();
    refXunGeng();

    setInterval(refData, 1000 * 60 * 5);

    setInterval(refXunGeng, 1000 * 60 * 5);

})

function showTime() {
    var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
    var myDate = new Date();
    var month = myDate.getMonth() + 1;
    var day = myDate.getDate();
    if (month < 10) month = "0" + month;
    if (day < 10) {
        day = "0" + day
    }
    ;
    var ymd = myDate.getFullYear() + '-' + month + '-' + day;
    var hour = myDate.getHours();
    if (hour < 10) hour = "0" + hour;
    var min = myDate.getMinutes();
    if (min < 10) {
        min = "0" + min;
    }
    var mi = myDate.getSeconds();
    if (mi < 10) mi = "0" + mi;
    var result = hour + ":" + min + ":" + mi;
    $("#sfm").html(result);
    $("#nyr").html(ymd + "  " + today[myDate.getDay()]);
    $("#nongli").html(showCal());
}