<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/system/head.jsp"%>

<div class="modal" id="addModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">添加</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="custNum" class="col-sm-2 control-label-required">custNum</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="custNum" name="custNum" required>
                            </div>
                            <label for="pwd" class="col-sm-2 control-label-required">pwd</label>
                            <div class="col-sm-4">
                                <input type="password" class="form-control" id="pwd" name="pwd" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="showName" class="col-sm-2 control-label-required">showName</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="showName" name="showName">
                            </div>
                            <label for="trueName" class="col-sm-2 control-label-required">trueName</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="trueName" name="trueName">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <button type="button" class="btn btn-info btn-add">保 存</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $('.btn-add').on('click', function (e) {
            $('#addForm').validate();
            if($('#addForm').valid()){
                $.pclient.post2SRV('/custmgr/save', $('#addForm').serialize(), null, function (data) {
                        $('#addModal').modal('hide');
                        toastr.success("保存成功");
                        $('.btn-qry').click();
                });
            }
        })
    });
</script>