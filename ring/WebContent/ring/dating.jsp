<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约会信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.metadata.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/messages_zh.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>

<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

<style>
.error{
	 color:red;
}
</style>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
.grid_3{
	 padding: 20px;20px
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
    
    if($('#datetimepicker1')[0] != undefined){
		$('#datetimepicker1').datetimepicker({  
			minView: "month",
			format: 'hh:00',
		    todayBtn: true,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true ,
		    autoclose: true,
		    minView: 1 ,
		    startView : 1
		});
	}
    
    $(".selectpicker").selectpicker({  
        noneSelectedText : '请选择'//默认显示内容  
    });  
});
</script>
</head>
<body id="a2">
	<div class="grid_3">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-6 login_left">
	     <form id="dataForm">
						<input class="form-control" name="id" type="hidden" value="${inv.id }"></input>
						<input class="form-control" name="joinId" type="hidden" value="${joinId }"></input>
								<div class="form-group">
									<div>
										<label for="message-text" class="control-label">约会时段:</label>
									</div>
									<div>
										<label class="checkbox-inline" style="margin-left: 10px;">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox1" value="1"> 周一
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox2" value="2"> 周二
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox3" value="3"> 周三
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox4" value="4"> 周四
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox5" value="5"> 周五
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox6" value="6"> 周六
										</label>
										<label class="checkbox-inline">
											<input type="checkbox" name="confirmDate" id="inlineCheckbox0" value="7"> 周日
										</label>
									</div>
									
								</div>
								<div class="form-group" >
							            <label for="message-text" class="control-label">约会时间：</label>  
							            <!--指定 date标记-->  
							           <select  class="form-control"   name="confirmTime" >
													<option value="10">10:00-12:00</option>
													<option value="11">13:00-17:00</option>
													<option value="12">18:00-19:00</option>
											 	    <option value="1">10:00-11:00</option>
													<option value="2">11:00-12:00</option>
													<option value="3">12:00-13:00</option>
													<option value="4">13:00-14:00</option>
													<option value="5">14:00-15:00</option>
													<option value="6">15:00-16:00</option>
													<option value="7">16:00-17:00</option>
													<option value="8">17:00-18:00</option>
													<option value="9">18:00-19:00</option>
										</select>
						        </div> 
								<div class="form-group">
									<label for="message-text" class="control-label">约会区域:</label> 
									<select  class="form-control"   name="confirmLoc" placeholder="必填" required>
											  <c:forEach items="${locList}" var ="loca">
											 	    <option >${loca}</option>
											 </c:forEach>
									</select>
								</div>
						<div class="form-group">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
		subInfoAll("invite");
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
					window.location.href="${pageContext.request.contextPath}/web/info";
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
		$.ajax({
			url : "${pageContext.request.contextPath}/location/query",
			type : 'post',
			dataType : 'json',
			success : function(data) {
				var htmlStr = "";
				for( var  s in data.rows ){
				console.info(data.rows[s].id);
				htmlStr += "<option value="+data.rows[s].id+">"+data.rows[s].locName+"</option>"
				 }
				 $("#pointId").append(htmlStr); 
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	});
</script>


</html>