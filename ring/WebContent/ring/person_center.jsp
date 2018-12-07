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
			<button type="button" class="btn btn-default " onclick="detailInfo()"> 我的约会 </button>
			<button type="button" class="btn btn-default " onclick="addInvite(${cust.id})">  我的邀约</button>
			<button type="button" class="btn btn-default " onclick="detailInfo()"> 我的活动 </button>
			<button type="button" class="btn btn-default " onclick="addInvite(${cust.id})">  我的文章</button>
			<button type="button" class="btn btn-default " onclick="updateFocus('0')"><i class="im-heart2"></i>  我的关注</button>
			<button type="button" class="btn btn-default " onclick="updateFocus('0')"><i class="im-heart2"></i>  修改信息</button>
			<button type="button" class="btn btn-default " onclick="updateFocus('0')"><i class="im-heart2"></i>  修改头像</button>
			<c:if test="${ webUser.role == '1' }">
				<button type="button" class="btn  btn-success" onclick="deleteFocus(${focusId})"><i class="im-heart"></i> 管理员签到</button>
				<button type="button" class="btn  btn-success" onclick="deleteFocus(${focusId})"><i class="im-heart"></i> 审核信息</button>
			</c:if>
			<c:if test="${ webUser.role == '11' }">
				<button type="button" class="btn  btn-success" onclick="deleteFocus(${focusId})"><i class="im-heart"></i> 管理员签退</button>
				<button type="button" class="btn  btn-success" onclick="deleteFocus(${focusId})"><i class="im-heart"></i> 审核信息</button>
			</c:if>
			<div style="margin: 30px"> 
			<div class="col-sm-8 row_1">
				<table class="table_working_hours">
		        	<tbody>
				    </tbody>
				</table>
				
			</div>
			<div class="clearfix"> </div>
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