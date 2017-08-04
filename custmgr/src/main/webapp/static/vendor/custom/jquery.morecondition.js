(function ($) {
    $.fn.morecondition = function (options) {
        var settings = $.extend( {
            content: '.more-condition',
            speed: 500
        }, options);

        var self = this;
        this.on('click', function () {
            var $content = $(settings.content);
            $content.slideToggle(settings.speed, function () {
                self.html(function () {
                    return $content.is(":visible") ? '收起<i class="fa fa-angle-up"></i>' : '展开<i class="fa fa-angle-down"></i>';
                });
            });
        });
        return this;
    };
})(jQuery);