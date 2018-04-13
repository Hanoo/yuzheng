/**
 *
 * jQueryli上下滚动插件
 * line 显示li行数
 * scrollNum 每次滚动li行数
 * scrollTime 滚动速度 单位毫秒
 *
 */
(function($){

    $.fn.scrollQ = function(options){
        var defaults = {
            line:4,
            scrollNum:1,
            scrollTime:2000,
            flag:true,
            index:"noindex"
        };
        var options=jQuery.extend(defaults,options);
        var _self = this;

        $("li",this).each(function(){
            $(this).css("display","none");
        });
        $("li:lt("+options.line+")",this).each(function(){
            $(this).css("display","block");
        });
        if(!options.flag) {
            return false;
        }
        function scroll() {
            for(var i=0;i<options.scrollNum;i++) {
                var start=$("li:first",_self);
                start.fadeOut(100);
                start.css("display","none");
                start.appendTo(_self);
                $("li:eq("+(options.line-1)+")",_self).each(function(){
                    $(this).fadeIn(500);
                    $(this).css("display","block");
                })
            }
        }
        var timer = setInterval(scroll,options.scrollTime);
        _self.bind("mouseover",function(){
            clearInterval(timer);
        });
        _self.bind("mouseout",function(){
            timer = setInterval(scroll,options.scrollTime);
            timerMapper[options.index] = timer;
        });
        return {"eleUL":_self, "scrollTimer":timer};
    }

})(jQuery);