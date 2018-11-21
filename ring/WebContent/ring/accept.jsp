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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
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
			format: 'yyyy-mm-dd hh:00',
		    todayBtn: true,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true ,
		    autoclose: true,
		    minView: 1
		});
	}
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
						<c:choose>
							 <c:when test="${inv.inviteStates eq '2' }">	 
							       <div class="form-group">
									<label for="message-text" class="control-label">约会时段:${invite.remark }</label>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">约会区域:</label> 
									<select  class="form-control"   name="remark" placeholder="必填" required>
											  <c:forEach items="${locList}" var ="loca">
											 	    <option >${loca}</option>
											 </c:forEach>
									</select>
								</div>
							 </c:when>
							 <c:when test="${inv.inviteStates eq '1' }">	 
								<div class="form-group">
								
									<label for="message-text" class="control-label">约会时段:</label>
										<select  class="form-control"  id="confirmLoc" name="detail.confirmLoc" disabled="disabled"  placeholder="必填" required>
											 <c:forEach items="${times}" var ="val">
											 	    <option value="${val }">${val }</option>
											 </c:forEach>
										</select>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">约会区域:</label> 
									<select  class="form-control"   name="detail.confirmDate" placeholder="必填" required  disabled="disabled">
											  <c:forEach items="${locList}" var ="loca">
											 	    <option >${loca.locName}</option>
											 </c:forEach>
									</select>
								</div>
								<div class="form-group" >
							            <label for="message-text" class="control-label">约会时间：</label>  
							            <!--指定 date标记-->  
							            <div class='input-group date' id='datetimepicker1'  >  
							                <input type='text' class="form-control"  name="preDate" />  
							                <span class="input-group-addon" >  
							                    <span class="glyphicon glyphicon-calendar"></span>  
							                </span>  
							            </div>   
						        </div> 
								<div class="form-group">
									<label for="message-text" class="control-label">约会地点:</label> 
									<select  class="form-control"   name="pointId" placeholder="必填" required>
											  <c:forEach items="${locList}" var ="loca">
											 	    <option value="${loca.id}">${loca.location} - ${loca.address}</option>
											 </c:forEach>
									</select>
								</div>
							</c:when>
						</c:choose>
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