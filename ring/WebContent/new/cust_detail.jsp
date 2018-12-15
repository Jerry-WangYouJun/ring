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
</head>
<body>
<div class="index-main-about">
    <div class="index-header">
        <div class="col-xs-3"><img src="${pageContext.request.contextPath}/img/logo.jpg" height="18rem">主页</div>
        <div class="col-xs-6">
            <div class="index-header-search">
                <input type="text" class="form-control" placeholder="Search">
            </div>
        </div>
         <div class="col-xs-3 no-pad" onclick="personCenter()"><i class="glyphicon glyphicon-user glyphicon-teather"></i>个人中心</div>
    </div>
    <div class="list-main-bg">
        <c:if test="${cust.sex eq '1'}">
					<img src="${pageContext.request.contextPath}/img/men.jpg"  />
		      	</c:if>
		      	<c:if test="${cust.sex eq '0'}">
							<img src="${pageContext.request.contextPath}/img/women.jpg" />
		      	</c:if>
    </div>
    <div class="list-main-cot">
        <div class="list-main-tittle">基本资料</div>
        <div class="list-main-introduce">
            <ul>
                <li><span class="col-xs-4" style="text-align: right">昵称</span><span class="col-xs-8">${cust.chName }</span></li>
                <li><span class="col-xs-4" style="text-align: right">生日</span><span class="col-xs-8">${cust.birthday }</span></li>
                <li><span class="col-xs-4" style="text-align: right">婚姻状况</span><span class="col-xs-8">市南</span></li>
                <li><span class="col-xs-4" style="text-align: right">所在地</span><span class="col-xs-8">${cust.addtress}</span></li>
                <li><span class="col-xs-4" style="text-align: right">职业</span><span class="col-xs-8">${cust.industry }</span></li>
                <li><span class="col-xs-4" style="text-align: right">学历</span><span class="col-xs-8"> 
               	 <span class="dicValue" name="degree" value="${cust.degree }"></span></span></li>
               	 
               	
                <li><span class="col-xs-4" style="text-align: right">家乡</span><span class="col-xs-8">${cust.hometown }</span></li>
                <li><span class="col-xs-4" style="text-align: right">身高体重</span><span class="col-xs-8">${cust.height }cm, ${cust.weight }kg</span></li>
                <li><span class="col-xs-4" style="text-align: right">婚姻状况</span><span class="col-xs-8">
                	  <span class="day_value dicValue"  name="marriage" value="${cust.marriage }"></span>
                </span></li>
                <li><span class="col-xs-4" style="text-align: right">子女</span><span class="col-xs-8"><span name="children"  class = "dicValue" value="${cust.children }"></span>/人</span></li>
               
                
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
            <ul>
                <li><span class="col-xs-4" >年龄范围 </span><span class="col-xs-8"><span class="dicValue" name="birthday2" value="${cust.birthday2 }"></span></span></li>
                <li><span class="col-xs-4" >经济能力</span><span class="col-xs-8"><span class="dicValue" name="economic" value="${cust.economic }"></span></span></li>
                <li><span class="col-xs-4" >外貌</span><span class="col-xs-8"><span class="dicValue" name="looks" value="${cust.looks }"></span></span></li>
                <li><span class="col-xs-4" >未来生活中的定位 </span><span class="col-xs-8"><span class="dicValue" name="disposition" value="${cust.disposition }"></span></span></li>
                <li><span class="col-xs-4" >未来生活中的扮演的角色</span><span class="col-xs-8">
					<span class="dicValue" name="disposition" value="${cust.disposition }"></span></span></li>
                <li><span class="col-xs-4" >理想的生活方式 </span><span class="col-xs-8"> 
               	 <span class="dicValue" name="lifeType" value="${cust.lifeType }"></span></span></li>
                <li><span class="col-xs-4" >不能接受的类型 </span><span class="col-xs-8"><span class="dicValue" name="nonType" value="${cust.nonType }"></span></span></li>
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