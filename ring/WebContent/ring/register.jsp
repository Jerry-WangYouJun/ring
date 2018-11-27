<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>会员注册</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>
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
</script>
</head>
<body id="a2">
	<div class="grid_3">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-12 col-xs-12 login_left">
	    <form id="dataForm">
	    				<input class="form-control " name="openId" type="hidden" value="${openId}"></input>
						<input class="form-control " name="id" type="hidden"></input>
						<input class="form-control " name="flag" id="flag" type="hidden"></input>
						<div class="form-group" >
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control required" name="nickName" id="nickName" placeholder="必填" >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性别:</label> <select 
								class="form-control dicSelect" id="sex" name="sex" placeholder="必填" required>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">生日:</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control" readonly name="birthday"
									id="birthday" placeholder="必填" required/> <span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">年龄:</label>
							<input
								type="text" class="form-control number" name="age"  >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">家乡:</label> <input
								type="text" class="form-control" name="hometown" >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">现居:</label> 
							<select  class="form-control dicSelect"  name="loca" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">经常活动区域:</label>
								<select  class="form-control dicSelect"  name="addtress" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">身高(cm):</label> <input
								type="text" class="form-control number" name="height" >
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">体重(kg):</label> <input
								type="text" class="form-control number" name="weight" >
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">婚姻状况:</label> 
								<select  class="form-control dicSelect"  name="marriage" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">子女:</label> 
								<select  class="form-control dicSelect" name="children" >
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">学历:</label> 
								<select  class="form-control dicSelect" name="degree" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">住房状态:</label>
								<select  class="form-control dicSelect"  name="houseStatus" placeholder="必填" required>
									 
								</select>
						</div>
						<!-- <div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="houseStatus" >
									<option value="houseStatus:1" > 显示 </option>
									<option value="houseStatus:0"> 不显示 </option>
							</select>
						</div> -->
						<div class="form-group ">
							<label for="message-text" class="control-label">从事行业:</label> <input
								type="text" class="form-control" name="industry" >
								
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">月收入:</label>
								<select  class="form-control dicSelect"  name="income" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">qq号:</label> <input
								type="text" class="form-control" name="qq" >
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control" name="telephone" >
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">邮箱:</label> <input
								type="text" class="form-control email" name="email">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">推荐人:</label> <input
								type="text" class="form-control" name="referee" >
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">自我介绍:</label> <input
								type="text" class="form-control" name="introduction"
								id="introduction">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">爱情宣言:</label> <input
								type="text" class="form-control" name="declaration"
								id="declaration">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">择偶要求:</label> <input
								type="text" class="form-control" name="ask" id="ask">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> <input
								type="text" class="form-control" name="remark" id="remark">
						</div>
						<div class="form-group">
							 <button type="button" class="btn btn-default" >关闭</button>
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
						</div>
					</form>
	  </div>
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
</body>
<script type="text/javascript">
	function subInfo() {
		subInfoAll("customer");
	}
	
	function subInfoAll(name) {
		
		if(!$("#dataForm").validate().form()){
			return false ; 
		}
		var path = "${pageContext.request.contextPath}/"+name+"/"+name+"_edit";
		$.ajax({
			url : path,
			type : 'post',
			data : $("#dataForm").serialize(),
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#infoTable").bootstrapTable("refresh");
					window.location.href="/web/login?userNo=${openId}&pwd=123";
				} else {
					alert(data.msg);
				}
	
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	}
	
	$(function(){
		 
		 $(".dicSelect").each(function(){
			     var field = this.name ;
		    	 var htmlStr = "";
			     if (dic.hasOwnProperty(field)) {
					 for( var keyValue in dic[field] ){
						   htmlStr += "<option value="+keyValue+">"+dic[field][keyValue].describ+"</option>"
					 }
				  } 
			     $(this).append(htmlStr);
		 });
		 
		 $("select:not(.dicSelect)").each(function(){
			 var idStr = this.id;
			 $("#" + idStr).val(idStr+":1")
		 }); 
	});
</script>


</html>