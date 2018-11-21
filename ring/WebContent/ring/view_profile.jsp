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
	 
	 
</script>
</head>
<body>
<div class="grid_3">
  <div class="container">
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