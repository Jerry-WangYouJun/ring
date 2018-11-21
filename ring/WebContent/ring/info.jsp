<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${basePath}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${basePath}/css/style.css" />
<script src="${basePath}/js/jquery-3.1.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script type="text/javascript">

	    function getPrepay(){
	    	 if('${info.flag}' == '1'){
	    	  	  alert("此号码不支持充值，请换卡或联系管理员！");
	    	  	  return false;
	   		  }
		    	if('${info.ICCID }' == ''){
		    		  alert('无效的iccid，请点击【切换】按钮获得iccid');
		    		  return false ;
		    	}
		    	window.location.href='${basePath}/card/xinfu_wechat_pay?iccid=${info.ICCID}';
	    }
</script>
</head>
<body>
		<div class="container-fluid">
			<div class="row container">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="col-md-6 col-xs-6 active">
						<a href="#home" role="tab" data-toggle="tab">留言信息</a>
					</li>
					<li role="presentation" class="col-md-6 col-xs-6">
						<a href="#profile" role="tab" data-toggle="tab">邀约记录</a>
					</li>
				</ul>

				<div class="tab-content" style="margin-bottom: 93px;">
					<div role="tabpanel" class="tab-pane active" id="home">
						    <div>
								<h3> 123123123</h3>
								<p> 胜多负少  </p>
								<hr />
							</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
						<c:forEach items = "${info.packageList }" var = "p" >
						    <div>
								<h3> 挨打的</h3>
								<p> 123123123 饿肚肚</p>
								<hr />
							</div>
						</c:forEach>
					</div>
				</div> 
			</div>
			<div class="row dingwei" >
				<p class="text-center">
					<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick=" getPrepay()">充值续费</button>
				</p>
				<p class="text-center">
					<a href="${basePath}/card/search?iccid=${info.ICCID}">历史续费查询</a>
				</p>
				
			</div>
		</div>

</body>
</html>