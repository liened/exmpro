<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>--%>
<%--<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>--%>
<%--<%@ taglib prefix="utils" tagdir="/WEB-INF/tags/utils" %>--%>
<%--<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>--%>
<%@taglib prefix="utils" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>