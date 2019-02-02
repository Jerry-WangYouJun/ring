<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<c:set var="basePath" value="${pageContext.request.contextPath}" scope="request"></c:set>
<script type="text/javascript" src="${basePath}/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script src="${basePath}/js/validate/jquery.validate.min.js"></script>
<script src="${basePath}/js/validate/jquery.metadata.js"></script>
<script src="${basePath}/js/validate/messages_zh.js"></script>
<script src="${basePath}/js/base.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-table.min.css" />  
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
<script type="text/JavaScript" src="${basePath}/js/jquery.form.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<link rel="stylesheet" href="${basePath}/css/style.css" />
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<title>新建活动</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
.error{
	 color:red;
}
</style>
<script>
var dic = eval('(${dic})');
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

$(function(){
	$("#dataForm").validate();
});
</script>
</head>
<body id="a2">
<%@include file="/ring/activity/header.jsp"%>
	<div class="grid_3" style="margin-top:70px">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-12 col-xs-12 login_left">
	    <form id="dataForm" enctype="multipart/form-data">
						<input class="form-control " name="id" type="hidden"></input>
						<input class="form-control " name="tags" id="tags" type="hidden"></input>
						<div class="form-group" >
							<label for="message-text" class="control-label">活动名称:</label> <input
								type="text" class="form-control" name="actName" id="actName" placeholder="必填" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">活动开始时间:</label> 
							 <div class='input-group date' id='datetimepicker3'>
								<input type='text' class="form-control" readonly name="actDate"
									id="actDate" placeholder="必填" required/> <span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">预计结束时间:</label> 
							 <div class='input-group date' id='datetimepicker2'>
								<input type='text' class="form-control" readonly name="actEnd"
									id="actEnd" placeholder="必填" /> <span class="input-group-addon"> <span
									class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">活动人数:</label> <input
								type="text" class="form-control number" name="acount" id="acount" placeholder="必填" >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">活动地点:</label> <input
								type="text" class="form-control required" name="actLoca" id="actLoca" placeholder="必填" >
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">具体地址:</label> <input
								type="text" class="form-control required" name="actAddress" id="actAddress" placeholder="必填" >
						</div>
						<div class="form-group">
                                <input type="hidden" name="actImg" id="actImg"   class="form-control" >
							 <div class="layui-upload">
							  <button type="button" class="layui-btn" id="upfileFront">封面图片:</button>
							  <div class="layui-upload-list">
								    <img class="layui-upload-img" id="demo1" width="100%"  src="" >
							    <p id="demoText"></p>
							  </div>
							</div> 
                        </div>
						<div class="form-group">
							<label for="message-text" class="control-label">费用类型:</label>
							<select  class="form-control dicSelect"  name="payType" placeholder="必填" required>
									 
							</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">费用范围:</label>
							<input
								type="text" class="form-control required" name="payRange" id="payRange"  placeholder="请填写具体的费用或者范围" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">主办方:</label>
								<select  class="form-control dicSelect"  name="admin" placeholder="必填" required>
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">活动限制:</label>
								<select  class="form-control dicSelect"  name="singleflag" placeholder="必填" required>
								</select>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">活动形式:</label> 
							<select  class="form-control dicSelect"  name="actForm" placeholder="必填" required>
									 
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
							<label for="message-text" class="control-label">活动内容:</label>
							<script id="editor" type="text/plain" ></script>
						</div>
						
						<div class="form-group">
							<label for="message-text" class="control-label">备注:</label> <input
								type="text" class="form-control" name="remark" id="remark">
						</div>
						<div class="form-group">
							 <button type="button" class="btn btn-default" >关闭</button>
							<button type="button" class="btn btn-primary" onclick="subInfo()">提交</button>
						</div>
					</form>
	  </div>
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
</body>
<script type="text/javascript">

	var wid = $("#tagA").parent().width();
	var ue = UE.getEditor('editor',{
		//这里可以选择自己需要的工具按钮名称,此处仅选择如下五个
		toolbars:[['simpleupload','Source', 'Undo', 'Redo','Bold','test']],
		initialFrameWidth: wid,
		maximumWords: 1000 
		});
	
	function subInfo() {
		subInfoAll("act");
	}
	
	function subInfoAll(name) {
		
		if(!$("#dataForm").validate().form()){
			return false ; 
		}
		var path = "${pageContext.request.contextPath}/"+name+"/"+name+"_edit";
		$.ajax({
			url : path,
			type : 'post',
			data : $("#dataForm").serialize(),
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#infoTable").bootstrapTable("refresh");
					window.location.href="${pageContext.request.contextPath}/act/index";
				} else {
					alert(data.msg);
				}
	
			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
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
				})
			}
	});
	
	function addDate(date,days){ 
	    var d=new Date(date); 
	    d.setDate(d.getDate()+days); 
	    var m=d.getMonth()+1; 
	    return d.getFullYear()+'-'+m+'-'+d.getDate(); 
	  } 
	function addTags(){
		 var rand = parseInt(Math.random() * (4) + 1); 
		 var  val = $("#tagA").val();
		 var arr = ["primary","success","info","warning"];
		 $("#tags").val($("#tags").val() + val + ",");
		 $(".tags").append('<span class="badge badge-' +arr[rand] +'  mt10">'+ val+'<a href="####"  onclick="deleteTag(this)" class="mr5">X</a></span>');
	 }
	 function deleteTag(obj){
		   $(obj).parent().remove();
	 }
	 
	 $(function(){
			if($('#datetimepicker3')[0] != undefined){
				$('#datetimepicker3').datetimepicker({  
					minView: "month",
					format: 'yyyy-mm-dd hh:00',
				    todayBtn: false,//显示今日按钮
				    autoclose: true,
				    language:"zh-CN",
				    clearBtn: true ,
				    startDate: addDate(new Date() , 3),
				    minView: 1
				}).on('changeDate',function(){
				   //$("#beginTime-error").hide();
				    var startTime= $(this).children()[0].value
				    $("#datetimepicker2").datetimepicker('setStartDate',startTime);
				    $("#datetimepicker3").datetimepicker('hide');
				});
			}
		});
	 
	 
	 
	 layui.use('upload', function(){
		  var $ = layui.jquery
		  ,upload = layui.upload;
		  
		  //普通图片上传
		  var uploadInst = upload.render({
		    elem: '#upfileFront'
		    ,url: '${pageContext.request.contextPath}/customer/cardimg'
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
		    	  	  $("#actImg").val(res.msg);
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
		  
	});
</script>


</html>