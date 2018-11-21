<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>
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
   	  <div class="col-sm-6 login_left">
	    <form id="dataForm">
						<input class="form-control " name="id" type="hidden"></input>
						<input class="form-control " name="flag" id="flag" type="hidden"></input>
						<div class="form-group" >
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control" name="nickName" id="nickName" placeholder="必填" required>
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
						<div class="form-group  col-xs-8">
							<label for="message-text" class="control-label">家乡:</label> <input
								type="text" class="form-control" name="hometown" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"  id="hometown">
									<option value="hometown:1" > 显示 </option>
									<option value="hometown:0" selected="selected"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">现住址:</label> <input
								type="text" class="form-control" name="addtress">
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"   id="addtress">
									<option value="addtress:1" > 显示 </option>
									<option value="addtress:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">身高:</label> <input
								type="text" class="form-control" name="height">
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"  id="height" >
									<option value="height:1" > 显示 </option>
									<option value="height:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">体重:</label> <input
								type="text" class="form-control" name="weight" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="weight">
									<option value="weight:1" > 显示 </option>
									<option value="weight:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">婚姻状况:</label> 
								<select  class="form-control dicSelect"  name="marriage" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"  id="marriage" >
									<option value="marriage:1" > 显示 </option>
									<option value="marriage:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">子女:</label> <input
								type="text" class="form-control" name="children" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="children" >
									<option value="children:1" > 显示 </option>
									<option value="children:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">学历:</label> 
								<select  class="form-control dicSelect" name="degree" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"  id="degree"  >
									<option value="degree:1" > 显示 </option>
									<option value="degree:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">住房状态:</label>
								<select  class="form-control dicSelect"  name="houseStatus" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="houseStatus" >
									<option value="houseStatus:1" > 显示 </option>
									<option value="houseStatus:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">从事行业:</label> <input
								type="text" class="form-control" name="industry" >
								
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="industry">
									<option value="industry:1" > 显示 </option>
									<option value="industry:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">月收入:</label> <input
								type="text" class="form-control" name="income" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="income">
									<option value="income:1" > 显示 </option>
									<option value="income:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">qq号:</label> <input
								type="text" class="form-control" name="qq" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="qq">
									<option value="qq:1" > 显示 </option>
									<option value="qq:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control" name="telephone" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="telephone">
									<option value="telephone:1" > 显示 </option>
									<option value="telephone:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">邮箱:</label> <input
								type="text" class="form-control" name="email">
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp"  id="email">
									<option value="email:1" > 显示 </option>
									<option value="email:0"> 不显示 </option>
							</select>
						</div>
						<div class="form-group col-xs-8">
							<label for="message-text" class="control-label">推荐人:</label> <input
								type="text" class="form-control" name="referee" >
						</div>
						<div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="referee">
									<option value="referee:1" > 显示 </option>
									<option value="referee:0"> 不显示 </option>
							</select>
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