<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath }/js/dic.js" charset="utf-8"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
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
						审核通过
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
					<form id="dataForm"   enctype="multipart/form-data" 
					   action="${basePath}/customer/customer_submit" method="post">
						<input class="form-control " name="openId" type="hidden" value="${mycust.openId}"></input>
						<input class="form-control " name="id" type="hidden" value="${mycust.id}"></input> 
						<input class="form-control " name="flag" id="flag" type="hidden" value="${mycust.flag}"></input>
						<div class="form-group"  style="text-align: center">
							<label for="message-text" class="control-label" style="font-size:">个人信息</label> 
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName" value="${mycust.chName }"
								placeholder="必填" required  >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control required" name="nickName"
								id="nickName" placeholder="必填"  onchange="check_unique('nickName')" value="${mycust.nickName}">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性别:</label> 
							<select  class="form-control dicSelect" id="sex" name="sex"  value="${mycust.sex}"
								placeholder="必填" required>
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control required" onchange="checkTelephone()"  id="telephone" value="${mycust.telephone}" name="telephone" placeholder="必填"  >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">微信号:</label> <input
								type="text" class="form-control " name="wx" value="${mycust.wx}">
						</div>
						
						<div class="form-group ">
							<label for="message-text" class="control-label">邮箱:</label> <input
								type="text" class="form-control email required " name="email" value="${mycust.email}">
						</div>
						<!-- <div class="form-group">
                            <label class="control-label">头像</label>
                                <input type="file" name="headFile" id="headFile" class="form-control " accept="image/*"  class="form-control" placeholder="请上传图片">
                        </div> -->
						<div class="form-group">
                                <input type="hidden" name="frontImg" id="frontImg" value="${mycust.frontImg}"  class="form-control" >
							 <div class="layui-upload">
							  <button type="button" class="layui-btn" id="upfileFront">上传身份证正面</button>
							  <div class="layui-upload-list">
							    <img class="layui-upload-img" id="demo1" width="100%" >
							    <p id="demoText"></p>
							  </div>
							</div> 
                        </div>
                        
                        <div class="form-group">
                             <input type="hidden" name="backImg"  id="backImg" class="form-control " class="form-control" value="${mycust.backImg}" >
							 <div class="layui-upload">
							  <button type="button" class="layui-btn" id="upfileBack">上传身份证反面</button>
							  <div class="layui-upload-list">
							    <img class="layui-upload-img" id="demo2" width="100%" >
							    <p id="demoText2"></p>
							  </div>
							</div> 
                        </div>
                                  
						<div class="form-group">
							<label for="message-text" class="control-label">生日:</label>
							<div class='input-group date' id='datetimepicker3'>
								<input type='text' class="form-control" readonly name="birthday" value="${mycust.birthday}"
									id="birthday" placeholder="必填" required /> <span
									class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">家乡:</label> 
							<div class="col-lg-12">
								<div class="row">
									<select id="hometownProvince" name="hometown" class="form-control col-lg-4 col-ms-4 col-xs-4" ></select>
									<select id="hometownCity" name="hometown" class="form-control col-lg-4" ></select>
									<select id="hometownCountry" name="hometown" class="form-control col-lg-4" ></select>
								</div>	
							</div>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="control-label">现居地:</label>
							<div class="col-lg-12">
								<div class="row">
									<select id="cmbProvince" name="addtress" class="form-control col-lg-4 col-ms-4 col-xs-4" ></select>
									<select id="cmbCity" name="addtress" class="form-control col-lg-4" ></select>
									<select id="cmbArea" name="addtress" class="form-control col-lg-4" ></select>
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">经常活动区域:</label>
								<div class="col-lg-12">
								<div class="row dicCheckbox"  name="custLoca" value="${mycust.loca}">
								</div>	
							</div>

						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">身高(cm):</label> <input
								type="text" class="form-control number" name="height" value="${mycust.height}">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">体重(kg):</label> <input
								type="text" class="form-control number" name="weight" value="${mycust.weight}">
						</div> 
						<div class="form-group ">
							<label for="message-text" class="control-label">婚姻状况:</label> <select
								class="form-control dicSelect" name="marriage" placeholder="必填"
								required  value="${mycust.marriage }">

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">子女:</label> <select
								class="form-control dicSelect" name="children" value="${mycust.children }">

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">学历（全日制最高学历）:</label> <select
								class="form-control dicSelect" name="degree" placeholder="必填" value="${mycust.degree }"
								required>

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">住房状态:</label> <select
								class="form-control dicSelect" name="houseStatus" value="${mycust.houseStatus }"
								placeholder="必填" required>

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">用车状态:</label> <select
								class="form-control dicSelect" name="carStatus" value="${mycust.carStatus }"
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
									class="form-control dicSelect" name="industry"  value="${mycust.industry }"
										>
	
								</select>

						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">月收入(税前):</label> <select
								class="form-control dicSelect" name="income" placeholder="必填" value="${mycust.income }"
								required>

							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性格:</label>
								<div class="col-lg-12">
								<div class="row dicCheckbox" name="disposition" value="${mycust.disposition}">
												   
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">兴趣爱好:</label>
								<div class="col-lg-12">
								<div class="row dicCheckbox" name="hobby" value="${mycust.hobby}">
								</div>	
							</div>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">工作时间 :</label> <select
								class="form-control dicSelect" name="weekday" value="${mycust.weekday }">
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">工作性质（出差情况） :</label> <select
								class="form-control dicSelect" name="travel" value="${mycust.travel }"
								>
							</select>
						</div>
						
						<div class="form-group ">
							<label for="message-text" class="control-label">推荐人:</label> <input
								type="text" class="form-control" name="referee" value="${mycust.referee }">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">自我介绍:</label><!--  <input
								type="text" class="form-control" name="introduction"
								id="introduction"> -->
								<textarea rows="3"   class="form-control" name="introduction"
								id="introduction">${mycust.introduction }</textarea>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">爱情宣言:</label> <!-- <input
								type="text" class="form-control" name="declaration"
								id="declaration"> -->
								<textarea rows="2"   class="form-control" name="declaration"
								id="declaration">${mycust.declaration }</textarea>
						</div>
						
						
						<!-- 择偶要求 -->
						<div class="form-group"  style="text-align: center;margin:0px">
							<label for="message-text" class="control-label" style="font-size:">择偶要求</label> 
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">出生年月:</label>
							<div class="form-inline">
									
									<input type="text" class="form-control layui-input" id="age1"  name="age1" readonly="readonly" value="${mycust.age1 }">
									<label for="message-text" class="control-label"> 至</label>
									<input type="text" class="form-control layui-input" id="age2" name="age2" readonly="readonly" value="${mycust.age2 }">
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">身高范围:</label>
							<div class="form-inline">
									
									<input type="text" class="form-control layui-input number" id="height1" name="height1"  value="${mycust.height1 }">
									<label for="message-text" class="control-label"> 至</label>
									<input type="text" class="form-control layui-input number" id="height2" name="height2"  value="${mycust.height2 }">
							</div>
						</div>
						<!-- <div class="form-group">
							<label for="message-text" class="control-label">外貌:</label><select
								class="form-control dicSelect" name="looks">
							</select>
						</div> -->
						<div class="form-group">
							<label for="message-text" class="control-label">税前月收入:</label>
								<select
								class="form-control dicSelect" name="economic" value="${mycust.economic }">
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">住房状态:</label> <select
								class="form-control dicSelect" name="houseStatus2" value="${mycust.houseStatus2 }"
								placeholder="必填" >

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">用车状态:</label> <select
								class="form-control dicSelect" name="carStatus2" value="${mycust.carStatus2 }"
								placeholder="必填" >

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">工作时间 :</label> <select
								class="form-control dicSelect" name="weekday2" value="${mycust.weekday2 }">
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">工作性质（出差情况） :</label> <select
								class="form-control dicSelect" name="travel2" value="${mycust.travel2 }"
								>
							</select>
						</div>
						<!-- <div class="form-group ">
							<label for="message-text" class="control-label">性格:</label> 
								<select
								class="form-control dicSelect" name="disposition">
							</select>
						</div> -->
						<div class="form-group">
							<label for="message-text" class="control-label">性格:</label>
								<div class="col-lg-12">
								<div class="row dicCheckbox" name="disposition2" value="${mycust.disposition2}">
												    
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">兴趣爱好:</label>
							<div class="col-lg-12">
								<div class="row dicCheckbox" name="hobby2" value="${mycust.hobby2}">
								</div>	
							</div>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">期望对方将来的生活角色 :</label> 
							<div class="col-lg-12">
								<div class="row dicCheckbox" name="lifeRole" value="${mycust.lifeRole}">
								</div>	
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">期望未来对象的类型:</label> 
							<div class="col-lg-12">
								<div class="row dicCheckbox" name="lifeType" value="${mycust.lifeType}">
								</div>
							</div>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">不可接受的类型:</label> 
							 <input
								type="text" class="form-control" name="nonType" id="nonType"  value="${mycust.nonType}">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> 
								<textarea rows="2"   class="form-control" name="remark"
								id="remark">${mycust.remark }</textarea>
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
							<button  type="button" class="btn btn-primary" onclick="updateState('1')">审核通过</button>
							<button  type="button" class="btn btn-primary" onclick="updateState('2')">审核不通过</button>
						</div>
					</form>
				</div>
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
<script type="text/javascript">
	//addressInit('cmbProvince', 'cmbCity', 'cmbArea');
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
		 $("select:not(.dicSelect)").each(function(){
			 var idStr = this.id;
				 for(var  index  in  flagJson){
					 if(idStr == index){
						 $("#" + idStr).val( idStr+":" + flagJson[idStr] )
					 }
				 }
		}); 
		 $(".dicCheckbox").each(function(){
			 var htmlStr = "";
			 $(this).html(htmlStr);
			 var field = $(this).attr("name");
			 var val = selectRow[field];
			 if(field == 'custLoca'){
				 val = selectRow["loca"];
			 }
				if (dic.hasOwnProperty(field)) {
					for ( var keyValue in dic[field]) {
						htmlStr += ' <label class="checkbox-inline"> <input type="checkbox"  value="'
							+ dic[field][keyValue].describ + '" name="' + field +'"  ' 
							if(val && val.indexOf(dic[field][keyValue].describ ) != -1){
								htmlStr +=  'checked="checked" >' 
							}else{
								htmlStr +=  '>'
							}
						htmlStr +=  dic[field][keyValue].describ + '</label>'
					}
				}
				$(this).append(htmlStr);
		 });
		
		$(".dicSelect").each(function() {
				var field = this.name;
			 	$(this).val(selectRow[field]);
		  });
			
		 if(selectRow.hometown){
				var  hometownArr = selectRow.hometown.split(",");
				$("#hometownProvince").val(hometownArr[0]);
				$("#hometownCity").val(hometownArr[1])
				$("#hometownCountry").val(hometownArr[2]) 
			}else{
				$("#hometownProvince").val("");
				$("#hometownCity").val("")
				$("#hometownCountry").val("") 
			}
			if(selectRow.addtress){
				var  hometownArr = selectRow.addtress.split(",");
				$("#cmbProvince").val(hometownArr[0]);
				$("#cmbCity").val(hometownArr[1])
				$("#cmbArea").val(hometownArr[2]) 
			}
			
			if(selectRow.frontImg){
				$("#demo1").attr("src",selectRow.frontImg)
			}
			if(selectRow.backImg){
				$("#demo2").attr("src",selectRow.backImg)
			}
			$("#dataForm").validate();
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
		 setCheckbox(dic);
		 
	});
	
	$(function(){
		if($('#datetimepicker3')[0] != undefined){
			$('#datetimepicker3').datetimepicker({ 
				startView: 'decade',
				minView:"2",
				format: 'yyyy-mm-dd',
			    todayBtn: true,//显示今日按钮
			    endDate : new Date(),
			    autoclose: true,
			    maxDate:new Date(),
			    language:"zh-CN",
			    clearBtn: true 
			});
		}
		
	});
	$(function(){
		addressInit('cmbProvince', 'cmbCity', 'cmbArea');
		addressInit('hometownProvince', 'hometownCity', 'hometownCountry');
	})

	function checkTelephone(){
		 var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
         if (!myreg.test($("#telephone").val())) {
         		 layer.msg("手机号不合法,请重填");
         		$("#telephone").val("")
             return false;
         } 
         check_unique('telephone');
	}

	function subInfo() {
		subInfoAll("customer");
	}
	function subInfoAll(name) {
		if (!$("#dataForm").validate().form()) {
			return false;
		}
	            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
	            if (!myreg.test($("#telephone").val())) {
	            		 layer.msg("手机号不合法");
	                return false;
	            } 

		var path = "${pageContext.request.contextPath}/" + name + "/" + name
				+ "_edit";
			$("#dataForm").ajaxSubmit({
                       method: 'post',
					data : $("#dataForm").serialize(),
                       url: path,
                       async: false,
				success : function(data) {
					if (data.success) {
						alert(data.msg);
						window.location.href = "${pageContext.request.contextPath}/web/login?remark=${mycust.openId}&pwd=123";
					} else {
						alert(data.msg);
					}

					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				}); 
	}

	
	function check_unique(filed){
		
		var  value = $("#"+filed).val();
		if(value==''){
			return false;
		}
		var path="${basePath}/customer/customer_unique"
		 $.ajax({
			 url : path,
				type : 'post',
				data : { name:value  , colName :filed},
				dataType : 'json',
				success : function(data) {
					if (!data.success)  {
						layer.alert(data.msg);
						$("#"+filed).val("");
					}
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
		 })
	}
	
	
	layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  laydate.render({
		    elem: '#age1'
		    ,type: 'year'
		  });
	  
	  laydate.render({
		    elem: '#age2'
		    ,type: 'year'
		  });
	});
	
	layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '#upfileFront'
		    ,url: '${basePath}/customer/cardimg'
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo1').attr('src', result); //图片链接（base64）
		      });
		    }
		    ,done: function(res){
		    	  console.info(res);
		      //如果上传失败
		      if(res.success){
		    	  	  $("#frontImg").val(res.msg);
		      }else{
		        return layer.msg('上传失败');
		      }
		      //上传成功
		    }
		    ,error: function(){
		      //演示失败状态，并实现重传
		      var demoText = $('#demoText');
		      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
		      demoText.find('.demo-reload').on('click', function(){
		        uploadInst.upload();
		      });
		    }
		  });
		  
		  var uploadInst2 = upload.render({
			    elem: '#upfileBack'
			    ,url: '${basePath}/customer/cardimg'
			    ,before: function(obj){
			      //预读本地文件示例，不支持ie8
			      obj.preview(function(index, file, result){
			        $('#demo2').attr('src', result); //图片链接（base64）
			      });
			    }
			    ,done: function(res){
			    	  console.info(res);
			      //如果上传失败
			      if(res.success){
			    	  	$("#backImg").val(res.msg);
			      }else{
			        return layer.msg('上传失败');
			      }
			      //上传成功
			    }
			    ,error: function(){
			      //演示失败状态，并实现重传
			      var demoText = $('#demoText2');
			      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			      demoText.find('.demo-reload').on('click', function(){
			        uploadInst2.upload();
			      });
			    }
			  });
	});
</script>


</html>