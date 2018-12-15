<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">    
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<title>首页</title>
<script type="text/javascript">
	 function dateIndex(){
		  window.location.href="${pageContext.request.contextPath}/web/ring/index";
	 }
	 
	 function personCenter(){
		 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
	 }
	 
	 function actInfo(){
		 window.location.href
	 }
</script>
</head>
<body>
<%@include file="/ring/header.jsp"%>
<div class="index-main">
    <div class="index-main-tab wsy_msite">
        <div class="col-xs-4" onclick="dateIndex()">
            <i class="ic_party_post im"></i>
            <div class="txt_leaf_menu">找对象</div>
        </div>
        <a href="${pageContext.request.contextPath}/act/index">
	        <div class="col-xs-4" >
	            <i class="ic_article_post im"></i>
	            <div class="txt_leaf_menu">找活动</div>
	        </div>
        </a>
        <a href="${pageContext.request.contextPath}/article/index">
	        <div class="col-xs-4" >
	            <i class="ic_party_search im"></i>
	            <div class="txt_leaf_menu">历史文章</div>
	        </div>
        </a>
        <a href="${pageContext.request.contextPath}/web/acticle/index">
        <div class="col-xs-4" >
            <i class="ic_wsy_article_square im"></i>
            <div class="txt_leaf_menu">人物专访</div>
        </div>
        </a>
        <a href="${pageContext.request.contextPath}/web/acticle/index">
        <div class="col-xs-4">
            <i class="ic_teacher_search im"></i>
            <div class="txt_leaf_menu">活动回顾</div>
        </div>
        </a>
        <a href="${pageContext.request.contextPath}/web/acticle/index">
        <div class="col-xs-4">
            <i class="ic_party_post im"></i>
            <div class="txt_leaf_menu">文章系列</div>
        </div>
        </a>
    </div>
</div>
<script src="${pageContext.request.contextPath}/new/js/jquery-1.10.2.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/new/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
</body>
</html>