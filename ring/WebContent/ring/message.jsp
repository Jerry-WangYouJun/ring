<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>评价详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/ring/css/style.css" rel='stylesheet' type='text/css' />
<!----font-Awesome----->
<link href="${pageContext.request.contextPath}/ring/css/font-awesome.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/ring/assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<!----font-Awesome----->
<script>
	 
		
		function signUp(){
			var path = "${pageContext.request.contextPath}/message/updateState?id=${msg.id}";
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
					} else {
						alert(data.msg);
					}
		
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
		}
		
		function evaluateDate(id){
			 window.location.href="${pageContext.request.contextPath}/web/evaluate?id=" + id ;
		}
	 
	 
</script>
</head>
<body>

<%@include file="/ring/header.jsp"%>
   <div class="profile" style="margin-top:70px">
   	 <div class="col-md-12 profile_left">
   	 	
   	 	<div class="col_3">
			<div style="margin: 30px"> 
		<div class="col_4">
		    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			   <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">活动详情</a></li>
			   </ul>
			   <div id="myTabContent" class="tab-content">
				  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
				    <div class="basic_1">
				    	<h3>评价情况 </h3>
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened_1">
									<td class="day_label">留言人 :</td>
									<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${msg.fromId}">${msg.customerFrom.nickName}</a></td>
								</tr>
								<tr class="opened_1">
									<td class="day_label">被留言人 :</td>
									<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${msg.joinId}">${msg.customerJoin.nickName}</a></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">评价内容 :</td>
									<td class="day_value">${msg.msg }</td>
								</tr>
								 <tr class="opened">
									<td class="day_label">评价时间:</td>
									<td class="day_value">${msg.msg }</td>
								</tr>
								<tr class="opened">
									<td class="day_label" colspan="2">
									<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick="signUp()">审核通过</button>
									</td>
								</tr>
								
						    </tbody>
				          </table>
				          
				         </div>
				        <div class="clearfix"> </div>
				    </div>
				  </div>
		     </div>
		  </div>
	   </div>
   	 </div>
       <div class="clearfix"> </div>
    </div>
  </div>
</div>
		<!-- /.modal-content -->
<!-- FlexSlider -->
<script defer src="${pageContext.request.contextPath}/ring/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ring/css/flexslider.css" type="text/css" media="screen" />
<script>
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>   
</body>
</html>