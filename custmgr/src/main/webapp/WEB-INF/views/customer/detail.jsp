<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/views/system/head.jsp" %>
<div class="modal" id="detailModal"></div>
<script id="detail-template" type="text/x-handlebars-template">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span></button>
                <h4 class="modal-title">回访信息详情</h4>
            </div>
            <div class="modal-body">
                <form id="editForm" class="form-horizontal">
                    <table class="table table-bordered">
                        <tr>
                            <th class="col-sm-2">回访时间</th>
                            <td class="col-sm-4">{{createTime}}</td>
                            <th class="col-sm-2">贷款编号</th>
                            <td class="col-sm-4">{{loanNum}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">回访机构</th>
                            <td class="col-sm-4">{{orgName}}</td>
                            <th class="col-sm-2">客户名称</th>
                            <td class="col-sm-4">{{custName}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">身份证号码</th>
                            <td class="col-sm-4">{{certificateNum}}</td>
                            <th class="col-sm-2">电话</th>
                            <td class="col-sm-4">{{mobilePhone}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">申请课程</th>
                            <td class="col-sm-4">{{courseName}}</td>
                            <th class="col-sm-2">申请金额</th>
                            <td class="col-sm-4">{{loanApplyAmt}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">放款时间</th>
                            <td class="col-sm-4">{{distrDt}}</td>
                            <th class="col-sm-2">培训期限</th>
                            <td class="col-sm-4">{{courseDuration}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">课程实际金额</th>
                            <td class="col-sm-4">{{courseAmt}}</td>
                            <th class="col-sm-2">分期模式</th>
                            <td class="col-sm-4">{{periodMode}}</td>
                        </tr>

                        <tr>
                            <th class="col-sm-2">提醒开始还款月份</th>
                            <td class="col-sm-4">{{remindRepayMonth}}</td>
                            <th class="col-sm-2">到目前培训多久</th>
                            <td class="col-sm-4">{{trainSoFar}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">上课是否需要签到</th>
                            <td class="col-sm-4">{{isSignStr}}</td>
                            <th class="col-sm-2">是否有客栈APP</th>
                            <td class="col-sm-4">{{isAppStr}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">是否绑定银行卡</th>
                            <td class="col-sm-4">{{isBindingCardsStr}}</td>
                            <th class="col-sm-2">之前是否更换过卡</th>
                            <td class="col-sm-4">{{isChangeCardsStr}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">培训结束工作安排</th>
                            <td class="col-sm-4">{{workPlan}}</td>
                            <th class="col-sm-2">提醒逾期和逾期原因</th>
                            <td class="col-sm-4">{{remindOverdueContent}}</td>
                        </tr>
                        <tr>
                            <th class="col-sm-2">其他备注</th>
                            <td class="col-sm-4">{{remarks}}</td>
                            <%--<th class="col-sm-2">审核人</th>--%>
                            <%--<td class="col-sm-4">{{auditor}}</td>--%>
                        </tr>
                    </table>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-info" data-dismiss="modal">关 闭</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</script>