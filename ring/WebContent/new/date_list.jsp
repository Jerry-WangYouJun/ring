<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/new/js/jquery-1.10.2.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/new/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script type="text/javascript">
	 function updateStates(id , states){
		 var str = " ";
		 if(states == '3' || states =='5'){
			 str = window.prompt("请输入拒绝的原因") 
		 }
		 if(str){
		 	window.location.href= "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states +"&remark=" + str;
		 }
	 }
	 
		function  addInvite(id , states){
			//$("#addModal").modal("show");
			window.location.href= "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states ;
		}
		function  updateDating(id , states){
			window.location.href= "${pageContext.request.contextPath}/invite/update?id="+id+"&inviteStates=" + states;
		}
		
		function signUp(id){
			var path = "${pageContext.request.contextPath}/invite/signUp?id=" + id;
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						window.location.href="${pageContext.request.contextPath}/web/dateinfo";
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
		
		 function personCenter(){
			 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
		 }
		 
		 function dateIndex(){
			  window.location.href="${pageContext.request.contextPath}/web/${act}";
		 }
		 $(function() {
				var dic = eval('(${dic})');
				$(".dicValue").each(function(){
					 var field  = $(this).attr("name")
					 var value =  $(this).attr("value");
					 if(dic[field] !=undefined && dic[field][value]!= undefined){
						 $(this).text(dic[field][value]["describ"]);
					 }
				})
			});
</script>
<style type="text/css">
 .menu-list-bottom-line{
 	 width :2000px !important;
 	 margin-left:  -500px;
 }
 .list-right{
 	 width:100% !important;
 }
 .index-list {
    padding: 0rem 1rem 0 1rem !important;
    background-color: #fff;
}
</style>
<title>约会信息</title>
</head>
<body>
<%@include file="/ring/header.jsp"%>
<div class="container">
    <div class="row index-list" style="margin:  10px">
        <div class="row list-right" style="margin:  10px">
            <div class="row  index-list" style="margin:  10px">
				<c:forEach items="${inviteInfo }" var="invite">
							    <div class="row">
							    <p class="index-list-tittle">约会对象-我约的</p>
								 <p class="menu-list-main">
								 	<c:if test="${invite.customerJoin.sex eq '1'}">
										<img src="${pageContext.request.contextPath}/img/men.jpg"  />
							      	</c:if>
							      	<c:if test="${invite.customerJoin.sex eq '0'}">
												<img src="${pageContext.request.contextPath}/img/women.jpg" />
							      	</c:if>
								 
								 ${invite.customerJoin.nickName } <a href="${pageContext.request.contextPath}/web/customer?id=${invite.joinId}">详细信息</a></p>
									<div class="index-list-tap">
					                    <i class="glyphicon glyphicon-bookmark fl">
					                    </i>
					                    		<span>	<c:choose>
										 	 <c:when test="${invite.customerJoin.sex eq '1'}">
										 	 	  男
										 	 </c:when>
										 	 <c:when test="${invite.customerJoin.sex eq '0'}">
										 	 	  女
										 	 </c:when>
											 </c:choose>
										 	</span>
										 	<span class="line"></span>
												 
					                    </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>生日 <span></span></span>
					                    <span class="line"></span>
					                    <span style="color: black;">${invite.customerJoin.birthday }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>身高 <span></span></span>
					                    <span class="line"></span>
					                    <span  style="color: black;">${invite.customerJoin.height }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 现居地 <span></span></span>
					                    <span class="line"></span>
					                    <span  style="color: black;">${invite.customerJoin.addtress }</span>
					                </div>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 邀约状态 
							 			</span> 
							 		</div>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span  style="color: black;">
					                    		<c:if test="${invite.inviteStates eq '1'}">
					                   				  待确认<a href="${pageContext.request.contextPath}/web/detail?id=${invite.id}"> 约会详细信息</a>
											 </c:if>
					 	 					 <c:if test="${invite.inviteStates eq '3'}">
					                   				  已拒绝  原因： ${invite.remark } 
											 </c:if>
											 <c:if test="${invite.inviteStates eq '5'}">
											 	 	  已取消  
											 </c:if>
											 <c:if test="${invite.inviteStates eq '7'}">
											 	 	  约会已结束
											 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
											 </c:if>
					                     </span>
					               </div>
					               <br>
								</div>
								<div class="row">
									 <c:if test="${invite.inviteStates eq '4'  && invite.detail.signFrom ne '1' }">
											 <a class="btn btn-success" href="###" onclick="signUp('${invite.id}')">约会签到</a>
									 </c:if>
								</div>
								<div class="menu-list-bottom-line" ></div>
						    </c:forEach>
            </div>
            
            
            
            <div class="row  index-list" style="margin:10px">
				<c:forEach items="${invitedInfo }" var="invite">
							    <div class="row">
							     <p class="index-list-tittle">约会对象-约我的</p>
								 <p class="menu-list-main">
								 	<c:if test="${invite.customerFrom.sex eq '1'}">
										<img src="${pageContext.request.contextPath}/img/men.jpg"  />
							      	</c:if>
							      	<c:if test="${invite.customerFrom.sex eq '0'}">
												<img src="${pageContext.request.contextPath}/img/women.jpg" />
							      	</c:if>
								 ${invite.customerFrom.nickName } <a href="${pageContext.request.contextPath}/web/customer?id=${invite.joinId}">详细信息</a></p>
									<div class="index-list-tap">
					                    <i class="glyphicon glyphicon-bookmark fl">
					                    </i>
					                    		<span>	<c:choose>
										 	 <c:when test="${invite.customerFrom.sex eq '1'}">
										 	 	  男
										 	 </c:when>
										 	 <c:when test="${invite.customerFrom.sex eq '0'}">
										 	 	  女
										 	 </c:when>
											 </c:choose>
										 	</span>
												 <span> 
											 </span>
					                    </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>生日 <span></span></span>
					                    <span style="color: black;">${invite.customerFrom.birthday }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>身高 <span></span></span>
					                    <span  style="color: black;">${invite.customerFrom.height }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 现居地 <span></span></span>
					                    <span  style="color: black;">${invite.customerFrom.addtress }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 邀约状态</span>
					                </div>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span  style="color: black;">
					                    		 <c:if test="${invite.inviteStates eq '1'}">
					                   				  待确认<a href="${pageContext.request.contextPath}/web/detail?id=${invite.id}"> 约会详细信息</a>
											 </c:if>
					 	 					 <c:if test="${invite.inviteStates eq '3'}">
					                   				  已拒绝  原因： ${invite.remark } 
											 </c:if>
											 <c:if test="${invite.inviteStates eq '5'}">
											 	 	  已取消  
											 </c:if>
											 <c:if test="${invite.inviteStates eq '7'}">
											 	 	  约会已结束
											 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
											 </c:if>
					                     </span>
						               </div>
								</div>
								<div class="row">
									 <c:if test="${invite.inviteStates eq '4'  && invite.detail.signJoin ne '1' }">
											 <a class="btn btn-success" href="###" onclick="signUp('${invite.id}')">约会签到</a>
									 </c:if>
								</div>
								<div class="menu-list-bottom-line"></div>
						    </c:forEach>
            </div>
        </div>
    </div>


</div>
</body>
</html>