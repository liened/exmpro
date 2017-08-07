<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/system/head.jsp"%>
<div class="box">
    <div class="box-body" style="overflow: auto">
        <div class="box-body">
            <table class="table table-bordered">
                <tr>
                    <th nowrap>id</th>
                    <th nowrap>custNum</th>
                    <th nowrap>showName</th>
                    <th nowrap>trueName</th>
                    <th nowrap>registerTime</th>
                    <th nowrap>操作</th>
                </tr>
                <c:forEach items="${page.list}" var="item" varStatus="status">
                    <tr>
                        <td nowrap>${item.id}</td>
                        <td nowrap>${item.custNum}</td>
                        <td nowrap>${item.showName}</td>
                        <td nowrap>${item.trueName}</td>
                        <td nowrap>${item.registerTime}</td>
                        <td nowrap>
                            <a href="javascript:;" class="btn-operaton" data-toggle="modal" data-target="#editModal" data-id="${item.id}">修改</a>
                            <a href="javascript:;" class="btn-delete" data-toggle="modal" data-backdrop="false" data-target="_content" data-id="${item.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <utils:pagination dataUrl="${ctx}/custmgr/list" formId="cust_queryForm" listId="_custList" />
</div>
<script>
    $(function () {
        $('.btn-operaton').on('click', function () {
            var $this = $(this);
            $.pclient.post2SRV(baseUrl + '/custmgr/get', { id: $this.data('id') }, null, function (data) {
                var formData = data;
                $('#editForm').form('load', formData);
            });

        });

        $('.btn-delete').on('click', function () {
            var $this = $(this);
            $.pclient.post2SRV(baseUrl + '/custmgr/delete', { id: $this.data('id') }, null, function (data) {
                toastr.success("删除成功");
                $('.btn-qry').click();
            });
        });
    });
</script>