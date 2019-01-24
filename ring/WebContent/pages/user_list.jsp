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
	<div >
			<div >
				  <div class="panel-body" id="a3" style="display:block">
				  	    <table id="infoTable"> </table>
					<div id="toolbar" class="btn-group">  
			            <button id="btn_edit" type="button" class="btn btn-default" onclick="updateData()">  
			                <span class="glyphicon glyphicon-pencil" aria-hidden="true" ></span>修改  
			            </button>  
			            <button id="btn_delete" type="button" class="btn btn-default" onclick="delDish()">  
			                <span class="glyphicon glyphicon-remove" aria-hidden="true" ></span>删除  
			            </button>  
			            <button id="btn_delete" type="button" class="btn btn-default" onclick="addInfo()">  
			            	<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
			            </button>
			            <button id="btn_delete" type="button" class="btn btn-default" onclick="resetPwd()">  
			            	<span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>重置密码
			            </button>
			        </div>  
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
							<label for="recipient-name" class="control-label">登录名:</label> <input
								type="text" class="form-control" name="userNo" id="userNo" onchange="checkUnique( 'user','userNo',this.value)" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">管理员名称:</label> 
								<input type="text" class="form-control" name="userName" id="userName" placeholder="必填" required>
						</div>
						<!-- <div class="form-group">
							<label for="message-text" class="control-label">管理员类型:</label>
							<select class="form-control"  id ="role" name="role" >  
					           <option value="1" selected="selected">超级管理员</option>
					           <option value="2">普通管理</option>
					           <option value="3">其他</option>  
					        </select>	
						</div> -->
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> 
								<input type="text" class="form-control" name="remark" id="remark">
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
			subInfoAll("user");
		}
			
		function delDish(){
			deleteDataAll("user");
		}
		
		function resetPwd(){
			var selectObj = $("#infoTable").bootstrapTable('getSelections')[0];
			var id = selectObj.id; 
			console.info(selectObj)
			if (id > 0) {
				var path = "${basePath}/user/reset";
				$.ajax({
					url : path,
					type : 'post',
					data: selectObj ,
					dataType : 'json',
					success : function(data) {
						if (data.success) {
							alert( data.msg);
							$("#infoTable").bootstrapTable("refresh");
						} else {
							alert( data.msg);
						}
		
					},
					error : function(transport) {
						alert( "系统产生错误,请联系管理员!");
					}
				});
			} 
		}
		
		$(function(){
			    $('#infoTable').bootstrapTable({  
			        url : '${basePath}/user/query', // 请求后台的URL（*）            
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
			        }, {
                        field: 'Number',title: '序号', align: 'center', width:'20px',
                        formatter: function (value, row, index) {
                            return index+1;
                        }
 					},{  
			            field : 'userName',   title : '管理员',   align: 'center', valign: 'middle'  
			        },{  
			            field : 'userNo',   title : '登录账号',  align: 'center',   valign: 'middle'  
			        },{  
			            field : 'role',   title : '管理员类型',  align: 'center',   valign: 'middle'  ,
						formatter : function(value, row, index) {
							if (value == '1') {
								return "超级管理员";
							} else if (value == '2') {
								return "普通会员";
							} else if(value =='3' ){
								return  "其他";
							} else if(value = '11'){
								return "值班管理员";
							}
			        }},{  
			            field : 'remark',   title : '备注',  align: 'center',   valign: 'middle'  
			        }],  
			        silent : true, // 刷新事件必须设置  
			    });  
		});
		
		
	</script>
	
		
</html>