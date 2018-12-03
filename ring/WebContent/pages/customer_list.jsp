<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员管理</title>
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
						onclick="updateState('1')">
						</span>审核通过
					</button>
					<button id="btn_edit" type="button" class="btn btn-default"
						onclick="updateState('2')">
						审核不通过
					</button>
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
					<form id="dataForm"  >
						<input class="form-control " name="openId" type="hidden"
							value="${openId}"></input> <input class="form-control " name="id"
							type="hidden"></input> <input class="form-control " name="flag"
							id="flag" type="hidden"></input>
						<div class="form-group">
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName"
								placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control required" name="nickName"
								id="nickName" placeholder="必填">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性别:</label> <select
								class="form-control dicSelect" id="sex" name="sex"
								placeholder="必填" required>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">生日:</label>
							<div class='input-group date' id='datetimepicker1'>
								<input type='text' class="form-control" readonly name="birthday"
									id="birthday" placeholder="必填" required /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">家乡:</label> <input
								type="text" class="form-control" name="hometown">
						</div>
						
						<div class="form-group">
							<label for="message-text" class="control-label">现居地:</label>
							<div class="col-lg-12">
								<div class="row">
									<select id="cmbProvince" name="hometown" class="form-control col-lg-4" ></select>
									<select id="cmbCity" name="hometown" class="form-control col-lg-4" ></select>
									<select id="cmbArea" name="hometown" class="form-control col-lg-4" ></select>
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">经常活动区域:</label> <select
								class="form-control dicSelect" name="addtress" placeholder="必填"
								required>

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">身高(cm):</label> <input
								type="text" class="form-control number" name="height">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">体重(kg):</label> <input
								type="text" class="form-control number" name="weight">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">婚姻状况:</label> <select
								class="form-control dicSelect" name="marriage" placeholder="必填"
								required>

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">子女:</label> <select
								class="form-control dicSelect" name="children">

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">学历:</label> <select
								class="form-control dicSelect" name="degree" placeholder="必填"
								required>

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">住房状态:</label> <select
								class="form-control dicSelect" name="houseStatus"
								placeholder="必填" required>

							</select>
						</div>
						<!-- <div class="form-group  col-xs-4">
							<label for="message-text" class="control-label">是否显示:</label> 
							<select 
									class="form-control "  name="flagTemp" id="houseStatus" >
									<option value="houseStatus:1" > 显示 </option>
									<option value="houseStatus:0"> 不显示 </option>
							</select>
						</div> -->
						<div class="form-group ">
							<label for="message-text" class="control-label">从事行业:</label> 
								<select
									class="form-control dicSelect" name="industry" placeholder="必填"
										required>
	
								</select>

						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">月收入:</label> <select
								class="form-control dicSelect" name="income" placeholder="必填"
								required>

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">qq号:</label> <input
								type="text" class="form-control" name="qq">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control" name="telephone">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">邮箱:</label> <input
								type="text" class="form-control email" name="email">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">推荐人:</label> <input
								type="text" class="form-control" name="referee">
						</div>
						<div class="form-group ">
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
							<label for="message-text" class="control-label">择偶要求:</label> 
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">接受的年龄范围:</label>
							<select
									class="form-control dicSelect" name="birthday2" placeholder="必填"
										required>
	
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">经济能力:</label> <input
								type="text" class="form-control" name="economic">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">外貌:</label> <input
								type="text" class="form-control number" name="looks">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">性格:</label> <input
								type="text" class="form-control number" name="disposition">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">期望对方将来的生活角色 :</label> <select
								class="form-control dicSelect" name="lifeRole"
								>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">期望未来对象的类型:</label> <select
								class="form-control dicSelect" name="lifeType" 
								>
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">不可接受的类型:</label> <select
								class="form-control dicSelect" name="nonType"
								placeholder="必填" >
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">其他:</label> <select
								class="form-control dicSelect" name="other" 
								>
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> <input
								type="text" class="form-control" name="remark" id="remark">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
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
	addressInit('cmbProvince', 'cmbCity', 'cmbArea');
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
			} ,{
				field : 'flag',
				visible:false 
			}],
			silent : true, // 刷新事件必须设置  
		});
	});
	
	function addInfo() {
		$(':input', '#dataForm').not(':button,:submit,:reset').val(
		'').removeAttr('checked').removeAttr('checked');
		 $("select:not(.dicSelect)").each(function(){
				 var idStr = this.id;
				 $("#" + idStr).val(idStr+":1")
		}); 
		$("#myModal").modal("show");
	}
	
	function updateState(state){
		var del = confirm("确认？");
		if (!del) {
			return false;
		}
		var remark = "";
		if(state =='2'){
			 remark = prompt("请输入拒绝原因:");
		}
		var selectObj = $("#infoTable").bootstrapTable('getSelections')[0];
		var id = selectObj.id;
		if (id > 0) {
			var path = "${basePath}/customer/examine";
			$.ajax({
				url : path,
				type : 'post',
				data:{'id':id , 'state' : state , 'remark':remark},
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert( data.msg);
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
	
	function updateData() {
		var selectRow =  $("#infoTable").bootstrapTable('getSelections')[0];
		SetFromValues($("#dataForm"),selectRow);
		var flagJson = eval('({' + $("#flag").val() + '})');
		console.info(flagJson)
		 $("select:not(.dicSelect)").each(function(){
			 var idStr = this.id;
				 for(var  index  in  flagJson){
					 if(idStr == index){
						 $("#" + idStr).val( idStr+":" + flagJson[idStr] )
					 }
				 }
				 
			 
		});  
		$("#myModal").modal("show");
	}
	
	$(function(){
		 
		 $(".dicSelect").each(function(){
			     var field = this.name ;
		    	 var htmlStr = "";
			     if (dic.hasOwnProperty(field)) {
					 for( var keyValue in dic[field] ){
						   htmlStr += "<option value="+keyValue+">"+dic[field][keyValue].describ+"</option>"
					 }
				  } 
			     $(this).append(htmlStr);
		 });
		 
	});
</script>


</html>