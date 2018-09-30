<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帐户管理</title>
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
					<h4 class="modal-title" id="myModalLabel">会员管理</h4>
				</div>
				<div class="modal-body">
					<form id="dataForm">
						<div class="form-group">
							<label for="recipient-name" class="control-label">审核状态:</label> 
								<select  class="form-control dicSelect"  id="examine" name="examine" placeholder="必填" required>
									 
								</select>
						</div>
						<input class="form-control" name="id" type="hidden"></input>
						<div class="form-group">
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control" name="nickName" id="nickName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性别:</label> <select 
								class="form-control dicSelect" id="sex" name="sex" placeholder="必填" required>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">生日:</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control" readonly name="birthday"
									id="birthday" placeholder="必填" required/> <span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">家乡:</label> <input
								type="text" class="form-control" name="hometown" id="hometown">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">现住址:</label> <input
								type="text" class="form-control" name="addtress" id="addtress">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">身高:</label> <input
								type="text" class="form-control" name="height" id="height">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">体重:</label> <input
								type="text" class="form-control" name="weight" id="weight">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">婚姻状况:</label> 
								<select  class="form-control dicSelect"  id="marriage" name="marriage" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">子女:</label> <input
								type="text" class="form-control" name="children" id="children">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">学历:</label> 
								<select  class="form-control dicSelect"  id="degree" name="degree" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">住房状态:</label>
								<select  class="form-control dicSelect"  id="houseStatus" name="houseStatus" placeholder="必填" required>
									 
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">从事行业:</label> <input
								type="text" class="form-control" name="industry" id="industry">
								
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">月收入:</label> <input
								type="text" class="form-control" name="income" id="income">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">qq号:</label> <input
								type="text" class="form-control" name="qq" id="qq">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control" name="telephone" id="telephone">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">邮箱:</label> <input
								type="text" class="form-control" name="email" id="email">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">推荐人:</label> <input
								type="text" class="form-control" name="referee" id="referee">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">自我介绍:</label> <input
								type="text" class="form-control" name="introduction"
								id="introduction">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">爱情宣言:</label> <input
								type="text" class="form-control" name="declaration"
								id="declaration">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">择偶要求:</label> <input
								type="text" class="form-control" name="ask" id="ask">
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
		subInfoAll("customer");
	}

	function delDish() {
		deleteDataAll("customer");
	}

	$(function() {
		$('#infoTable').bootstrapTable({
			url : '${basePath}/customer/query', // 请求后台的URL（*）            
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
				field : 'chName',
				title : '会员名',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'nickName',
				title : '会员昵称',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'sex',
				title : '性别',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'birthday',
				title : '生日',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'hometown',
				title : '家乡',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'marriage',
				title : '婚姻状态',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'telephone',
				title : '联系电话',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'examine',
				title : '审核状态',
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