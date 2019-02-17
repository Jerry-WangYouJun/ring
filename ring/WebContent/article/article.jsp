<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
<link rel="stylesheet" href="${basePath}/css/style.css" />
 <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ueditor/lang/zh-cn/zh-cn.js"></script>
<title>新建文章</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>
<script>
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
</script>
</head>
<body id="a2">
	<div class="grid_3" style="margin-top:70px">
  <div class="container">
   <div class="services">
   	  <div class="col-sm-12 col-xs-12 login_left">
	    <form id="dataForm" enctype="multipart/form-data">
						<input class="form-control" name="id" type="hidden"></input>
						<input class="form-control" name="articleState" id="articleState" type="hidden">
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
	  <div class="clearfix"> </div>
   </div>
  </div>
</div>
</body>
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
					//window.location.href="${pageContext.request.contextPath}/article/index";
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