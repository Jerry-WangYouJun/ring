<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<title></title>
<script type="text/javascript">
function addActivity(){
	 window.location.href="${pageContext.request.contextPath}/ring/activity/activity.jsp" ;
}

function indexPage(){
	window.location.href="${pageContext.request.contextPath}/web/index" ;
}
</script>
</head>
<body>

<div class="index-main">
    <div class="index-header">
        <div class="col-xs-3" onclick="indexPage()"><img src="images/logo.png" height="18rem">主页</div>
        <div class="col-xs-6">
            <div class="index-header-search">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </div>
        <div class="col-xs-3 no-pad"  onclick="addActivity()"><i class="glyphicon glyphicon-user glyphicon-teather"></i>新建活动</div>
        
    </div>
    </div>
</body>
</html>