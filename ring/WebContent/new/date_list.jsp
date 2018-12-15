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
			  window.location.href="${pageContext.request.contextPath}/web/info";
		 }
</script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <div class="row index-header">
        <div class="col-xs-3"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="18rem">主页</div>
        <div class="col-xs-6">
            <div class="index-header-search">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </div>
       <div class="col-xs-3 no-pad" onclick="personCenter()"><i class="glyphicon glyphicon-user glyphicon-teather"></i>个人中心</div>
    </div>
    <div class="row index-menu">
        <div class="col-xs-3"><span class="on" onclick="dateIndex()">全部</span></div>
        <div class="col-xs-3"><span>待接受</span></div>
        <div class="col-xs-3"><span>待确认</span></div>
        <div class="col-xs-3"><span>待评价</span></div>
    </div>
    <div class="row index-list" style="margin:  10px">
        <div class="col-xs-8 list-right">
            <div class="row  index-list">
				<c:forEach items="${inviteInfo }" var="invite">
							    <div class="row" style="margin:  10px">
							    <p class="index-list-tittle">约会对象</p>
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
										 <span>  状态： 
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
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">撤回申请</a>
										 	 </c:when>
										 	 <c:when test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="###" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:when>
										 </c:choose>
										 </span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>生日 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerJoin.birthday }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>身高 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerJoin.height }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 现居地 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerJoin.addressProvince }-${invite.customerJoin.addressCity}-${invite.customerJoin.addressCountry }</span>
					                </div>
					                <br>
					                 <c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	 <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间 <span></span></span>
								                    <span> ${invite.detail.preDate} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location.location}, ${invite.detail.location.locName} </span>
								                </div><br>
								                <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间2 <span></span></span>
								                    <span> ${invite.detail.preDate2} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location2.location}, ${invite.detail.location2.locName} </span>
								                </div><br>
								                <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间3 <span></span></span>
								                    <span> ${invite.detail.preDate3} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location3.location}, ${invite.detail.location3.locName} </span>
								                </div>
										 	 </c:when>
										 	 <c:otherwise>
										 	 <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间 <span></span></span>
								                    <span> ${invite.detail.confirmDate} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.pointLocation.location}, ${invite.pointLocation.locName} </span>
								                </div>
										 	 </c:otherwise>
										 </c:choose>
					                
									<hr />
								</div>
								<div class="row">
									  <c:if test="${invite.inviteStates eq '4'}">
											 <a class="btn btn-success" href="###" onclick="signUp('${invite.id}')">约会签到</a>
									 </c:if>
								</div>
						    </c:forEach>
            </div>
            
            
            
            <div class="row  " style="margin:10px">
				<c:forEach items="${invitedInfo }" var="invite">
							    <div class="row">
							    <p class="index-list-tittle">约会对象</p>
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
					                    </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
										 <span>  状态： 
										<c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	 <a href="###" onclick="addInvite('${invite.id}','1')">同意约请</a>
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
										 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">撤回申请</a>
										 	 </c:when>
										 	<c:when test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:when>
										 </c:choose>
										 </span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>生日 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerFrom.birthday }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span>身高 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerFrom.height }</span>
					                </div>
					                <br>
					                <div class="index-list-tap col-lg-12 col-xs-12">
					                    <span> 现居地 <span></span></span>
					                    <span class="line"></span>
					                    <span>${invite.customerFrom.addressProvince }-${invite.customerFrom.addressCity}-${invite.customerFrom.addressCountry }</span>
					                </div>
					                <br>
					                <c:choose>
										 	 <c:when test="${invite.inviteStates eq '1'}">
										 	 	 <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间 <span></span></span>
								                    <span> ${invite.detail.preDate} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location.location}, ${invite.detail.location.locName} </span>
								                </div><br>
								                <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间2 <span></span></span>
								                    <span> ${invite.detail.preDate2} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location2.location}, ${invite.detail.location2.locName} </span>
								                </div><br>
								                <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间3 <span></span></span>
								                    <span> ${invite.detail.preDate3} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.detail.location3.location}, ${invite.detail.location3.locName} </span>
								                </div>
										 	 </c:when>
										 	 <c:otherwise>
										 	 <div class="index-list-tap col-lg-12 col-xs-12">
								                    <span> 约会时间 <span></span></span>
								                    <span> ${invite.detail.confirmDate} </span>
								                    <span class="line"></span>
								                    <span> 地点 <span></span></span>
								                    <span> ${invite.pointLocation.location}, ${invite.pointLocation.locName} </span>
								                </div>
										 	 </c:otherwise>
										 </c:choose>
								</div>
								<div class="row">
									 <c:if test="${invite.inviteStates eq '4'  && invite.detail.signJoin ne '1' }">
											 <a class="btn btn-success" href="###" onclick="signUp('${invite.id}')">约会签到</a>
									 </c:if>
								</div>
						    </c:forEach>
            </div>
        </div>
        <div class="menu-list-bottom-line"></div>
    </div>


</div>
</body>
</html>