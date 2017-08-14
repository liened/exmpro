<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../head.jsp"%>
<section class="content-header">
    <div>
        <ol class="breadcrumb">
            <li>系统管理</li>
            <li>菜单管理</li>
        </ol>
    </div>
</section>
<section class="content">
    <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a href="javascript:void(0)">菜单列表</a></li>
        </ul>
        <div class="row">
            <div class="col-sm-6 col-sm-offset-6" style="text-align: right;">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addModal" style="margin: 5px 20px 0 0 ">新增</button>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_1">
                <form id="listForm" method="post">
                    <table class="table table-bordered">
                        <tr>
                            <th>名称</th>
                            <th>链接</th>
                            <th style="text-align:center;">排序</th>
                            <th>是否可见</th>
                            <%--<th>权限标识</th>--%>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${menuList}" var="menu">
                            <tr id="${menu.id}" pId="${menu.parentCd}">
                                    <%--<td nowrap><i class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><a href="javascript:;" class="btn-detail" href="${ctx}/system/menu/get" data-id="${menu.id}">${menu.name}</a></td>--%>
                                <td nowrap><a href="javascript: void(0);" class="btn-detail"  data-toggle="modal" data-target="#detailModal" data-id="${menu.id}">${menu.menuName}</a></td>
                                <td nowrap>${menu.url}</td>
                                <td nowrap style="text-align:center;">
                                    <input type="hidden" name="ids" value="${menu.id}"/>
                                    <input name="sorts" type="text" value="${menu.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
                                </td>
                                <td nowrap>${empty menu.url?'隐藏':'显示'}</td>
                                    <%--<td nowrap title="${menu.permission}">${menu.permission}</td>--%>
                                <td nowrap>
                                    <a href="javascript:;" class="btn-edit" data-toggle="modal" data-target="#updateModal" data-id="${menu.id}">修改</a>
                                    <a href="javascript:;" class="btn-delete" data-toggle="confirmation"  data-placement="left" data-popout="true" title="是否删除?" data-id="${menu.id}">删除</a>
                                        <%--<a href="javascript:;" class="btn-childAdd"  data-toggle="modal" data-target="#addChildModal" data-id="${menu.parent.id}">添加下级菜单</a>--%>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="form-actions pagination-left">
                        <input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script type="text/javascript">

    $(document).ready(function() {
        $("#treeTable").treeTable({expandLevel : 3}).show();
    });

    function updateSort() {
        loading('正在提交，请稍等...');
        $("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
        $("#listForm").submit();
    }

    // 详情
    $('.btn-detail').on('click', function () {
        var $this = $(this);
        $.pclient.post2SRV(baseUrl + '/system/menu/get', { id:$this.data('id') }, null, function (data) {
            $('#detailForm').form('load', data);
            $('#parentIdDetail').combotree('setValue',data.parentId);
        });

    });

    // 修改
    $('.btn-edit').on('click', function () {
        var $this = $(this);
        $.pclient.post2SRV(baseUrl + '/system/menu/get', { id:$this.data('id') }, null, function (data) {
            $('#updateForm').form('load', data);
            $('#parentIdUpdate').combotree('setValue',data.parentId);
        });
    });

    // 添加下级菜单
    $('.btn-childAdd').on('click', function () {
        var $this = $(this);
        $.pclient.post2SRV(baseUrl + '/system/menu/get', { id:$this.data('id') }, null, function (data) {
            $('#addChildForm').form('load', data);
            $('#parentIdAdd').combotree('setValue',data.id);
        });
    });

    // 删除
    $('.btn-delete').confirmation({
        onConfirm: function () {
            var $this = this;
            $.pclient.post2SRV(baseUrl + '/system/menu/delete', { id: $this.data('id') },'#_content', function (data) {
                toastr.success('删除成功 ');
            });
        }
    });

</script>
