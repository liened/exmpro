$(function () {

    // 身份证格式验证
    $.validator.addMethod("check_idCard", function(value, element) {
        var value = $.trim(value);
        var reg=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
        return !!(reg.exec(value));
    }, "身份证格式错误");

    // 手机号
    $.validator.addMethod("check_mobileNo", function(value, element) {
        var value = $.trim(value);
        var reg=/^1[34578]\d{9}$/;
        return !!(reg.exec(value));
    }, "手机号码格式错误");

    // 数字字母
    $.validator.addMethod("check_Char", function(value, element) {
        var value = $.trim(value);
        var reg=/^[0-9a-zA-Z]*$/;
        return !!(reg.exec(value));
    }, "输入数字或字母");

    $.validator.setDefaults({
        errorElement: 'span',
        errorClass:'help-block',
        errorPlacement: function(error, element) {
            if($(element).attr('type') == 'radio'){
                error.appendTo($(element).closest('.radio'));
                return;
            }
            if($(element).attr('type') == 'checkbox'){
                error.appendTo($(element).closest('.checkbox'));
                return;
            }
            error.appendTo(element.parent());
        },
        highlight : function(element) {
            $(element).closest('.form-group').addClass('has-error form-group-with-help');
        },
        success : function(label) {
            label.closest('.form-group').removeClass('has-error form-group-with-help');
            label.remove();
        },
        invalidHandler: function(form, validator) {
            var errors = validator.numberOfInvalids();
            if (errors) {
                validator.errorList[0].element.focus();
            }
        }
    });

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    $('.sidebar li a[data-action]').on('click', function (e) {
        var $this = $(this);
        var action =$this.data('action');
        $.pclient.get2SRV(action, null, '#_content');

        $('.sidebar li a[data-action]').parent().removeClass('active');
        $this.parent().addClass('active');
    });

    // IE10
    if (!String.prototype.startsWith) {
        String.prototype.startsWith = function(searchString, position){
            position = position || 0;
            return this.substr(position, searchString.length) === searchString;
        };
    }
});

function digitalRegular(number){
    var reg = /^\d+$/;
    if(reg.test(number)){
        return true;
    }else{
        return false;
    }
}

function floatingRegular(number){
    var reg = /^(\d+\.\d+)$/;
    if(reg.test(number)){
        return true;
    }else{
        return false;
    }
}