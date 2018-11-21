<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>View_profile</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 

<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/ring/css/style.css" rel='stylesheet' type='text/css' />
<!----font-Awesome----->
<link href="${pageContext.request.contextPath}/ring/css/font-awesome.css" rel="stylesheet"> 
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
	 
	 
</script>
</head>
<body>
<!-- ============================  Navigation Start =========================== -->
 <div class="navbar navbar-inverse-blue navbar">
    <!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
      <div class="navbar-inner navbar-inner_1">
        <div class="container">
           <div class="navigation">
             <nav id="colorNav">
			   <ul>
				<li class="green">
					<a href="#" class="icon-home"></a>
					<ul>
						<li><a href="login.html">登录</a></li>
					    <li><a href="register.html">注册</a></li>
					    <li><a href="index.html">登出</a></li>
					</ul>
				</li>
			   </ul>
             </nav>
           </div>
           <a class="brand" href="index.html"><img src="${pageContext.request.contextPath}/ring/images/logo.png" alt="logo"></a>
           <div class="pull-right">
          	<nav class="navbar nav_bottom" role="navigation">
 
		 <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header nav_2">
		      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#"></a>
		   </div> 
		   <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
		        <ul class="nav navbar-nav nav_1">
		            <li><a href="index.html">主页</a></li>
		            <li><a href="about.html">关于我们</a></li>
		    		<li class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown">约会信息<span class="caret"></span></a>
		              <ul class="dropdown-menu" role="menu">
		                <li><a href="###" onclick="inviteInfo()">约会邀请</a></li>
		                <li><a href="###" onclick="setPoint()">约会记录</a></li>
		                <li><a href="viewed-not_contacted.html">浏览过的</a></li>
		                <li><a href="members.html">推荐会员</a></li>
		              </ul>
		            </li>
		            <li class="dropdown">
		              <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的消息<span class="caret"></span></a>
		              <ul class="dropdown-menu" role="menu">
		                <li><a href="inbox.html">新消息</a></li>
		                <li><a href="inbox.html">已查看</a></li>
		                <li><a href="inbox.html">已接受</a></li>
		                <li><a href="sent.html">已发送</a></li>
		                <li><a href="upgrade.html">会员续费</a></li>
		              </ul>
		            </li>
		            <li class="last"><a href="contact.html">联系方式</a></li>
		        </ul>
		     </div><!-- /.navbar-collapse -->
		    </nav>
		   </div> <!-- end pull-right -->
          <div class="clearfix"> </div>
        </div> <!-- end container -->
      </div> <!-- end navbar-inner -->
    </div> <!-- end navbar-inverse-blue -->
<!-- ============================  Navigation End ============================ -->
<div class="grid_3">
  <div class="container">
   <div class="breadcrumb1">
     <ul>
        <a href="index.html"><i class="fa fa-home home_1"></i></a>
        <span class="divider">&nbsp;|&nbsp;</span>
        <li class="current-page">View Profile</li>
     </ul>
   </div>
   <div class="profile">
   	 <div class="col-md-12 profile_left">
   	 	<h2>Profile Id : ${cust.id }</h2>
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
			<div style="margin: 30px"> <a href="##" onclick="detailInfo()">留言</a>
			 <a href="###" onclick="addInvite(${cust.id})">邀约</a> 
			 <a href="">点赞</a> </div>
			<div class="col-sm-8 row_1">
				<table class="table_working_hours">
		        	<tbody>
		        		<tr class="opened_1">
							<td class="day_label">年龄 / 身高 :</td>
							<td class="day_value">28, ${cust.height }cm</td>
						</tr>
					    <tr class="opened">
							<td class="day_label">上次登录 :</td>
							<td class="day_value">4 小时</td>
						</tr>
					    <tr class="opened">
							<td class="day_label">宗教信仰 :</td>
							<td class="day_value">无</td>
						</tr>
					    <tr class="opened">
							<td class="day_label">婚姻状况:</td>
							<td class="day_value">${cust.marriage }</td>
						</tr>
					    <tr class="opened">
							<td class="day_label">所在地 :</td>
							<td class="day_value">${cust.addtress}</td>
						</tr>
					    <tr class="closed">
							<td class="day_label">职业 :</td>
							<td class="day_value closed"><span>${cust.industry }</span></td>
						</tr>
					    <tr class="closed">
							<td class="day_label">学历 :</td>
							<td class="day_value closed"><span>${cust.degree }</span></td>
						</tr>
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
							    <tr class="opened">
									<td class="day_label">家乡 :</td>
									<td class="day_value">${cust.hometown }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">身高/体重 :</td>
									<td class="day_value">${cust.height }kg, ${cust.weight }cm</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">婚姻状态 :</td>
									<td class="day_value closed"><span>${cust.marriage }</span></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">爱情宣言:</td>
									<td class="day_value closed"><span>${cust.declaration }</span></td>
								</tr>
						    </tbody>
				          </table>
				         </div>
				         <div class="col-md-6 basic_1-left">
				          <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened_1">
									<td class="day_label">年龄 :</td>
									<td class="day_value">28 Yrs</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">祖籍 :</td>
									<td class="day_value">${cust.hometown }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">子女 :</td>
									<td class="day_value">${cust.children }/人</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">学历 :</td>
									<td class="day_value">${cust.degree }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">住房状态 :</td>
									<td class="day_value">${cust.houseStatus }</td>
								</tr>
							    <tr class="closed">
									<td class="day_label">烟/酒 :</td>
									<td class="day_value closed"><span>${cust.marriage }No</span></td>
								</tr>
						    </tbody>
				        </table>
				        </div>
				        <div class="clearfix"> </div>
				    </div>
				    <div class="basic_1">
				    	<h3>学历 & 工作</h3>
				    	<div class="basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        			<tr class="opened">
									<td class="day_label">学历   :</td>
									<td class="day_value">${cust.degree }</td>
								</tr>
				        			<tr class="opened">
									<td class="day_label">工作内容 :</td>
									<td class="day_value">${cust.industry }</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">月收入 :</td>
									<td class="day_value closed"><span>income</span></td>
								</tr>
							 </tbody>
				          </table>
				         </div>
				         <div class="clearfix"> </div>
				    </div>
				  </div>
				  <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
				    <div class="basic_3">
				    	<h4>Family Details</h4>
				    	<div class="basic_1 basic_2">
				    	<h3>Basics</h3>
				    	<div class="col-md-6 basic_1-left">
				    	  <table class="table_working_hours">
				        	<tbody>
				        		<tr class="opened">
									<td class="day_label">身高/体重 :</td>
									<td class="day_value">Not Specified</td>
								</tr>
				        		<tr class="opened">
									<td class="day_label">宗教信仰 :</td>
									<td class="day_value">Not Specified</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">教育程度 :</td>
									<td class="day_value closed"><span>Not Specified</span></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">车/房 :</td>
									<td class="day_value closed"><span>Not Specified</span></td>
								</tr>
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
									<td class="day_label">婚姻状况 :</td>
									<td class="day_value">Single</td>
								</tr>
				        		<tr class="opened">
									<td class="day_label">年龄   :</td>
									<td class="day_value">28 to 35</td>
								</tr>
							    <tr class="opened">
									<td class="day_label">身高/体重 :</td>
									<td class="day_value closed"><span>Doesn't matter</span></td>
								</tr>
							    <tr class="opened">
									<td class="day_label">宗教信仰 :</td>
									<td class="day_value closed"><span>Doesn't matter</span></td>
								</tr>
								<tr class="opened">
									<td class="day_label">教育程度 :</td>
									<td class="day_value closed"><span>Doesn't matter</span></td>
								</tr>
								<tr class="opened">
									<td class="day_label">车/房 :</td>
									<td class="day_value closed"><span>Doesn't matter</span></td>
								</tr>
								<tr class="opened">
									<td class="day_label">烟 / 酒 :</td>
									<td class="day_value closed"><span>No</span></td>
								</tr>
								<tr class="opened">
									<td class="day_label">月收入 :</td>
									<td class="day_value closed"><span>Doesn't matter</span></td>
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
   	 <ul class="login_details">
			      <li>已经是会员? <a href="login.html">登录</a></li>
			      <li>还不是会员? <a href="register.html">注册</a></li>
			    </ul>
       <div class="clearfix"> </div>
    </div>
  </div>
</div>
<div class="map">

</div>
<div class="footer">
    	<div class="container">
    		<div class="col-md-4 col_2">
    			<h4>关于我们</h4>
    			<p>"无名指之约。。。"</p>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>帮助 & 支持</h4>
    			<ul class="footer_links">
    				<li><a href="contact.html">联系我们</a></li>
    				<li><a href="faq.html">常见问题</a></li>
    			</ul>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>合作单位</h4>
    			<ul class="footer_links">
    				<li><a href="privacy.html">Privacy Policy</a></li>
    				<li><a href="terms.html">Terms and Conditions</a></li>
    				<li><a href="services.html">Services</a></li>
    			</ul>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>分享</h4>
    			<ul class="footer_social">
				  <li><a href="#"><i class="fa fa-facebook fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-twitter fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-google-plus fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-youtube fa1"> </i></a></li>
			    </ul>
    		</div>
    		<div class="clearfix"> </div>
    		<div class="copy">
		      <p>Copyright &copy; 2018.Company name All rights reserved.</p>
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
			<!-- /.modal-content -->
		</div>
    	<div class="modal fade" id="detailModal"  role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="height: ">
				<div class="modal-content">
					<div class="modal-body">
						 <table id="detailTable"> </table>
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
	function inviteInfo(){
		$('#inviteTable').bootstrapTable(
				'refresh',{query: {joinId: ${webUser.remark }}});
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
		  $('#detailTable').bootstrapTable({  
		        url : '${pageContext.request.contextPath}/message/query', // 请求后台的URL（*）            
		        method : 'get', // 请求方式（*）  
		        toolbar : '#toolbar', // 工具按钮用哪个容器  
		        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
		        sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）  
		        pagination : false, // 是否显示分页（*）  
		        pageNumber: 1,    //如果设置了分页，首页页码  
		        pageSize: 10,                       //每页的记录行数（*）  
		        pageList: [10,30,50],        //可供选择的每页的行数（*）  
		        queryParamsType:'',
		        singleSelect    : true,   
		        showRefresh : false, // 是否显示刷新按钮  
		        clickToSelect : true, // 是否启用点击选中行  
		        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
		        search:  false,   //是否启用搜索框 
		        
		        columns : [ {  
		            checkbox : true 
		        },{  
		            field : 'id', visible: false 
		        },{  
		            field : 'customerJoin.chName',   title : '留言对象',  align: 'center',   valign: 'middle'  
		        },{  
		            field : 'msg',   title : '留言内容',  align: 'center', align: 'center',    valign: 'middle'  
		        },{  
		            field : 'msgDate',   title : '留言时间',  align: 'center',   valign: 'middle',
		            	//获取日期列的值进行转换
		                formatter: function (value, row, index) {
		                    return changeDateFormat(value)
		                }
		        }
		        ],
		        silent : true, // 刷新事件必须设置  
		    });
		  
		  $('#inviteTable').bootstrapTable({  
		        url : '${pageContext.request.contextPath}/invite/queryByCustId?joinId=${webUser.remark}&inviteStates=1', // 请求后台的URL（*）            
		        method : 'get', // 请求方式（*）  
		        toolbar : '#toolbar', // 工具按钮用哪个容器  
		        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
		        sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）  
		        pagination : true, // 是否显示分页（*）  
		        pageNumber: 1,    //如果设置了分页，首页页码  
		        pageSize: 10,                       //每页的记录行数（*）  
		        pageList: [10,30,50],        //可供选择的每页的行数（*）  
		        queryParamsType:'',
		        singleSelect    : true,   
		        showRefresh : true, // 是否显示刷新按钮  
		        clickToSelect : true, // 是否启用点击选中行  
		        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
		        search:true,   //是否启用搜索框 
		        
		        columns : [ {  
		            checkbox : true 
		        },{  
		            field : 'id', visible: false 
		        },{  
		            field : 'customerFrom.chName',   title : '邀请人',  align: 'center',   valign: 'middle'  
		        },{  
		            field : 'customerJoin.chName',   title : '受邀人',  align: 'center',   valign: 'middle'  
		        },{  
		            field : 'inviteDate',   title : '约会时间',  align: 'center',   valign: 'middle',
		            	//获取日期列的值进行转换
		                formatter: function (value, row, index) {
		                    return changeDateFormat(value)
		                }
		        },{  
		            field : 'pointLocation.locName',   title : '约会地点',  align: 'center',   valign: 'middle'
		        },{  
		            field : 'inviteStates',   title : '约会状态',  align: 'center',   valign: 'middle'  ,
		            formatter : function(value, row, index, field) {
						return getDicDescirb(value, field);
					}
		        }
		       /*  ,{
                   title:"操作",align: 'center', 
                   formatter:function(value,row,index){     //把需要创建的按钮封装在函数中
                       return "<button class='btn btn-default' id='details' href='point_detail_list.jsp' data-toggle='modal' data-target='#detailModal'>积分详情</button>"
                   }
		         } */
		        ],
		        silent : true, // 刷新事件必须设置  
		    });  
	    
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