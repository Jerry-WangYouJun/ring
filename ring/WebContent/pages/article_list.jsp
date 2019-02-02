<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${basePath}/css/style.css" />
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
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
						onclick="updateState('2')">
						</span>审核通过
					</button>
					<button id="btn_edit" type="button" class="btn btn-default"
						onclick="updateState('9')">
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
		<div class="modal-dialog" style="width:1100px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">文章管理</h4>
				</div>
				<div class="modal-body">
					<form id="dataForm" enctype="multipart/form-data">
						<input class="form-control" name="id" type="hidden"></input>
						<input class="form-control" name="articleState" id="articleState" type="hidden">
						<input class="form-control" name="articleDate" id="articleState" type="hidden">
						<input class="form-control " name="articleTag" id="articleTag" type="hidden"></input>
						<div class="form-group" >
							<label for="message-text" class="control-label">文章名称:</label> <input
								type="text" class="form-control" name="title" id="title" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">文章简介:</label> 
							 <input
								type="text" class="form-control" name="discrib" id="discrib" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">文章类型:</label> 
							<select  class="form-control dicSelect"  name="articleType" placeholder="必填" >
									 
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">标签:</label>
                                     <div class="tags" >
	                       		 	 </div>
								<div class="form-group">
                                        <label class="control-label mt10">添加标签</label>
                                         <input type="text" class="form-control col-lg-6 col-md-6"  id="tagA"  onchange="addTags()">
                                </div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">文章正文:</label>
							<script id="editor" type="text/plain" ></script>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> <input
								type="text" class="form-control" name="remark" id="remark">
						</div>
						<div class="form-group">
							 <button type="button" class="btn btn-default" onclick="subInfo('0')">保存草稿</button>
							<button type="button" class="btn btn-primary" onclick="subInfo('1')">提交</button>
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
	function subInfo() {
		subInfoAll("article");
	}

	function delDish() {
		deleteDataAll("article");
	}

	$(function() {
		$('#infoTable').bootstrapTable({
			url : '${basePath}/article/query', // 请求后台的URL（*）            
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
				field : 'title',
				title : '文章名',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'discrib',
				title : '文章简介',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'articleType',
				title : '文章类型',
				align : 'center',
				valign : 'middle',
				formatter : function(value, row, index, field) {
					return getDicDescirb(value, field);
				}
			}, {
				field : 'articleDate',
				title : '发表时间',
				align : 'center',
				valign : 'middle'
			}, {
				field : 'articleState',
				title : '文章状态',
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
	
	
	function updateState(state){
		var del = confirm("确认？");
		if (!del) {
			return false;
		}
		var remark = "";
		if(state =='9'){
			 remark = prompt("请输入不通过原因:");
		}
		var selectObj = $("#infoTable").bootstrapTable('getSelections')[0];
		var id = selectObj.id;
		if (id > 0  ) {
		var url = "${pageContext.request.contextPath}/web/examineSuccess?table=article&column=article_state" ;
			var path = url;
			$.ajax({
				url : path,
				type : 'post',
				data:{'id':id , 'state' : state , 'remark':remark},
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
	
	</script>
	
	<script type="text/javascript">

	var wid = $("#tagA").parent().width();
	var ue = UE.getEditor('editor',{
		//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
		toolbars:[['fullscreen',  'undo', 'redo', '|',
                   'bold', 'italic', 'underline', 'fontborder', 'strikethrough','|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'fontfamily', 'fontsize', '|',
                   'directionalityltr', 'directionalityrtl', 'indent', '|',
                   'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                   'link', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                   'simpleupload', 'insertimage', 'emotion', 'pagebreak', '|',
                   'horizontal', 'date', 'time', 'spechars', '|',
                    'help']],
		initialFrameWidth: wid ,
		maximumWords: 1000 
		});
	
	function subInfo(state) {
			$("#articleState").val(state);
			subInfoAll("article"); 
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
		 
		 if($('#datetimepicker2')[0] != undefined){
				$('#datetimepicker2').datetimepicker({  
					minView: "month",
					format: 'yyyy-mm-dd hh:00',
				    todayBtn: false,//显示今日按钮
				    autoclose: true,
				    language:"zh-CN",
				    clearBtn: true ,
				    startDate: new Date(),
				    minView: 1
				});
				
			}
	});
	
	function addTags(){
		 var rand = parseInt(Math.random() * (4) + 1); 
		 var  val = $("#tagA").val();
		 if(val != ""){
			 var arr = ["primary","success","info","warning"];
			 $("#articleTag").val($("#articleTag").val() + val + ",");
			 $(".tags").append('<span class="badge badge-' +arr[rand] +'  mt10">'+ val+'<a href="####"  onclick="deleteTag(this)" class="mr5">X</a></span>');
			 $("#tagA").val("");
		 }
	 }
	 function deleteTag(obj){
		   $(obj).parent().remove();
	 }
</script>


</html>