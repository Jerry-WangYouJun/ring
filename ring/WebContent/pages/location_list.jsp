<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>约会地点管理</title>
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
					<button id="btn_edit" type="button" class="btn btn-default"
						onclick="updateData()">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick="delDish()">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
					</button>
					<button id="btn_delete" type="button" class="btn btn-default"
						onclick="addInfo()">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
					</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal" tabindex="-2" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height:">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">地点管理</h4>
				</div>
				<div class="modal-body">
					<form id="dataForm">
						<input class="form-control" name="id" type="hidden"></input>
						<div class="form-group">
							<label for="message-text" class="control-label">店名:</label> <input
								type="text" class="form-control" name="locName" id="locName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">所在区:</label> 
								<select  class="form-control dicSelect"  id="location" name="location" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">地址:</label> <input
								type="text" class="form-control" name="address" id="address">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">联系人:</label> <input
								type="text" class="form-control" name="manager" id="manager">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control" name="telephone" id="telephone">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">工作日:</label> <input
								type="text" class="form-control" name="workDate" id="workDate">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">营业时间:</label> <input
								type="text" class="form-control" name="workDime" id="workDime">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> <input
								type="text" class="form-control" name="remark" id="remark">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="subInfo()">提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
<script type="text/javascript">
	function subInfo() {
		subInfoAll("location");
	}

	function delDish() {
		deleteDataAll("location");
	}

	$(function() {
		$('#infoTable').bootstrapTable({
			url : '${basePath}/location/query', // 请求后台的URL（*）            
			method : 'post', // 请求方式（*）  
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
				field : 'id',visible : false
			}, {
				field : 'locName',title : '店名',align : 'center',valign : 'middle'
			}, {
				field : 'location',title : '区域',align : 'center',valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'address',title : '地址',align : 'center',valign : 'middle'
			}, {
				field : 'manager',title : '联系人',align : 'center',valign : 'middle'
			}, {
				field : 'telephone',title : '联系电话',align : 'center',valign : 'middle'
			},  {
				field : 'workDate',title : '工作日',align : 'center',valign : 'middle'
			}, {
				field : 'workTime',title : '营业时间',align : 'center',valign : 'middle'
			}, {
				field : 'remark',title : '备注',align : 'center',valign : 'middle'
			} ],
			silent : true, // 刷新事件必须设置  
		});
	});
	
	$(function(){
		 
		 $(".dicSelect").each(function(){
			 console.info($(this))
			     var field = this.name ;
		    	 var htmlStr = "";
			     if (dic.hasOwnProperty(field)) {
			    	 console.info(dic.field)
					 for( var keyValue in dic[field] ){
						   htmlStr += "<option value="+keyValue+">"+dic[field][keyValue].describ+"</option>"
					 }
				  } 
			     $(this).append(htmlStr);
		 });
	});
</script>


</html>