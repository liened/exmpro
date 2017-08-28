(function ($) {
    $.pclient = $.pclient || {};

    $.extend($.pclient, {
        version: '@VERSION',
        message: {
            connectErr: '通讯异常'
        },
        ajax: function (options) {
            var defaults = {
                async: true,
                cache: false,
                method: 'POST',
                success: function ( data ) {
                    $('.ajax-loading').hide();
                    if( typeof data === "string" && data.substring(0, 1) == '#' ){
                        toastr.error(data.substring(1),'错误提示');
                        return;
                    }

                    if( typeof data === "string" && data.indexOf('LOGINPAGE') != -1 ){
                        window.location.href = baseUrl + '/login';
                        return;
                    }

                    if( options.target ){
                        $(options.target).length ? $( options.target ).html(data) : alert('no targetId');
                        options.processSuccess && options.processSuccess();
                        return;
                    }
                    data.status == '200' ? options.processSuccess(data.object) : toastr.error(data.message);
                },
                error: function (request, status, thrownError) {
                    if( options.processError ) {
                        options.processError(request, status, thrownError);
                    }else{
                        toastr.error($.pclient.message.connectErr);
                    }
                },
                beforeSend: function () {
                    $('.ajax-loading').show();
                },
                complete: function(){
                    $('.ajax-loading').hide();
                }
            };
            var option = $.extend(defaults, options);
            return $.ajax( option );
        },
        post2SRV: function (action, data, target, processSuccess, processError) {
            if(!action.startsWith(baseUrl)){
                action = baseUrl + action;
            }
            $.pclient.ajax({
                url: action,
                data: data,
                method: 'POST',
                target: target,
                processSuccess: processSuccess,
                processError: processError
            });
        },
        get2SRV: function (action, data, target, processSuccess, processError, async) {
            if(!action.startsWith(baseUrl)){
                action = baseUrl + action;
            }
            $.pclient.ajax({
                url: action,
                data: data,
                method: 'GET',
                target: target,
                processSuccess: processSuccess,
                processError: processError,
                async: async || true
            });
        }
    });

    function sleep(d){
        for(var t = Date.now();Date.now() - t <= d;);
    }
})(window.jQuery);