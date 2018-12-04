<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>会员列表</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/ring/css/style.css" rel='stylesheet' type='text/css' />
<!----font-Awesome----->
<link href="${pageContext.request.contextPath}/ring/css/font-awesome.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/ring/assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<!----font-Awesome----->
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
			 if(dic[field][value]!= undefined){
				 $(this).text(dic[field][value]["describ"]);
			 }
		})
	 });
	 
</script>
</head>
<body>
<%@include file="/ring/header.jsp"%>
   <div class="profile" style="margin-top:50px">
   	 <div class="col-md-12 profile_left">
   	 	<div class="col_3">
   	        <div class="col-sm-4 row_2">
				<div class="flexslider">
					 <ul class="slides">
						<li data-thumb="${pageContext.request.contextPath}/ring/images/p1.jpg">
							<img src="${pageContext.request.contextPath}/ring/images/p1.jpg" />
						</li>
					 </ul>
				  </div>
			</div>
			<button type="button" class="btn btn-default " onclick="detailInfo()"> 留言</button>
			<button type="button" class="btn btn-default " onclick="addInvite(${cust.id})">  邀约</button>
			<c:if test="${focusId eq 0 }">
				<button type="button" class="btn btn-default " onclick="updateFocus('0')"><i class="im-heart2"></i>  关注</button>
			</c:if>
			<c:if test="${ focusId > 0 }">
				<button type="button" class="btn  btn-success" onclick="deleteFocus(${focusId})"><i class="im-heart"></i>  已关注</button>
			</c:if>
			<div style="margin: 30px"> 
			<div class="col-sm-8 row_1">
				<table class="table_working_hours">
		        	<tbody>
				    </tbody>
				</table>
				
			</div>
			<div class="clearfix"> </div>
		<div class="col_4">
		    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			   <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">关于自己</a></li>
				  <li role="presentation"><a href="#profile1" role="tab" id="profile-tab1" data-toggle="tab" aria-controls="profile1">择偶要求</a></li>
			   </ul>
			   <div id="myTabContent" class="tab-content">
				  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
				    <div class="tab_box">
				    	<h1>爱情宣言</h1>
				    	<p>${cust.declaration }</p>
				    </div>
				    <div class="basic_1">
				    	<h3>基本情况 </h3>
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened_1">
									<td class="day_label">姓名 :</td>
									<td class="day_value">${cust.chName }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">昵称 :</td>
									<td class="day_value">${cust.nickName }</td>
								</tr>
								 <tr class="opened">
									<td class="day_label">生日 :</td>
									<td class="day_value">${cust.birthday }</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label">年龄  :</td>
									<td class="day_value"> ${cust.age }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">婚姻状况:</td>
									<td class="day_value dicValue"  name="marriage" value="${cust.marriage }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">所在地 :</td>
									<td class="day_value dicValue"  name="addtress" value="${cust.addtress}"></td>
								</tr>
							    <tr class="closed">
									<td class="day_label">职业 :</td>
									<td class="day_value closed"><span>${cust.industry }</span></td>
								</tr>
							    <tr class="closed">
									<td class="day_label">学历 :</td>
									<td class="day_value closed"><span class="dicValue" name="degree" value="${cust.degree }"></span></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">家乡 :</td>
									<td class="day_value">${cust.hometown }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">身高/体重 :</td>
									<td class="day_value">${cust.height }cm, ${cust.weight }kg</td>
								</tr>
								<tr class="opened">
									<td class="day_label">祖籍 :</td>
									<td class="day_value">${cust.hometown }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">子女 :</td>
									<td class="day_value " ><span name="children"  class = "dicValue" value="${cust.children }"></span>/人</td>
								</tr>
						    </tbody>
				          </table>
				         </div>
				        <div class="clearfix"> </div>
				    </div>
				    <c:if test="${webUser.role eq '3' }">
					    <div class="basic_1">
					    	<h3> 工作&住房状态</h3>
					    	<div class="basic_1-left">
					    	  <table class="table_working_hours">
					        	<tbody>
					        		<tr class="opened">
										<td class="day_label">工作内容 :</td>
										<td class="day_value">${cust.industry }</td>
									</tr>
								    <tr class="opened">
										<td class="day_label">月收入 :</td>
										<td class="day_value "><span class="dicValue" name="income"  value="${cust.income }"></span></td>
									</tr>
									<tr class="opened">
										<td class="day_label">住房状态 :</td>
										<td class="day_value dicValue"  name="houseStatus" value="${cust.houseStatus }"></td>
									</tr>
								 </tbody>
					          </table>
					         </div>
					         <div class="clearfix"> </div>
					    </div>
				    </c:if>
				  </div>
				  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
				    <div class="basic_3">
				    	<h4>Family Details</h4>
				    	<div class="basic_1 basic_2">
				    	<h3>Basics</h3>
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
							 </tbody>
				          </table>
				         </div>
				       </div>
				    </div>
				 </div>
				 <div role="tabpanel" class="tab-pane fade" id="profile1" aria-labelledby="profile-tab1">
				    <div class="basic_1 basic_2">
				       <div class="basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened">
									<td class="day_label">年龄范围 :</td>
									<td class="day_value dicValue" id="birthday2" value="${cust.birthday2 }"></td>
								</tr>
				        		<tr class="opened">
									<td class="day_label">经济能力 :</td>
									<td class="day_value dicValue" id="birthday2" value="${cust.economic }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">外貌 :</td>
									<td class="day_value dicValue" id="birthday2" value="${cust.looks }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">未来生活中的定位 :</td>
									<td class="day_value dicValue" id="disposition" value="${cust.disposition }"></td>
								</tr>
								<tr class="opened">
									<td class="day_label">未来生活中的扮演的角色:</td>
									<td class="day_value dicValue" id="lifeRole" value="${cust.lifeRole }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">理想的生活方式 :</td>
									<td class="day_value dicValue" id="lifeType" value="${cust.lifeType }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">不能接受的类型 :</td>
									<td class="day_value dicValue" id="nonType" value="${cust.nonType }"></td>
								</tr>
							 </tbody>
				          </table>
				        </div>
				     </div>
				 </div>
		     </div>
		  </div>
	   </div>
   	 </div>
       <div class="clearfix"> </div>
    </div>
  </div>
</div>
<div class="map">

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
	<div class="modal fade" id="inviteModal"  role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: ">
			<div class="modal-content">
				<div class="modal-body">
					 <table id="inviteTable"></table>
				 </div>
				 <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="accInvite()">接受邀请</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<script type="text/javascript">
	
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
	function accInvite(){
		var del = confirm("确认接收邀请，确认后将同时回绝其他邀请！");
		if (!del) {
			return false;
		}
		var selectObj = $("#inviteTable").bootstrapTable('getSelections')[0];
		var id = selectObj.id;
		var url = "${pageContext.request.contextPath}/invite/invite_status";
		 $.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				data: {'id':id , inviteStates:2 } ,
				success : function(data) {
					$("#inviteModal").modal("hide");
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			}); 
		 
	}
	var dic = "";
	function detailInfo() {
		$("#detailModal").modal("show");
	}
	function  addInvite(id){
		$("#addModal").modal({  
		    remote: "${pageContext.request.contextPath}/web/inviteInit?joinId=" + id
		});
	}
	function inviteInfo(){
		$('#inviteTable').bootstrapTable(
				'refresh',{query: {joinId: "${webUser.remark }"}});
		$("#inviteModal").modal("show");
	}
	function closeModel() {
		$("#addModal").modal("hide");
		$(':input', '#dataForm').not(':button,:submit,:reset').val(
				'').removeAttr('checked').removeAttr('checked');
		
	}
	
	function getDicList(){
		
		var url = "${pageContext.request.contextPath}/dic/dicMap";
		 $.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					dic =  data;
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
	}
	$(function(){
		   dic = getDicList();
	});
	
	function getDicDescirb(value, field) {
		
		if (dic.hasOwnProperty(field) && dic[field][value] != undefined) {
			return dic[field][value]["describ"];
		} else {
			return "-";
		}
	}
	//转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
            
            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
            
            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
        }
    }
	
	</script>
<!-- FlexSlider -->
<script defer src="${pageContext.request.contextPath}/ring/js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ring/css/flexslider.css" type="text/css" media="screen" />
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>   
</body>
</html>