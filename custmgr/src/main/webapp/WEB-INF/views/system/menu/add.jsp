<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/head.jsp"%>


<div class="modal" id="addModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">

                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">菜单新增</h4>
            </div>
            <div class="modal-body">
                <form id="addForm" modelAttribute="menu" method="post" class="form-horizontal">

                    <div class="form-group">
                        <label class="col-sm-2 control-label-required">上级菜单:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="parentId" name="parent.id" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label-required">名称:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">图标:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="icon" name="icon">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">链接:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="href" name="href">
                            <%--<span class="help-inline">点击菜单跳转的页面</span>--%>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">目标:</label>--%>
                    <%--<div class="col-sm-4">--%>
                    <%--<input type="text" class="form-control" id="target" name="target">--%>
                    <%--&lt;%&ndash;<span class="help-inline">链接地址打开的目标窗口，默认：mainFrame</span>&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">图标:</label>--%>
                    <%--<div class="col-sm-4">--%>
                    <%--<input type="text" class="form-control" id="icon" name="icon">--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label-required">排序:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="sort" name="sort" required>
                            <%--<span class="help-inline">排列顺序，升序。</span>--%>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label-required">可见:</label>
                        <div class="col-sm-4">
                            <%--<input type="text" class="form-control" id="isShow" name="isShow" required>--%>

                            <select   id="isShow" class="form-control" name="isShow" required>
                                <option value="1" label="显示"/>
                                <option value="0" label="隐藏"/>
                            </select>

                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">权限标识:</label>--%>
                    <%--<div class="col-sm-4">--%>
                    <%--<input type="text" class="form-control" id="permission" name="permission">--%>
                    <%--&lt;%&ndash;<span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span>&ndash;%&gt;--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">系统:</label>
                        <div class="col-sm-4">
                            <%--<input type="text" class="form-control" id="systemSign" name="systemSign">--%>
                            <form:select path="menu" id="systemSign" class="form-control" name="systemSign">
                                <form:options items="${fns:getDictList(\"Common_DictScope\")}" itemLabel="label" itemValue="value" />
                            </form:select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注:</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="remarks" name="remarks">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button id="btnSubmit" type="button" class="btn btn-info btn-add">保 存</button>
                            <input id="btnCancel" class="btn" type="button" value="取消" data-dismiss="modal"/>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function() {
        $.pclient.post2SRV(baseUrl + '/system/menu/treeData', { grade: 2 }, null, function (data) {
            $('#parentId').combotree({
                data: transData(data, 'id', 'pId', 'children')

            });
        });
    });


    function transData(a, idStr, pidStr, chindrenStr){
        var r = [], hash = {}, id = idStr, pid = pidStr, children = chindrenStr, i = 0, j = 0, len = a.length;
        for(; i < len; i++){
            hash[a[i][id]] = a[i];
        }
        for(; j < len; j++){
            var aVal = a[j], hashVP = hash[aVal[pid]];
            if(hashVP){
                !hashVP[children] && (hashVP[children] = []);
                hashVP[children].push(aVal);
            }else{
                r.push(aVal);
            }
        }
        return r;
    }

    $('.btn-add').on('click', function (e) {
        $('#addForm').validate();

        if($('#addForm').valid()){
            $('#addModal').modal('hide');
            $.pclient.post2SRV('/system/menu/save', $('#addForm').serialize(), '#_content', function (data) {
//				$('#addModal').modal('hide');
//				$('.btn-qry').click();
            });
        }
    })


</script>

