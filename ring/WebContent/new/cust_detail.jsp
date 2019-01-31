<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script src="${pageContext.request.contextPath}/new/js/public.js"></script>
<title>会员资料</title>
<script>
		 var status = '${cust.examine }'
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
	 function invite(joinId){
		 
		 if(status != '9'){
			 var url = "${pageContext.request.contextPath}/web/inviteInit?id=" + joinId;
			 $.ajax({
					url : url,
					type : 'post',
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							alert(data.msg);
							window.location.href="${pageContext.request.contextPath}/web/index";
						} else {
							alert(data.msg);
						}
	
					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				});
		 }
	 }
	 
	 function updateFocus(state ){
		  var id = "${cust.id}"
		  window.location.href="${pageContext.request.contextPath}/customer/insertFocus?toId=" + id;
		  
	 }
	 
	 function deleteFocus(id ){
		  var toId = "${cust.id}"
		  window.location.href="${pageContext.request.contextPath}/customer/deleteFocus?id=" + id + "&toId="+ toId;
		  
	 }
	 
	 $(function(){
		 var dic = eval('(${dic})');
		 var marriageVal = "${cust.marriage }";
		 var arr = dic.marriage;
		$(".dicValue").each(function(){
			 var field  = $(this).attr("name")
			 var value =  $(this).attr("value");
			 if(dic[field] !=undefined && dic[field][value]!= undefined){
				 $(this).text(dic[field][value]["describ"]);
			 }
		})
		if(parseInt("${cust.inviteFlag}")  > 0){
			 $("#flag").hide()
		}
	 });
	 
	 
	 function detailInfo() {
			$("#detailModal").modal("show");
		}
	 
	 function addMsg(){
			var flag = confirm("确认提交留言？提交后讲不能修改");
			if(flag){
				var url = "${pageContext.request.contextPath}/message/remind_edit?joinId=${cust.id}&msg="+ $("#msg").val();
				$.ajax({
					url : url,
					type : 'post',
					dataType : 'json',
					success : function(data) {
						$("#detailModal").modal("hide");
					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				}); 
			 
			}
		}
	 
	 function  addInvite(id){
			window.location.href =  "${pageContext.request.contextPath}/web/inviteInit?joinId=" + id;
		}
	 function personCenter(){
		 window.location.href="${pageContext.request.contextPath}/new/person_center.jsp";
	 }
	 
	 
</script>
<style type="text/css">
span{
	 padding-left: 0px !important;
	  padding-right: 5px !important;
}
.spanleft{
	 color:#999;
}
</style>
</head>
<body>
<div class="index-main-about">
   <%@include file="/ring/header.jsp"%>
   <script src="${pageContext.request.contextPath}/new/js/bootstrap.min.js"></script>
    <div class="list-main-bg">
    			<c:if test="${empty cust.headImage}">
        			<c:if test="${cust.sex eq '1'}">
					<img src="${pageContext.request.contextPath}/img/men.jpg"  />
		      	</c:if>
		      	<c:if test="${cust.sex eq '0'}">
							<img src="${pageContext.request.contextPath}/img/women.jpg" />
		      	</c:if>
    			</c:if>
    			<c:choose>
    				  <c:when test="${fn:startsWith(cust.headImage,'http')}">
    				  		<img src="${cust.headImage}" />
    				  </c:when>
    				  <c:otherwise>
    				  	     <img src="${pageContext.request.contextPath}/upload/${cust.headImage}" >
    				  </c:otherwise>
    			</c:choose>
    </div>
    <div class="list-main-cot">
        <div class="list-main-tittle">基本资料</div>
        <div class="list-main-introduce">
            <ul style="padding: 10px">
                <li><span class="col-xs-4 spanleft" style="text-align: right;padding-left:0px ">昵称</span><span class="col-xs-4" >${cust.chName }</span></li>
               	<li>	<span class="col-xs-4 spanleft" style="text-align: right">生日</span><span class="col-xs-8">${cust.birthday }</span>
               	</li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">家乡</span><span class="col-xs-8">${cust.hometown }</span></li>
                <li>	<span class="col-xs-4 spanleft" style="text-align: right">现居地</span><span class="col-xs-8">${cust.addtress}</span></li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">活动范围</span><span class="col-xs-8">${cust.loca }</span></li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">身高体重</span><span class="col-xs-8">${cust.height }cm, ${cust.weight }kg</span></li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">婚姻状况</span><span class="col-xs-8">
                	  <span class="day_value dicValue"  name="marriage" value="${cust.marriage }"></span>
                </span></li>
                <li><span class="col-xs-4 spanleft"  style="text-align: right">学历</span><span class="col-xs-8"> 
               	 <span class="dicValue" name="degree" value="${cust.degree }"></span></span></li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">职业</span><span class="col-xs-8"><span name="industry"  class = "dicValue" value="${cust.industry }"></span></span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">工作时间</span><span class="col-xs-8"><span name="weekday"  class = "dicValue" value="${cust.weekday }"></span></span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">工作性质</span><span class="col-xs-8"><span name="travel"  class = "dicValue" value="${cust.travel }"></span></span></li>
                <li><span class="col-xs-4 spanleft" style="text-align: right">住房状态</span><span class="col-xs-8"><span name="houseStatus"  class = "dicValue" value="${cust.houseStatus }"></span></span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">用车状态</span><span class="col-xs-8"><span name="carStatus"  class = "dicValue" value="${cust.carStatus }"></span></span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">月收入(税前)</span><span class="col-xs-8"><span name="income"  class = "dicValue" value="${cust.income }"></span></span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">性格</span><span class="col-xs-8">${cust.disposition }</span></li>
				<li><span class="col-xs-4 spanleft" style="text-align: right">兴趣爱好</span><span class="col-xs-8"> ${cust.hobby }</span></li>

                
                <li class="introduce-btn">
                    <span class="col-xs-4" style="text-align: right">
                    <c:if test="${focusId eq 0 }">
						<a href="#" class="btn btn-warning  btn-sm" role="button" onclick="updateFocus('0')">关注</a>
					</c:if>
					<c:if test="${ focusId > 0 }">
						<a href="#" class="btn btn-success  btn-sm" role="button" onclick="deleteFocus(${focusId})">已关注</a>
					</c:if>
					</span>
                    <span class="col-xs-8"><a href="#" class="btn btn-info btn-sm" role="button"  onclick="detailInfo()">留言</a></span></li>
            </ul>
        </div>
    </div>
    <div class="list-main-about">
        <div class="list-main-about-top"><i class="glyphicon glyphicon-user"></i> 自我介绍</div>
        <div class="list-main-about-cot">
            ${cust.introduction }
        </div>
    </div>
    <div class="list-main-about">
        <div class="list-main-about-top"><i class="glyphicon glyphicon-bullhorn"></i> 爱情宣言</div>
        <div class="list-main-about-cot">
           	${cust.declaration } 
        </div>
    </div>
    <div class="list-main-about">
        <div class="list-main-about-top"><i class="glyphicon glyphicon-tags"></i> 择偶要求</div>
        <div class="list-main-about-cot">
            	<div class="list-main-introduce">
            <ul style="padding: 10px">
                <li><span class="col-xs-5 spanleft" style="text-align: right">年龄范围 </span>
                	<span class="col-xs-7">
                	   <c:if test="${empty cust.age1}"> — </c:if> ${cust.age1 } 至
                	   <c:if test="${empty cust.age2}"> — </c:if> ${cust.age2 }</span></li>
                <li><span class="col-xs-5 spanleft" style="text-align: right" >身高范围</span>
                	<span class="col-xs-7">
           			<c:if test="${empty cust.height1}"> — </c:if> ${cust.height1 } 至
           	   		<c:if test="${empty cust.height2}"> — </c:if> ${cust.height2 }</span>
                	</li>
                <li><span class="col-xs-5 spanleft" style="text-align: right">工作时间</span><span class="col-xs-7"><span name="weekday2"  class = "dicValue" value="${cust.weekday2 }"></span></span></li>
				<li><span class="col-xs-5 spanleft" style="text-align: right">工作性质</span><span class="col-xs-7"><span name="travel2"  class = "dicValue" value="${cust.travel2 }"></span></span></li>
                <li><span class="col-xs-5 spanleft" style="text-align: right">住房状态</span><span class="col-xs-7"><span name="houseStatus2"  class = "dicValue" value="${cust.houseStatus2 }"></span></span></li>
				<li><span class="col-xs-5 spanleft" style="text-align: right">用车状态</span><span class="col-xs-7"><span name="carStatus2"  class = "dicValue" value="${cust.carStatus2 }"></span></span></li>
				<li><span class="col-xs-5 spanleft" style="text-align: right">月收入(税前)</span><span class="col-xs-7"><span name="economic"  class = "dicValue" value="${cust.economic }"></span></span></li>
				<li><span class="col-xs-5 spanleft" style="text-align: right">性格</span><span class="col-xs-7">${cust.disposition2 }</span></li>
				<li><span class="col-xs-5 spanleft" style="text-align: right">兴趣爱好</span><span class="col-xs-7"> ${cust.hobby2 }</span></li>
               <%--  <li><span class="col-xs-4" >外貌</span><span class="col-xs-8"><span class="dicValue" name="looks" value="${cust.looks }"></span></span></li> --%>
                <%-- <li><span class="col-xs-6" >未来生活中的定位 </span><span class="col-xs-6">${cust.lifeType }</span></li> --%>
                <li><div><span class="col-xs-5 spanleft" style="text-align: right">生活中的角色</span><span class="col-xs-7">
					<span name="lifeRole"  class = "dicValue" value="${cust.lifeRole }"></span></span></div></li>
                <li><span class="col-xs-5 spanleft" style="text-align: right" >理想的生活方式 </span><span class="col-xs-7"> 
               	 <span class="dicValue" name="lifeType" value="${cust.lifeType }"></span></span></li>
                <li><span class="col-xs-5 spanleft" style="text-align: right">不能接受的类型 </span><span class="col-xs-7"><span class="dicValue" name="nonType" value="${cust.nonType }"></span></span></li>
            </ul>
        </div>
        </div>
    </div>
</div>
    <div class="list-main-about-button">
        <button class="main-about-btn"  onclick="addInvite(${cust.id})" id="flag">邀 约</button>
    </div>
    
    
    <div class="modal fade" id="detailModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: ">
				<div class="modal-content">
					<div class="modal-body">
						 <table id="detailTable"> </table>
						 <form action="">
						 	 <h3>我的留言</h3> <textarea name="msg" id="msg"></textarea>
						 </form>
					 </div>
					 <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="addMsg()">提交留言</button>
				</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
</body>
</html>