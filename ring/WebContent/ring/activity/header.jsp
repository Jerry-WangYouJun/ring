<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<title></title>
<script type="text/javascript">
function addActivity(){
	if("${webUser.role}" != '1' && "${webUser.role}" != '11'){
		layer.alert('普通会员不能新建活动')
		return false ;
	}
	 window.location.href="${pageContext.request.contextPath}/ring/activity/activity.jsp" ;
}

function indexPage(){
	window.location.href="${pageContext.request.contextPath}/web/index" ;
}
function personCenter(){
	 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
}
</script>
</head>
<body>

<div class="index-main">
    <div class="index-header">
        <div class="col-xs-4" style="text-align: center;" onclick="indexPage()"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="18rem">主页</div>
       <div class="col-xs-4 no-pad" style="text-align: center;"  onclick="personCenter()">
        <c:if test="${sessionScope.customer.sex eq 0 }">
        	 	<img src="${pageContext.request.contextPath}/img/women.jpg" id="headsex" height="18rem">
        </c:if>
        <c:if test="${sessionScope.customer.sex eq  1 }">
        	 	<img src="${pageContext.request.contextPath}/img/men.jpg"height="18rem" >
        </c:if>
        &nbsp;个人中心</div>
        <div class="col-xs-2 no-pad" style="text-align: center;"  onclick="addActivity()">新建</div>
        <div class="col-xs-2 no-pad" style="text-align: center;"  onclick="window.history.back()">返回</div>
        
    </div>
    </div>
</body>
</html>