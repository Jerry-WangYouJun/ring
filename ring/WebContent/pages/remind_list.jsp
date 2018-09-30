<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提醒消息设置</title>
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
					<h4 class="modal-title" id="myModalLabel">提醒消息设置</h4>
				</div>
				<div class="modal-body">
					<form id="dataForm">
						<input class="form-control" name="id" type="hidden"></input>
						<div class="form-group">
							<label for="message-text" class="control-label">提醒名称:</label> <input
								type="text" class="form-control" name="name" id="name" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">提醒时间:</label> 
								<input type="text" class="form-control" name="remindTime" id="remindTime" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">提醒内容:</label> <input
								type="text" class="form-control" name="remind" id="remind">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">提醒类型:</label> 
								<select  class="form-control dicSelect"  id="remindType" name="remindType" >
									 
								</select>
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
		subInfoAll("remind");
	}

	function delDish() {
		deleteDataAll("remind");
	}

	$(function() {
		$('#infoTable').bootstrapTable({
			url : '${basePath}/remind/query', // 请求后台的URL（*）            
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

			columns : [ {checkbox : true}, 
			            {field : 'id',visible : false}, 
			            {field : 'name',title : '提醒名',align : 'center',valign : 'middle'}, 
			            {field : 'remindTime',title : '提醒时间',align : 'center',valign : 'middle'}, 
			            {field : 'remindType',title : '提醒类型',align : 'center',valign : 'middle',
							formatter : function(value, row, index, field) {
								return getDicDescirb(value, field);
							}
			            },  
			            {field : 'remind',title : '提醒内容',align : 'center',valign : 'middle'}, 
						{field : 'remark',title : '备注',align : 'center',valign : 'middle'} 
					  ],
			silent : true, // 刷新事件必须设置  
		});
	});
	
	$(function(){
		  $(".dicSelect").each(function(){
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