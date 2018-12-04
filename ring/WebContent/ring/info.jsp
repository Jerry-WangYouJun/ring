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
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
<script type="text/javascript">
	 function updateStates(id , states){
		 var str = "";
		 if(states == '3' || states =='5'){
			 str = window.prompt("请输入拒绝的原因") 
		 }
		 window.location.href= "${basePath}/invite/state?id="+id+"&inviteStates=" + states +"&remark=" + str;
	 }
	 
		function  addInvite(id , states){
			//$("#addModal").modal("show");

			$("#addModal").modal({  
			    remote: "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states
			});
		}
		function  updateDating(id , states){
			if(confirm("只有一次修改约会信息的机会，确定修改？")){
				$("#addModal").modal({  
				    remote: "${pageContext.request.contextPath}/invite/update?id="+id+"&inviteStates=" + states
				});
			 }
		}
		
		function signUp(){
			var path = "${pageContext.request.contextPath}/invite/signUp?id=${inviteId}";
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
		<div class="container-fluid"  style="margin-top:50px">
			<div class="row container">
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="col-md-6 col-xs-6 active">
						<a href="#home" role="tab" data-toggle="tab">我是邀请人</a>
					</li>
					<li role="presentation" class="col-md-6 col-xs-6">
						<a href="#profile" role="tab" data-toggle="tab">我是受邀人</a>
					</li>
				</ul>

				<div class="tab-content" style="margin-bottom: 93px;">
					<div role="tabpanel" class="tab-pane active" id="home">
						    <c:forEach items="${inviteInfo }" var="invite">
							    <div>
									<h3> 受邀人：${invite.customerJoin.nickName } <a href="${pageContext.request.contextPath}/web/customer?id=${invite.joinId}">详细信息</a></h3>
									<h3> 性别：
										 <c:choose>
										 	 <c:when test="${invite.customerJoin.sex eq '1'}">
										 	 	  男
										 	 </c:when>
										 	 <c:when test="${invite.customerJoin.sex eq '0'}">
										 	 	  女
										 	 </c:when>
										 </c:choose>
									</h3>
									<h3> 生日：${invite.customerJoin.birthday }</h3>
									<h3> 约会时间范围：${invite.detail.confirmDate } </h3>
									<h3> 约会地点范围：${invite.detail.confirmLoc }  </h3>	  
									<p> 状态： 
										<c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	  未确认
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '2'}">
										 	 	  已接受
										 	 	   <a href="##" onclick="updateStates('${invite.id}','4')">确定约会</a>
										 	 	   <a href="##" onclick="updateStates('${invite.id}','5')">取消约会</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '3'}">
										 	 	  已拒绝   原因：${invite.remark }
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '4'}">
										 	 	  准备约会，约会时间：${invite.detail.preDate}
										 	 	  <a href="##" onclick="updateStates('${invite.id}','6')">申请取消约会</a>
										 	 	  <a href="##" onclick="updateDating('${invite.id}','4')">修改约会地点</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '5'}">
										 	 	  已取消：${invite.remark}
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '6'}">
										 	 	  系统审核中
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">申请取消约会</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="###" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:when>
										 </c:choose>
									</p>
									<hr />
								</div>
						    </c:forEach>
					</div>
					<div role="tabpanel" class="tab-pane" id="profile">
					     <c:forEach items="${invitedInfo }" var="invite">
						    <div>
						    	<h3> <a href="${pageContext.request.contextPath}/web/detail?id=${invite.id}">约会详细信息</a> </h3>
								<h3> 邀请人：${invite.customerFrom.nickName } <a href="${pageContext.request.contextPath}/web/customer?id=${invite.fromId}">详细信息</a></h3>
								<h3> 性别：
									<c:choose>
										 	 <c:when test="${invite.customerFrom.sex eq '1'}">
										 	 	  男
										 	 </c:when>
										 	 <c:when test="${invite.customerFrom.sex eq '0'}">
										 	 	  女
										 	 </c:when>
										 </c:choose>
								</h3>
								<h3> 生日: ${invite.customerFrom.birthday }</h3>
								<h3> 约会时间范围：${invite.detail.confirmDate } </h3>
								<h3> 约会地点范围：${invite.detail.confirmLoc }  </h3>	  
								<p> 
									<c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	 <a href="###" onclick="addInvite('${invite.id}','2')">同意约请</a>
								      			 <a href="##" onclick="updateStates('${invite.id}','3')">拒绝约请</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '2'}">
										 	 	  已接受
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '3'}">
										 	 	  已拒绝  原因：${invite.remark }
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '4'}">
										 	 	  准备约会，约会时间：${invite.detail.preDate}
										 	 	 约会地点：${invite.pointLocation.location},${invite.pointLocation.address},${invite.pointLocation.locName}
										 	 	<div>  <a href="##" onclick="updateStates('${invite.id}','6')">申请取消约会</a>
										 	 	   	<a href="##" onclick="updateDating('${invite.id}','4')">修改约会地点</a>
										 	 	   	<a href="##" onclick="updateDating('${invite.id}','0')">约会爽约</a>
										 	 	 </div>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '6'}">
										 	 	  系统审核中
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">申请取消约会</a>
										 	 </c:when>
										 	<c:when test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:when>
										 </c:choose>
								 	  
								</p>
								<hr />
							</div>
					    </c:forEach>
					</div>
				</div> 
			</div>
			<div class="row dingwei" >
				<p class="text-center">
					<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick="signUp()">约会签到</button>
				</p>
				
			</div>
		</div>
 	<div class="modal fade" id="addModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: ">
				<div class="modal-content">
					<div class="modal-body">
					 </div>
				</div>
			</div>
		</div>
</body>
</html>