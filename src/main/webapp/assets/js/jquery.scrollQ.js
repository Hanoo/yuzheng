/**
 *
 * jQueryli上下滚动插件
 * line 显示li行数
 * scrollNum 每次滚动li行数
 * scrollTime 滚动速度 单位毫秒
 *
 */
(function ($) {
    var status = false;
    var timer;
    var _self;
    $.fn.scrollQ = function (options) {
        var defaults = {
            line: 4,
            scrollNum: 1,
            scrollTime: 2000
        }
        var options = jQuery.extend(defaults, options);
        _self = this;
        return this.each(function () {
            $("li", this).each(function () {
                $(this).css("display", "none");
            })
            $("li:lt(" + options.line + ")", this).each(function () {
                $(this).css("display", "block");
            })
            function scroll() {
                for (i = 0; i < options.scrollNum; i++) {
                    var start = $("li:first", _self);
                    start.fadeOut(100);
                    start.css("display", "none");
                    start.appendTo(_self);
                    $("li:eq(" + (options.line - 1) + ")", _self).each(function () {
                        $(this).fadeIn(500);
                        $(this).css("display", "block");
                    })
                }
            }

            timer = setInterval(scroll, options.scrollTime);
            _self.bind("mouseover", function () {
                clearInterval(timer);
            });
            _self.bind("mouseout", function () {
                timer = setInterval(scroll, options.scrollTime);
            });
        });
    };

    $.fn.scrollQStop = function () {
        if (_self) {
            clearInterval(timer);
            _self.unbind("mouseover");
            _self.unbind("mouseout");
        }
    }
    $.fn.scrollQPause = function () {
        clearInterval(timer);
    }
})(jQuery);