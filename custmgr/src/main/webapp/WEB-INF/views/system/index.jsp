<%@page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="head.jsp"%>
<%@ include file="/WEB-INF/views/system/foot.jsp"%>

<html>
    <head lang="en">
        <title>customer</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" sizes="96x96" href="${ctx}/static/img/favicon.ico">
        <link rel="stylesheet" href="${ctx}/static/AdminLTE/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${ctx}/static/AdminLTE/dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="${ctx}/static/AdminLTE/plugins/datepicker/datepicker3.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/select2/css/select2.min.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/jquery-easyui/themes/bootstrap/easyui.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/jquery-easyui/themes/icon.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/jquery-ztree/css/metroStyle/metroStyle.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/toastr/toastr.min.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/bootstrap-fileinput/css/fileinput.min.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/bootstrap-tagsinput/bootstrap-tagsinput.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/treeTable/themes/vsStyle/treeTable.min.css" />
        <link rel="stylesheet" href="${ctx}/static/vendor/dataTables/media/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="${ctx}/static/vendor/dataTables/extensions/FixedColumns/css/fixedColumns.bootstrap.min.css">
        <link rel="stylesheet" href="${ctx}/static/AdminLTE/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${ctx}/static/css/AdminLTE-custom.css">
        <link rel="stylesheet" href="${ctx}/static/css/pageList.css">
        <script>
            staticUrl = "${ctxStatic}";
            baseUrl = "${ctx}";
        </script>
    </head>
    <body class="hold-transition  sidebar-mini skin-blue">
        <div class="wrapper">
            <header class="main-header">
                <a href="#" class="logo">
                    <span class="logo-mini"><img src="${ctx}/static/img/logo_01.png" style="width: 20px;"></span>
                    <span class="logo-lg"><img src="${ctx}/static/img/logo_01.png" style="width: 38px; padding-right: 10px;"><b>XX</b></span>
                </a>

                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->
                    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                        <span class="sr-only">Toggle navigation</span>
                    </a>
                    <!-- Navbar Right Menu -->
                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">

                            <li class="dropdown user user-menu">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                                    <span class="hidden-xs">XX</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="user-footer">
                                        <div class="pull-right">
                                            <a href="#" class="btn btn-default btn-flat" id="show-password-modal" data-toggle="modal" data-target="#passwordModal">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${ctx}/logout" class="btn btn-default btn-flat">退出</a>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </nav>
            </header>
            <aside class="main-sidebar">
                <section class="sidebar" style="height: auto;">
                    <ul class="sidebar-menu">
                        <li class="header">主菜单</li>
                        ${fns:getMenuListStr()}
                    </ul>
                </section>
            </aside>
            <div id="_content" style="min-height: 916px;margin-left: 230px;background-color: #ecf0f5;"></div>
        </div>
        <div class="ajax-loading">
            <div><img src="${ctx}/static/img/loading.svg" alt=""></div>
        </div>
    </body>
    <script>
        $(function () {
            $('.btn-psw').on('click', function (e) {
                $('#pswForm').validate({
                    rules: {
                        password: "required",
                        password_again: {
                            equalTo: "#password"
                        }
                    }
                });

                if($('#pswForm').valid()){
                    $.pclient.post2SRV('/system/user/changePsw', $('#pswForm').serialize(), null, function (data) {
                        toastr.success("保存成功！");
                        $("oldPsw").val("")
                        $("password_again").val("")
                        $("password").val("")
                        $('#passwordModal').modal('hide');
                    });
                }
            });

            $('.sidebar li a').get(0).click();
        });
    </script>
</html>
