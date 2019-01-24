<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典管理</title>
<style type="text/css">
  .panel-body {
    padding: 0px !important; 
}
</style>	

</head>
<body id="a2">
	<div >
			<div >
				  <div class="panel-body" id="a3" style="display:block">
					  	<div>
						<div id="toolbar" class="btn-group  pull-left">
	
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
						<div class="pull-right" id="query-form"
							style="padding-bottom: 10px;">
							<input name="col" id="col"
								placeholder='数据库名' type="text"
								style="float: left; width: 150px; margin-right: 5px;"
								v-model="lookupType" class="form-control">
								<input name="name" id="name"
								placeholder='表头名' type="text"
								style="float: left; width: 150px; margin-right: 5px;"
								v-model="lookupType" class="form-control">
						   	<div style="float: left; margin-right: 5px;">
							</div>
	
							<div class="btn-group">
								<button id="btn_search" onclick="customSearch()" type="button"
									class="btn btn-primary btn-space">
									<span class="fa fa-search" aria-hidden="true"
										class="btn-icon-space"></span> 查询
								</button>
							</div>
						</div>

				</div>
 					<table id="infoTable"> </table>
				  </div>
			</div>
		</div>
		
	<div class="modal fade" id="myModal" tabindex="-2" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="height: ">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">账户管理</h4>
				</div>
				<div class="modal-body">
					<form id="dataForm">
					 <input  class="form-control" name="id" type="hidden"></input>
					  <input  class="form-control" name="role" type="hidden" value = "1"></input>
						<div class="form-group">
							<label for="recipient-name" class="control-label">数据库名:</label> <input
								type="text" class="form-control" name="col" id="col"  placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">表头名:</label> 
								<input type="text" class="form-control" name="name" id="name" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">实际值:</label> 
								<input type="text" class="form-control" name="code" id="code">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">显示值:</label> 
								<input type="text" class="form-control" name="describ" id="describ">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">字典类型:</label>
							<select class="form-control"  id ="flag" name="flag" >  
					           <option value="0">标签</option>
					           <option value="1">多选类型</option>
					           <option value="2">单选类型</option>
					           <option value="3">标准：男</option>
					           <option value="4">标准：女</option>
					        </select>	
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
		function subInfo(){
			subInfoAll("dic"); 
		}
			
		function delDish(){
			deleteDataAll("dic");
		}
		
		function customSearch(){
			var options = $('#infoTable').bootstrapTable('refresh', {
	            query: 
	            {
	                col:$("#col").val(),
	                name:$("#name").val()
	                
	            }
	        });
		}
		
		$(function(){
			    $('#infoTable').bootstrapTable({  
			        url : '${basePath}/dic/query', // 请求后台的URL（*）            
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
			        showRefresh : false, // 是否显示刷新按钮  
			        clickToSelect : true, // 是否启用点击选中行  
			        showToggle : false, // 是否显示详细视图和列表视图的切换按钮  
			        search: false,   //是否启用搜索框 
			        
			        columns : [ {  
			            checkbox : true 
			        },{  
			            field : 'id', visible: false 
			        },{  
			            field : 'col',   title : '数据库名',   align: 'center', valign: 'middle'  
			        },{  
			            field : 'name',   title : '表头名',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'code',   title : '实际值',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'describ',   title : '显示值',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'flag',   title : '是否有效',  align: 'center',   valign: 'middle'  ,
						formatter : function(value, row, index) {
							if (value == '1') {
								return "有效";
							} else if (value == '0') {
								return "无效";
							}
			        }}],  
			        silent : true, // 刷新事件必须设置  
			    });  
		});
		
		
	</script>
	
		
</html>