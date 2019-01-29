<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="${pageContext.request.contextPath}/ring/js/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<title></title>
<script type="text/javascript">
function personCenter(){
	 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
}

function indexPage(){
	window.location.href="${pageContext.request.contextPath}/web/index" ;
}

$(function(){
})
</script>
</head>
<body>

<div class="index-main">
    <div class="index-header">
        <div class="col-xs-6" style="text-align: center;"  onclick="indexPage()"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="18rem">&nbsp;主页</div>
        <div class="col-xs-6 no-pad" style="text-align: center;"  onclick="personCenter()">
        <c:if test="${sessionScope.customer.sex eq 0 }">
        	 	<img src="${pageContext.request.contextPath}/img/women.jpg" id="headsex" height="18rem">
        </c:if>
        <c:if test="${sessionScope.customer.sex eq  1 }">
        	 	<img src="${pageContext.request.contextPath}/img/men.jpg"height="18rem" >
        </c:if>
        &nbsp;个人中心</div>
        
    </div>
    </div>
</body>
</html>