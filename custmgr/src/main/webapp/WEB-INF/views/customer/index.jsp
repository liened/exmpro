<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content-header">
    <div>
        <ol class="breadcrumb">
            <li>测试</li>
        </ol>
    </div>
</section>
<section class="content">
    <div class="nav-tabs-custom" id="_context">
        <div class="tab-content" >
            <div class="tab-pane active" id="tab_1">
                <form id="cust_queryForm" class="form-horizontal">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="custNum" class="col-sm-5 control-label">custNum</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="custNum" name="custNum">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="showName" class="col-sm-5 control-label">showName</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="showName" name="showName">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label for="trueName" class="col-sm-5 control-label">trueName</label>
                                    <div class="col-sm-7">
                                        <input type="text" class="form-control" id="trueName" name="trueName">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-6" style="text-align: right;">
                                <button type="button" class="btn btn-info btn-qry">查询</button>
                                <button type="reset" class="btn btn-default">重置</button>
                                <button type="button" class="btn btn-info" onclick="add();">添加</button>
                            </div>
                        </div>
                    </div>
                    <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
                    <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
                </form>
            </div>
            <div id="_custList"></div>
        </div>
    </div>
</section>
<%@include file="add.jsp"%>
<%@include file="edit.jsp"%>
<%@include file="detail.jsp"%>
<script>
    $(function () {
        // 查询按钮绑定事件
        $('.btn-qry').on('click', function (e) {
            $.pclient.post2SRV(baseUrl + '/custmgr/list', $('#cust_queryForm').serialize(), '#_custList');
        });
        $('.btn-qry').click();
    });

    function add(){
        $('#addModal').modal('show');
    }
</script>