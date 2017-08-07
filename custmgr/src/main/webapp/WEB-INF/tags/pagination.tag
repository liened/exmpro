<%@ tag language="java" pageEncoding="utf-8" %>
<%@attribute name="dataUrl" required="true" type="java.lang.String" %>
<%@attribute name="formId" required="true" type="java.lang.String" %>
<%@attribute name="listId" required="true" type="java.lang.String" %>

<div class="box-footer clearfix"></div>
<script>
    $('.box-footer').pagination({
        items: '${ page.count}',          // 总条数
        itemsOnPage: '${ page.pageSize}', // 每页显示条数
        currentPage: ${page.pageNo},      // 当前页
        onPageClick: function(pageNo) {   // 点击某一页触发方法
            $('#pageNo').val(pageNo);
            $.pclient.post2SRV('${dataUrl}', $('#${formId}').serialize(), '#${listId}');
        }
    })
</script>