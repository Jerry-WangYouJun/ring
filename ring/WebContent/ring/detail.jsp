<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>约会详情</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  

<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/new/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<style type="text/css">
a {
    color: #428bca ;
}
</style>
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
	 
	 function updateStates(id , states){
		 var str = "";
		 if(states == '3' || states =='5'){
			 /* layer.prompt({title: '请输入拒绝的原因', formType: 2}, function(text, index){
				 layer.close(index);
				 window.location.href= "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states +"&remark=" + text;
				}); */
				$("#id").val(id);
				$("#inviteStates").val(states);
			 $("#myModal").modal("show");	
		 }else{
			 window.location.href= "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states +"&remark=" + str;
		 }
	 }
	 
		function  addInvite(id , states){
			window.location.href = "${pageContext.request.contextPath}/invite/state?id="+id+"&inviteStates=" + states;
		}
		function  updateDating(id , states){
			window.location.href = "${pageContext.request.contextPath}/invite/update?id="+id+"&inviteStates=" + states;
		}
		
		function signUp(){
			var path = "${pageContext.request.contextPath}/invite/signUp?id=${invite.id}";
			$.ajax({
				url : path,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						window.location.href="${pageContext.request.contextPath}/web/detail?id=${invite.id}";
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
	 
	 $(function(){
		 var dic = eval('(${dic})');
		 var marriageVal = "${cust.marriage }";
		 var arr = dic.marriage;
		$(".dicValue").each(function(){
			 var field  = $(this).attr("name")
			 var value =  $(this).attr("value");
			 if(dic[field]!=undefined && dic[field][value]!= undefined){
				 $(this).text(dic[field][value]["describ"]);
			 }
		})
		$(".table_working").hide();
	 });
	 function detailView(){
		 $(".table_working").toggle();
	 }
	 
	 function addActivity(){
		 window.location.href="${pageContext.request.contextPath}/ring/activity/activity.jsp" ;
	}

	function indexPage(){
		window.location.href="${pageContext.request.contextPath}/web/index" ;
	}
	
	function subRefuse(){
		$("#dataForm").submit();
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
<body>
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
					<form id="dataForm" action="${pageContext.request.contextPath}/invite/state">
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
    <%@include file="/ring/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 
    </div>
   <div class="profile" style="margin-top:0px">
   	 <div class="col-md-12 profile_left">
   	 	
   	 	<div class="col_3">
			
			<div style="margin: 30px"> 
		<div class="col_4">
		    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
			   <ul id="myTab" class="nav nav-tabs nav-tabs1" role="tablist">
				  <li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">活动详情</a></li>
			   </ul>
			   <div id="myTabContent" class="tab-content">
				  <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
				    <div class="basic_1">
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened">
								<td class="day_label">邀请人 :</td>
								<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${invite.fromId}">${invite.customerFrom.nickName}</a></td>
							</tr>
							<tr class="opened">
								<td class="day_label">受邀人 :</td>
								<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${invite.joinId}">${invite.customerJoin.nickName}</a></td>
							</tr>
							<tr class="opened">
								<td class="day_label">邀约状态 :</td>
								<td class="day_value" >
									<c:if test="${customer.id eq invite.customerJoin.id }">
									 	<c:if test="${ empty invite.detail.signJoin}">
											<c:choose>
											 	 <c:when test="${invite.inviteStates eq '1'}">
											 	 	 <a href="##" onclick="addInvite('${invite.id}','1')">时间地点信息</a>
									      			 <a href="##" onclick="updateStates('${invite.id}','3')">拒绝约请</a>
											 	 </c:when>
											 	 <c:when test="${invite.inviteStates eq '2'}">
											 	 	  已接受
											 	 </c:when>
											 	 <c:when test="${invite.inviteStates eq '3'}">
											 	 	  已拒绝  原因：<span class="dicValue" name="remark" value="${invite.remark }"></span>
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
											 	 	   申请取消约会 系统审核中
											 	 	  <a href="##" onclick="updateStates('${invite.id}','4')">撤回申请</a>
											 	 </c:when>
											 </c:choose>
									 	</c:if>
									 	<c:if test="${ not empty invite.detail.signJoin}">
									 		 已签到
										 	<c:if test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:if>
									 	</c:if>
									</c:if>
									<c:if test="${customer.id eq invite.customerFrom.id }">
										<c:if test="${ empty invite.detail.signFrom}">
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
												 </c:choose>
										</c:if>
										<c:if test="${ not empty invite.detail.signFrom}">
										 		 已签到
											 <c:if test="${invite.inviteStates eq '7'}">
										 	 	  约会已结束
										 	 	  <a class="btn btn-default" href="##" onclick="evaluateDate('${invite.id}')">评价约会对象</a>
										 	 </c:if>
									 	</c:if>
									</c:if>
								</td>
							</tr>
							    <tr class="opened">
									<td class="day_label">约会时间 :</td>
									<td class="day_value">
										<c:if test="${ not empty invite.detail.confirmDate}">
											${invite.detail.confirmDate }
										</c:if>
										<c:if test="${  empty invite.detail.confirmDate}">
											待定
										</c:if>
									</td>
								</tr>
								 <tr class="opened">
									<td class="day_label">活动地点 :</td>
									<td class="day_value">${invite.pointLocation.location} - ${invite.pointLocation.locName}</td>
								</tr>
								<tr class="opened">
									<td class="day_label"> 详细地址  :</td>
									<td class="day_value">  ${invite.pointLocation.address }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">约会地点联系电话:</td>
									<td class="day_value " >${invite.pointLocation.telephone }</td>
								</tr>
								<tr class="opened">
									<td class="day_label">对我的评价:</td>
									<td class="day_value " >
									 <a  class="btn btn-primary" style="border: none;color:white;" onclick="detailView()" >详情</a></td>
								</tr>
								<tr class="opened">
									<td class="day_label" colspan="2">
									<c:if test="${invite.inviteStates eq '4' && invite.fromId eq customer.id &&  empty invite.detail.signFrom }">
										<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick="signUp()">约会签到</button>
									</c:if>
									<c:if test="${invite.inviteStates eq '4' && invite.joinId eq customer.id &&  empty invite.detail.signJoin }">
										<button type="button" class="btn btn-primary btn-lg  col-xs-6" style="border: none;" onclick="signUp()">约会签到</button>
									</c:if>
									</td>
								</tr>
								
						    </tbody>
				          </table>
				          <table class="table_working">
				        	<tbody>
							    <tr class="opened_1">
									<td class="day_value">是否发生迟到 :</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label dicValue" style="color: black;" name="late" value="${ev.late}">${ev.late}</td>
								</tr>
								 <tr class="opened">
									<td class=" day_value">对方实际情况与系统描述相符情况 :</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label dicValue" style="color: black;" name="compare" value="${ev.compare}"> </td>
								</tr>
								<tr class="opened">
									<td class="day_value">互动中，对方反馈积极程度 :</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label dicValue" style="color: black;" name="talk" value="${ev.talk }">  </td>
								</tr>
								<tr class="opened">
									<td class="day_value">是否愿意再次与对方见面:</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label dicValue" style="color: black;" name="next" value="${ev.next}"></td>
								</tr>
								<tr class="opened">
									<td class="day_value">对我的评价:</td>
								</tr>
								<tr class="opened_1">
									<td class="day_label" style="color: black;">${ev.evaluateMsg}</td>
								</tr>
								<tr class="opened">
									<td class="day_value">对我的评分:</td>
								</tr>
								<tr class="opened_1">
									<td id="test2" style="color: black;"></td>
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
 <div class="modal fade" id="addModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: ">
				<div class="modal-content">
					<div class="modal-body">
					 </div>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	<script type="text/javascript">
	
	var dic = "";
	
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
	var val = '${ev.remark}';
    layui.use(['rate'], function(){
		  var rate = layui.rate;
		  rate.render({
		    elem: '#test2'
		        ,value: val
		        ,text: true //开启文本
			  ,setText: function(value){
				    var arrs = {
				      '1': '极差'
				      ,'2': '差'
				      ,'3': '中等'
				      ,'4': '好'
				      ,'5' : '非常好'
				    };
				    this.span.text(arrs[value] || ( value + "星"));
				  }
		        ,readonly: true
		    });
    });
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