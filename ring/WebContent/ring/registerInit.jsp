<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>会员注册</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>
<script>
$(function(){
	if($('#datetimepicker2')[0] != undefined){
		$('#datetimepicker2').datetimepicker({  
			minView: "month",
			format: 'yyyy-mm-dd',
		    todayBtn: true,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true 
		});
	}
});

	$(document).ready(function() {
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop(true, true).slideDown("fast");
			$(this).toggleClass('open');
		}, function() {
			$('.dropdown-menu', this).stop(true, true).slideUp("fast");
			$(this).toggleClass('open');
		});
	});

	function mail() {

		if (!$("#emailForm").validate().form()) {
			return false;
		}
		var path = "${pageContext.request.contextPath}/web/sendMail";
		$.ajax({
			url : path,
			type : 'post',
			data : {codeEmail:$("#codeEmail").val()},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#code").val(data.obj.code);
					$("#userNo").val(data.obj.openId);
				} else {
					alert(data.msg);
					$("#codeEmail").val("")
				}

			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	}
	
	function regist(){
		window.location.href="${pageContext.request.contextPath}/web/register?openId=${openId}"
	}
</script>
</head>
<body id="a2">
	<div class="grid_3">
		<div class="container">
			<div class="services">
				<div class="col-sm-12 col-xs-12 login_left">
					<form class="form-horizontal" role="form" id="emailForm"
						action="${basePath}/web/login" method="post">
						<input type="hidden" name="userNo" id="userNo" />
						<input type="hidden" name="pwd" id="pwd" value="123"/>
						<div class="form-group">
							<label class="col-lg-12 col-md-12 col-sm-12 control-label">内部会员，请填写档案中的电子邮箱，我们将发送一个验证码到您的邮箱中</label>
							<div class="col-lg-12 col-md-12 col-xs-12">
								<input type="text" class="form-control email " 
									id="codeEmail" placeholder="请输入邮箱" required>
							</div>
						</div>
						<!-- End .form-group  -->
						<div class="form-group">
							<div class="col-lg-12 col-md-12 col-xs-12">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-xs-8">
										<input type="text" class="form-control"
											  id="code">
									</div>
									<div class="col-lg-4 col-md-4 col-xs-4">
										<button type="button" class="btn btn-primary" onclick="mail()">发验证码</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-12 col-md-12 col-xs-12">
								<button type="submit" class="btn btn-primary" >提交登陆</button>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-12 col-md-12 col-xs-12">
								<div class="row">
									<div class="col-lg-4 col-md-4 col-xs-12">
										<c:choose>
											 <c:when test="${ openId ne '0'}">
												<label class="col-lg-12 col-md-12 col-sm-12 control-label">尚未注册？</label>
												<a  href="###" onclick="regist()">注册成为会员</a>
											 </c:when>
											 <c:otherwise>
											 	  <label class="col-lg-12 col-md-12 col-sm-12 control-label">审核正在进行中，请耐心等待~</label>
											 </c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</form>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function subInfo() {
		subInfoAll("customer");
	}

	function subInfoAll(name) {

		if (!$("#dataForm").validate().form()) {
			return false;
		}
		var path = "${pageContext.request.contextPath}/" + name + "/" + name
				+ "_edit";
		$
				.ajax({
					url : path,
					type : 'post',
					data : $("#dataForm").serialize(),
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							alert(data.msg);
							window.location.href = "${pageContext.request.contextPath}/web/login?userNo=${openId}&pwd=123";
						} else {
							alert(data.msg);
						}

					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				});
	}

	$(function() {

		$(".dicSelect").each(
				function() {
					var field = this.name;
					if(field.indexOf("2")>-1){
						field = field.replace(/2/,"");
					}
					var htmlStr = "";
					if (dic.hasOwnProperty(field)) {
						for ( var keyValue in dic[field]) {
							htmlStr += "<option value="+keyValue+">"
									+ dic[field][keyValue].describ
									+ "</option>"
						}
					}
					$(this).append(htmlStr);
				});

		$("select:not(.dicSelect)").each(function() {
			var idStr = this.id;
			$("#" + idStr).val(idStr + ":1")
		});
	});
</script>


</html>