<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>个人中心</title>
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
	 function signState(telephone , state){
			 var url = "${pageContext.request.contextPath}/user/signState?telephone=" + telephone + "&state=" + state;
			 $.ajax({
					url : url,
					type : 'post',
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							alert(data.msg);
							window.location.href="${pageContext.request.contextPath}/web/myinfo";
						} else {
							alert(data.msg);
						}
					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				});
	 }
	 
	 function examineSuccess(table,column  , state , id ){
		 var url = "${pageContext.request.contextPath}/web/examineSuccess?table=" + table +"&column="+column + "&state=" + state + "&id=" +id;
		 $.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						window.location.href="${pageContext.request.contextPath}/web/myinfo";
					} else {
						alert(data.msg);
					}
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
 }
	 
	 function examineFail(table , column ,state , id ){
		 var remark = prompt("请输入不通过的原因","")
		 var url = "${pageContext.request.contextPath}/web/examineFail?table=" + table +"&column="+column +"&remark="+remark + "&state=" + state + "&id=" +id;
		 $.ajax({
				url : url,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						window.location.href="${pageContext.request.contextPath}/web/myinfo";
					} else {
						alert(data.msg);
					}
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
 	}
	 
	 function updateFocus(state ){
		  var id = "${cust.id}"
		  window.location.href="${pageContext.request.contextPath}/customer/insertFocus?toId=" + id;
		  
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
		if(${webUser.role} !='1' && ${webUser.role} !='11'){
			 $("#examine").hide();
		}
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
							<c:if test="${customer.sex} eq '1'">
								<img src="${pageContext.request.contextPath}/images/men.jpg"
									alt="" class="hover-animation image-zoom-in img-responsive" />
								<li
									data-thumb="${pageContext.request.contextPath}/images/men.jpg">
									<img src="${pageContext.request.contextPath}/images/men.jpg" />
								</li>
							</c:if>
							<c:if test="${customer.sex} eq '0'">
								<li
									data-thumb="${pageContext.request.contextPath}/images/women.jpg">
									<img src="${pageContext.request.contextPath}/images/women.jpg" />
								</li>
							</c:if>
						</ul>
				  </div>
			</div>
			<c:if test="${ webUser.role == '1' }">
				<button type="button" class="btn  btn-success" onclick="signState('${customer.telephone}','1')">管理员签到</button>
			</c:if>
			<c:if test="${ webUser.role == '11' }">
				<button type="button" class="btn  btn-success" onclick="signState('${customer.telephone}','0')"><i class="im-heart"></i> 管理员签退</button>
			
			<div style="margin: 30px" id="examine" class="showView"> 
			<div class="row mb10 ">
				  会员信息待审核 <a href="#">&nbsp;更多</a>
				 <div class="col-md-6 basic_1-left" >
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<c:forEach items="${myCustExamine}" var = "mycust" end="20">
					        		<tr class="opened_1">
										<td class="day_label">姓名 :</td>
										<td class="day_value">${mycust.chName }</td>
										</tr>
									<tr class="opened_1">
										<td class="day_label">昵称 :</td>
										<td class="day_value">${mycust.nickName }</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label">联系电话 :</td>
										<td class="day_value">${mycust.telephone }</td>
										</tr>
									<tr class="opened_1">
										<td class="day_value" ><a href="${pageContext.request.contextPath}/web/customer?id=${mycust.id}">详情</a></td>
										<td class="day_value"><button type="button" class="btn btn-default " onclick="examineSuccess('customer','examine','1','${mycust.id}')"> 通过</button>
										<button type="button" class="btn btn-default " onclick="examineFail('customer','examine','2','${mycust.id}')"> 不通过</button></td>
									</tr>
				        		</c:forEach>
						    </tbody>
				          </table>
				         </div>
			</div>
			<div class="clearfix"> </div>
			<div class="row mb10">
				  约会取消申请待审核 <a href="#">&nbsp;更多</a>
				  <div class="col-md-6 basic_1-left" >
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<c:forEach items="${cancelDating}" var = "mydating" end="1">
					        		<tr class="opened_1">
										<td class="day_label">邀约人:</td>
										<td class="day_value">
											<a href="${pageContext.request.contextPath}/web/customer?id=${mydating.customerFrom.id}">
												${mydating.customerFrom.chName }
											</a>
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_label">受邀人 :</td>
										<td class="day_value">
										<a href="${pageContext.request.contextPath}/web/customer?id=${mydating.customerJoin.id}">
												${mydating.customerJoin.chName}
											</a></td>
									</tr>
									<tr class="opened_1">
										<td class="day_label">约会地点 :</td>
										<td class="day_value">
												${mydating.pointLocation.locName }
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_value" ><a href="${pageContext.request.contextPath}/web/detail?id=${mydating.id}">详情</a></td>
										<td class="day_value"><button type="button" class="btn btn-default " onclick="examineSuccess('invite','invite_states','9','${mydating.id}')"> 通过</button>
										<button type="button" class="btn btn-default " onclick="examineFail('invite','invite_states','4','${mydating.id}')"> 不通过</button></td>
									</tr>
				        		</c:forEach>
						    </tbody>
				          </table>
				         </div>
			</div>
			<div class="clearfix"> </div>
			<div class="row">
				  文章待审核 <a href="#">&nbsp;更多</a>
				  <div class="col-md-6 basic_1-left" >
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<c:forEach items="${myArticleExamine}" var = "myarticle" end="1">
					        		<tr class="opened_1">
										<td class="day_label">文章名称:</td>
										<td class="day_value">
												${myarticle.title }
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_label">文章简介 :</td>
										<td class="day_value">
												${myarticle.discrib}
										</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label">作者 :</td>
										<td class="day_value">
												${myarticle.author }
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_value" ><a href="${pageContext.request.contextPath}/article/detail?id=${myarticle.id}">详情</a></td>
										<td class="day_value"><button type="button" class="btn btn-default " onclick="examineSuccess('article','article_state','2','${myarticle.id}')"> 通过</button>
										<button type="button" class="btn btn-default " onclick="examineFail('article','article_state','0','${myarticle.id}')"> 不通过</button></td>
									</tr>
				        		</c:forEach>
						    </tbody>
				          </table>
				         </div>
			</div>
			<div class="clearfix"> </div>
			<div class="row">
				  活动待审核 <a href="#">&nbsp;更多</a>
				  <div class="col-md-6 basic_1-left" >
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<c:forEach items="${myActExamine}" var = "myact" end="1">
					        		<tr class="opened_1">
										<td class="day_label">活动名称:</td>
										<td class="day_value">
												${myact.actName }
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_label">活动时间 :</td>
										<td class="day_value">
												${myact.actDate}
										</td>
									</tr>
									<tr class="opened_1">
										<td class="day_label">活动地点 :</td>
										<td class="day_value">
												${myact.actAddress }
										</td>
										</tr>
									<tr class="opened_1">
										<td class="day_value" ><a href="${pageContext.request.contextPath}/act/detail?id=${myact.id}">详情</a></td>
										<td class="day_value"><button type="button" class="btn btn-default " onclick="examineSuccess('act','act_state','2','${myact.id}')"> 通过</button>
										<button type="button" class="btn btn-default " onclick="examineFail('act','act_state','1','${myact.id}')"> 不通过</button></td>
									</tr>
				        		</c:forEach>
						    </tbody>
				          </table>
				         </div>
			</div>
			<div class="clearfix"> </div>
			</c:if>
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