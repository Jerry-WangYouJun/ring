<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath }/ring/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/ring/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/ring/css/style.css" rel='stylesheet' type='text/css' />
<!----font-Awesome----->
<link href="${pageContext.request.contextPath }/ring/css/font-awesome.css" rel="stylesheet"> 
<!----font-Awesome----->
<script>
$(document).ready(function(){
    $(".dropdown").hover(            
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
            $(this).toggleClass('open');        
        },
        function() {
            $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
            $(this).toggleClass('open');       
        }
    );
});
	 
function webLogin(msg){
	var path = "${pageContext.request.contextPath}/web/webLogin";
	$.ajax({
		url : path,
		type : 'post',
		data : $("#loginForm").serialize(),
		dataType : 'json',
		success : function(data) {
			if (data.success) {
					location.href="${pageContext.request.contextPath}/web/index";
			} else {
				alert(data.msg)
			}

		},
		error : function(transport) {
			alert("系统产生错误,请联系管理员!");
		}
	});
}
</script>
</head>
<body>
<div class="grid_3">
  <div class="container">
   <div class="breadcrumb1">
     <ul>
        <a href="index.html"><i class="fa fa-home home_1"></i></a>
        <span class="divider">&nbsp;|&nbsp;</span>
        <li class="current-page">登录</li>
     </ul>
   </div>
   <div class="services">
   	  <div class="col-sm-6 login_left">
	   <form id="loginForm">
  	    <div class="form-item form-type-textfield form-item-name">
	      <label for="edit-name">用户名 <span class="form-required" title="This field is required.">*</span></label>
	      <input type="text" id="edit-name" name="userNo" value="" size="60" maxlength="60" class="form-text required">
	    </div>
	    <div class="form-item form-type-password form-item-pass">
	      <label for="edit-pass">密码 <span class="form-required" title="This field is required.">*</span></label>
	      <input type="password" id="edit-pass" name="pwd" size="60" maxlength="128" class="form-text required">
	    </div>
	    <div class="form-actions">
	    	<input type="button" id="date" name="op" onclick="webLogin('dating')" value="约会登录" class="btn_1 submit">
	    </div>
	   </form>
	  </div>
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
</body>
</html>