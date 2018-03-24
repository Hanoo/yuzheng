function loadData(jsonData){
    for(var key in jsonData) {
        var eInForm = $("#"+key);//$("#"+key);
        if(eInForm.attr("id")) {
            var eTagName = eInForm.prop("tagName");
            switch (eTagName){
                case "SELECT":
                    eInForm.find("option").each(function(i,e){
                        if($(e).val() == jsonData[key]){
                            $(e).attr("selected", true);
                        } else {
                            $(e).attr("selected", false);
                        }
                    });
                    break;
                case "TEXTAREA":
                    if(jsonData[key]) {
                        eInForm.val(jsonData[key]).parents("tr").fadeIn();
                    }
                    break;
                case "INPUT" :
                    var inputType = eInForm.attr("type");
                    switch (inputType){
                        case "checkbox":
                            eInForm.each(function(i, e){
                                if(jsonData[key].indexOf($(e).val())!=-1) {
                                    $(e).attr("checked", true);
                                }
                            });
                            break;
                        case "radio":
                            eInForm.each(function(i, e){
                                if(jsonData[key] == $(e).val()) {
                                    $(e).attr("checked", true);
                                } else if(jsonData[key].length>0) {
                                    $(e).attr("checked", false);
                                }
                            });
                            break;
                        default :
                            eInForm.val(jsonData[key]);
                    }
                    break;
                default :
                    eInForm.text(jsonData[key]);
            }
        }
    }
}

function hashCode(strKey) {
    var hash = 0;
    if(!isNull(strKey)) {
        for (var i = 0; i < strKey.length; i++) {
            hash = hash * 31 + strKey.charCodeAt(i);
            hash = intValue(hash);
        }
    }
    return hash;
}

function intValue(num) {
    var MAX_VALUE = 0x7fffffff;
    var MIN_VALUE = -0x80000000;
    if(num > MAX_VALUE || num < MIN_VALUE) {
        return num &= 0xFFFFFFFF;
    }
    return num;
}

function isNull(str){
    return str == null || str == "";
}