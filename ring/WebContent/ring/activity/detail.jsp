<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>活动详情</title>
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
	 function invite(joinId){
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
	 
	 function addDetail(actId  ){
		  window.location.href="${pageContext.request.contextPath}/act/addDetail?actId=" + actId;
	 }
	 
	 function updateAct(id , state ){
		  window.location.href="${pageContext.request.contextPath}/act/updateDetail?state=" + state + "&id="  + id ;
		  
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

<%@include file="/ring/activity/header.jsp"%>
   <div class="profile" style="margin-top:70px">
   	 <div class="col-md-12 profile_left">
   	 		<h2>活动名称 : ${act.actName }</h2>
   	 	
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
			<c:choose>
				<c:when test="${act.actState == '0' || act.actState == null}">
					  活动待审核
				</c:when>
					 <c:when test="${ empty act.detail   }">
						<button type="button" class="btn btn-default " onclick="addDetail('${act.id}')"> 报名 </button>
					 </c:when>
					 <c:otherwise>
					 		<c:if test="${  act.detail.detailState eq '0'}">
									<button type="button" class="btn btn-default " onclick="updateAct('${act.detail.id}','1')"> 报名 </button>
							</c:if>
							<c:if test="${  act.detail.detailState eq '1'}">
									<i class="im-heart"></i> 已申请待审核 
									<button type="button" class="btn  btn-success" onclick="updateAct('${act.detail.id}','0')"> 取消申请 </button>
							</c:if>
				 			<c:if test="${  act.detail.detailState eq '2'}">
				 			  	  已加入
									<button type="button" class="btn  btn-success" onclick="updateAct('${act.detail.id}','4')"> 退出活动 </button>
							</c:if>
							<c:if test="${  act.detail.detailState eq '3'}">
									 已缴费
							</c:if>
							<c:if test="${  act.detail.detailState eq '5'}">
										已结束
									<button type="button" class="btn  btn-success" >写感想 </button>
							</c:if>
					 </c:otherwise>
			</c:choose>
			<div style="margin: 30px"> 
		<div class="col_4">
		    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			   <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">活动详情</a></li>
			   </ul>
			   <div id="myTabContent" class="tab-content">
				  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
				    <div class="tab_box">
				    	<h1>活动描述</h1>
				    	<p> ${act.editorValue }</p>
				    	<p>${act.tags }</p>
				    </div>
				    <div class="basic_1">
				    	<h3>基本情况 </h3>
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened_1">
									<td class="day_label">主办方 :</td>
									<td class="day_value" name="admin" value="${act.admin}"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">活动时间 :</td>
									<td class="day_value">${act.actDate }</td>
								</tr>
								 <tr class="opened">
									<td class="day_label">活动地点 :</td>
									<td class="day_value">${act.actLoca }</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label"> 详细地址  :</td>
									<td class="day_value"> ${act.actAddress }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">活动形式:</td>
									<td class="day_value dicValue"  name="actForm" value="${act.actForm }"></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">活动状态 :</td>
									<td class="day_value dicValue"  name="actState" value="${act.actState}"></td>
								</tr>
							    <tr class="closed">
									<td class="day_label">费用 :</td>
									<td class="day_value closed"><span>${act.money }</span></td>
								</tr>
						    </tbody>
				          </table>
				         </div>
				        <div class="clearfix"> </div>
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
		$('#detailTable').bootstrapTable(
				'refresh',{query: {dateingId: 1}});
		$("#detailModal").modal("show");
	}
	
	function  addInvite(id){
		//$("#addModal").modal("show");

		$("#addModal").modal({  
		    remote: "${pageContext.request.contextPath}/web/inviteInit?joinId=" + id
		});
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
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>   
</body>
</html>