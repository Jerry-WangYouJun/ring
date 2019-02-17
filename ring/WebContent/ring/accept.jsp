<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>约会信息</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/jquery.metadata.js"></script>
<script src="${pageContext.request.contextPath}/js/validate/messages_zh.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap-select.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
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
		    todayBtn: false,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true ,
		    startDate: new Date(),
		    minView: 1
		}).on('changeDate', function(ev){
		   var hour =  $("#confirmTime").val();
		   var select = ev.date.getHours();
		   var flag = true
		   if(hour != select){
			    if( !(hour == '10-12' && select > 9 && select < 12) && !( hour == '13-17' && select > 12 && select < 17)){
			    	flag = false ;
			    }
		   }
		   if(!flag){
			   alert("选择的时间与邀请人的时间冲突，请重新选择")
			  $("#preDate").val("");
		   }
		});
		
	}
});

		$(function(){
			 var str = "${inv.detail.confirmDate}";
			 var strArr = str.split(",");
			 var disableArr = new Array();
			 for(var i = 0 ; i < 7 ; i ++){
				 for(var s in strArr){
					 $("#inlineCheckbox" + strArr[s]).attr("checked", 'checked');
					 if(s == i ){
						  continue;
					 }
				 }
				 disableArr.push(i)
			 }
			 $('#datetimepicker1').datetimepicker('setDaysOfWeekDisabled', strArr);
			 $("#confirmTime").val('${inv.detail.confirmTime}');
		})
		
	 function personCenter(){
		 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
	 }
		
		function subRefuse(){
			$("#detailForm").submit();
		}
		
		$(function() {
			var dic = eval('(${dic})');
			$(".dicSelect").each(
					function() {
						var field = this.name;
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
			$(".dicValue").each(function(){
				 var field  = $(this).attr("name")
				 var value =  $(this).attr("value");
				 if(dic[field] !=undefined && dic[field][value]!= undefined){
					 $(this).text(dic[field][value]["describ"]);
				 }
			})

			
		});
</script>
</head>
<body id="a2">
<div class="modal fade" id="myModal" tabindex="-2" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">拒绝约会</h4>
				</div>
				<div class="modal-body">
					<form id="detailForm" action="${pageContext.request.contextPath}/invite/state">
					  <input  class="form-control" name="id" id="id" type="hidden"  value="'${invite.id}'"></input>
					  <input  class="form-control" name="inviteStates"  id="inviteStates" type="hidden" ></input>
						<div class="form-group">
							<label for="recipient-name" class="control-label">拒绝原因:</label> 
							 <select
							class="form-control dicSelect" name="remark" id="remark" placeholder="必填"
							required></select>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="subRefuse()">提交</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
<div class="index-main">
    <div class="index-header">
        <div class="col-xs-6"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="18rem">主页</div>
        <div class="col-xs-6 no-pad" onclick="personCenter()"><i class="glyphicon glyphicon-user glyphicon-teather"></i>个人中心</div>
    </div>
    </div>
	<div class="grid_3">
  <div class="container">
  
   <div class="services">
   	  <div class="col-sm-6 login_left">
	     <form id="dataForm">
						<input class="form-control" name="id" type="hidden" value="${inv.id }"></input>
						<input class="form-control" name="joinId" type="hidden" value="${joinId }"></input>
						        <c:if test="${not empty detail.location }">
									<div class="form-group" >
											<input type="radio" name="pointId" value="${detail.confirmLoc}">
								            <label for="message-text" class="control-label">约会时间一：</label>  
								            <!--指定 date标记-->  
								             <label for="message-text" class="control-label"> ${detail.preDate} </label>  
							        </div> 
									<div class="form-group">
										<label for="message-text" class="control-label">约会地点一:</label> 
										<label for="message-text" class="control-label"> ${detail.location.location} - ${detail.location.locName} </label>
									</div>
						        </c:if>
								 <c:if test="${not empty detail.location2 }">
									<div class="form-group" >
									<input type="radio" name="pointId" value="${detail.confirmLoc2}">
								            <label for="message-text" class="control-label">约会时间二：</label> 
								            <label for="message-text" class="control-label"> ${detail.preDate2} </label> 
							        </div> 
									<div class="form-group">
										<label for="message-text" class="control-label">约会地点二:</label> 
										<label for="message-text" class="control-label">  ${detail.location2.location} - ${detail.location2.locName}  </label>
									</div>
								 </c:if>
								 <c:if test="${not empty detail.location3 }">
									<div class="form-group" >
									<input type="radio" name="pointId" value=" ${detail.confirmLoc3}">
								            <label for="message-text" class="control-label">约会时间三：</label> 
								            <label for="message-text" class="control-label"> ${detail.preDate3} </label> 
							        </div> 
									<div class="form-group">
										<label for="message-text" class="control-label">约会地点三:</label> 
										<label for="message-text" class="control-label">  ${detail.location3.location} - ${detail.location3.locName} </label>
									</div>
								 </c:if>
								
						
						<div class="form-group">
							<button type="button" class="btn btn-primary" onclick="subInfo()">同意</button>
							<%-- <c:if test="${inv.inviteStates  eq  '1' }">
								<button type="button" class="btn btn-primary" onclick="subInfo()">拒绝</button>
							</c:if> --%>
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
		var a = $("input[name='pointId']:checked").val();
		 if(a){
			subInfoAll("invite");
		 }else{
			 alert("请选择时间地点")
		 }
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
					if(data.obj == "4"){
						window.location.href="${pageContext.request.contextPath}/web/dateinfo";
					}else{
						window.location.href="${pageContext.request.contextPath}/web/info";
					}
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