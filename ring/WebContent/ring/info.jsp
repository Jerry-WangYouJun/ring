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
</script>
</head>
<body>
		<div class="container-fluid">
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
									<h3> 受邀人：${invite.customerJoin.nickName } <a href="##">详细信息</a></h3>
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
									<p> 状态： 
										<c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	  未确认
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '2'}">
										 	 	  已接受
										 	 	   <a href="##" onclick="updateStates('${invite.id}','4')">确定约会</a>
										 	 	   <a href="##" onclick="updateStates('${invite.id}','5')">取消取消</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '3'}">
										 	 	  已拒绝   原因：${invite.remark }
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '4'}">
										 	 	  准备约会，约会时间：${invite.detail.preDate}
										 	 	  <a href="##" onclick="updateStates('${invite.id}','6')">申请取消约会</a>
										 	 	  <a href="##" onclick="addInvite('${invite.id}','4')">修改约会地点</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '6'}">
										 	 	  系统审核中
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">申请取消约会</a>
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
								<h3> 邀请人：${invite.customerFrom.nickName } <a href="##">详细信息</a></h3>
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
										 	 	  <a href="##" onclick="updateStates('${invite.id}','6')">申请取消约会</a>
										 	 	  <a href="##" onclick="addInvite('${invite.id}','4')">修改约会地点</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '6'}">
										 	 	  系统审核中
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">申请取消约会</a>
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
					<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick=" getPrepay()">充值续费</button>
				</p>
				<p class="text-center">
					<a href="${basePath}/card/search?iccid=${info.ICCID}">历史续费查询</a>
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