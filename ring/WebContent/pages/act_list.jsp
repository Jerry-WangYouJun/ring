<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>活动查看</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>

</head>
<body id="a2">
	<div>
		<div>
			<div class="panel-body" id="a3" style="display: block">
				<table id="infoTable">
				</table>
				<div id="toolbar" class="btn-group">
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick="detailInfo()">
						参与人员详情
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick="examine()">
						审核通过
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick="examineNot()">
						审核不通过
					</button>
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

</body>
<script type="text/javascript">
function examineNot(){
	var selectRow =  $("#infoTable").bootstrapTable('getSelections')[0];
	if($("#infoTable").bootstrapTable('getSelections').length  == 0){
		 alert("请选择一条记录！");
		 return false;
	}
	var remark =  "";
	layer.prompt({title: '输入拒绝的原因，并确认', formType: 2}, function(text, index){
		  remark = text;
		  layer.close(index);
			var path = "${pageContext.request.contextPath}/act/examine";
			$.ajax({
				url : path,
				type : 'post',
				data : {id:selectRow.id , actState: '4' ,remark:remark},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						$("#infoTable").bootstrapTable("refresh");
					} else {
						alert(data.msg);
					}
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
			});
		});
}


  function examine(){
	  var selectRow =  $("#infoTable").bootstrapTable('getSelections')[0];
		if($("#infoTable").bootstrapTable('getSelections').length  == 0){
			 alert("请选择一条记录！");
			 return false;
		}
		var path = "${pageContext.request.contextPath}/act/examine";
		$.ajax({
			url : path,
			type : 'post',
			data : {id:selectRow.id , actState: '1', remark: ''},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#infoTable").bootstrapTable("refresh");
				} else {
					alert(data.msg);
				}
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
  }
function detailInfo() {
	var selectRow =  $("#infoTable").bootstrapTable('getSelections')[0];
	if($("#infoTable").bootstrapTable('getSelections').length  == 0){
		 alert("请选择一条记录！");
		 return false;
	}
	
	$('#detailTable').bootstrapTable(
			'refresh',{query: {toId: selectRow.id}});
	$("#detailModal").modal("show");
}

	$(function() {
		$('#infoTable').bootstrapTable({
			url : '${basePath}/act/query', // 请求后台的URL（*）            
			method : 'get', // 请求方式（*）  
			toolbar : '#toolbar', // 工具按钮用哪个容器  
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）  
			pagination : true, // 是否显示分页（*）  
			pageNumber : 1, //如果设置了分页，首页页码  
			pageSize : 10, //每页的记录行数（*）  
			pageList : [ 10, 30, 50 ], //可供选择的每页的行数（*）  
			queryParamsType : '',
			singleSelect : true,
			showRefresh : true, // 是否显示刷新按钮  
			clickToSelect : true, // 是否启用点击选中行  
			showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
			search : true, //是否启用搜索框 

			columns : [ {
				checkbox : true
			}, {
				field : 'id',
				visible : false
			}, {
				field : 'custName',
				title : '创建人',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return row.customer.chName;
				}
			}, {
				field : 'actName',
				title : '活动名称',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'actDate',
				title : '活动时间',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'actLoca',
				title : '活动地点',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'actAddress',
				title : '详细地址',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'admin',
				title : '主办方',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'money',
				title : '费用',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'actForm',
				title : '互动形式',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'actState',
				title : '活动状态',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'remark',
				title : '备注',
				align : 'center',
				valign : 'middle'
			} ],
			silent : true, // 刷新事件必须设置  
		});
		
		
		 $('#detailTable').bootstrapTable({  
		        url : '${basePath}/invite/queryEvaluate', // 请求后台的URL（*）            
		        method : 'get', // 请求方式（*）  
		        cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）  
		        sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）  
		        pagination : true, // 是否显示分页（*）  
		        pageNumber: 1,    //如果设置了分页，首页页码  
		        pageSize: 10,                       //每页的记录行数（*）  
		        pageList: [10,30,50],        //可供选择的每页的行数（*）  
		        queryParamsType:'',
		        singleSelect    : true,   
		        clickToSelect : true, // 是否启用点击选中行  
		        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
		        
		        columns : [ {  
		            checkbox : true 
		        },{  
		            field : 'id', visible: false 
		        },{  
		            field : 'customerFrom.chName',   title : '评价人',  align: 'center',   valign: 'middle'  
		        },{  
		            field : 'evaluateMsg',   title : '评价',  align: 'center',   valign: 'middle'  
		        }
		        ],
		        silent : true, // 刷新事件必须设置  
		    }); 
	});
	
</script>


</html>