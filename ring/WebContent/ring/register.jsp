<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<title>会员注册</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>
<script>
wx.config({  
    debug: false,  
    appId: '${ret.appId}',  
    timestamp:'${ret.timestamp}',  
    nonceStr:'${ret.nonceStr}',  
    signature:'${ret.signature}',  
    jsApiList : [ 'chooseImage',
                  'previewImage',
                  'uploadImage',
                  'downloadImage' ]  
});//end_config  


wx.ready(function () {
    wx.checkJsApi({
        jsApiList: [
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage'
        ],
        success: function (res) {
            //alert(JSON.stringify(res));
            //alert(JSON.stringify(res.checkResult.getLocation));
            if (res.checkResult.getLocation == false) {
                alert('你的微信版本太低，不支持微信JS接口，请升级到最新的微信版本！');
                return;
            }else{
               // wxChooseImage();
            }
        }
    });
});


wx.error(function(res) {  
   // alert("出错了：" + res.errMsg);  
}); 

function chooseImg(){
	wx.chooseImage({
	    count: 1, //张数， 默认9
	    sizeType: ['compressed'], //建议压缩图
	    sourceType: ['album', 'camera'], // 来源是相册、相机
	    success: function (res) {
	    	var localIds = res.localIds;
	    	alert(localIds)
 //var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
	    //$('.driver-card img').prop('src',res.localIds[0]);
	    //uploadPhoto.uploadToWeixinServer(res.localIds[0],'car')
	   }
	});
	
}

$(function(){
	if($('#datetimepicker2')[0] != undefined){
		$('#datetimepicker2').datetimepicker({  
			minView: "month",
			format: 'yyyy-mm-dd',
		    todayBtn: true,//显示今日按钮
		    autoclose: true,
		    language:"zh-CN",
		    clearBtn: true 
		});
	}
});

	$(document).ready(function() {
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop(true, true).slideDown("fast");
			$(this).toggleClass('open');
		}, function() {
			$('.dropdown-menu', this).stop(true, true).slideUp("fast");
			$(this).toggleClass('open');
		});
	});

	function mail() {

		if (!$("#emailForm").validate().form()) {
			return false;
		}
		var path = "${pageContext.request.contextPath}/web/sendMail";
		$.ajax({
			url : path,
			type : 'post',
			data : {codeEmail:$("#codeEmail").val()},
			dataType : 'json',
			success : function(data) {
				if (data.success) {
					alert(data.msg);
					$("#code").val(data.obj.code);
					$("#userNo").val(data.obj.openId);
				} else {
					alert(data.msg);
					$("#codeEmail").val("")
				}

			},
			error : function(transport) {
				alert("系统产生错误,请联系管理员!");
			}
		});
	}
	
	
	
	 
</script>
</head>
<body id="a2">
	<div class="grid_3">
		<div class="container">
			<div class="services">
				<div class="col-sm-12 col-xs-12 login_left">

					<form id="dataForm"  class="form-horizontal" role="form"  enctype="multipart/form-data" 
					   action="${basePath}/customer/customer_submit" method="post">
						<input class="form-control " name="openId" type="hidden"
							value="${openId}"></input> <input class="form-control " name="id"
							type="hidden"></input> <input class="form-control " name="flag"
							id="flag" type="hidden"></input>
						<div class="form-group">
							<label for="message-text" class="control-label">姓名:</label> <input
								type="text" class="form-control" name="chName" id="chName"
								placeholder="必填" required  onchange="check_unique('chName')">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">昵称:</label> <input
								type="text" class="form-control required" name="nickName"
								id="nickName" placeholder="必填"  onchange="check_unique('nickName')">
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">性别:</label> <select
								class="form-control dicSelect" id="sex" name="sex"
								placeholder="必填" required>
							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">联系电话:</label> <input
								type="text" class="form-control"  id="telephone" name="telephone" placeholder="必填"  >
						</div>
						<div class="form-group">
                            <label class="control-label">头像</label>
                               	<button type="button" onclick="chooseImg()">上传头像</button>
                                <input type="file" name="headFile" id="headFile" class="form-control " accept="image/*"  class="form-control" placeholder="请上传图片">
                        </div>
						<div class="form-group">
                            <label class="control-label">身份证正面图</label>
                                <input type="file" name="upfile" id="upfile" class="form-control " class="form-control" placeholder="请上传有效的身份证正面">
                        </div>
						<div class="form-group">
                                 <label class="control-label">身份证反面图</label>
                                 <input type="file" name="upfile2" id="upfile2" class="form-control "  class="form-control" placeholder="请上传有效的身份证反面">
                        </div  >
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
									class="form-control dicSelect" name="industry" 
										>
	
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
										>
	
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
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	addressInit('cmbProvince', 'cmbCity', 'cmbArea');
	function subInfo() {
		subInfoAll("customer");
	}

	$(function(){
		$("#dataForm").validate({
		    rules: {
		    	telephone : {  
		            required : true,  
		            minlength : 11, 
		            isMobile : true  
		        		}, 
		          },
		   messages: {
			   telephone : {  
			       required : "请输入手机号",  
			       minlength : "不能小于11个字符",  
			       isMobile : "请正确填写手机号码"  
			  		 	}
	  				 },
			});
	})

	function subInfoAll(name) {

		if (!$("#dataForm").validate().form()) {
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
						window.location.href = "${pageContext.request.contextPath}/web/login?userNo=${openId}&pwd=123";
					} else {
						alert(data.msg);
					}

					},
					error : function(transport) {
						alert("系统产生错误,请联系管理员!");
					}
				}); 
	}

	$(function() {

		$(".dicSelect").each(
				function() {
					var field = this.name;
/* 					if(field.indexOf("2")>-1){
						field = field.replace(/2/,"");
					}
 */					var htmlStr = "";
					if (dic.hasOwnProperty(field)) {
						for ( var keyValue in dic[field]) {
							htmlStr += "<option value="+keyValue+">"
									+ dic[field][keyValue].describ
									+ "</option>"
						}
					}
					$(this).append(htmlStr);
				});

		$("select:not(.dicSelect)").each(function() {
			var idStr = this.id;
			$("#" + idStr).val(idStr + ":1")
		});
	});
	
	function check_unique(filed){
		var  value = $("#"+filed).val();
		var path="${basePath}/customer/customer_unique"
		 $.ajax({
			 url : path,
				type : 'post',
				data : { name:value  , colName :filed},
				dataType : 'json',
				success : function(data) {
					if (!data.success)  {
						alert(data.msg);
						$("#"+filed).val("");
					}
				},
				error : function(transport) {
					alert("系统产生错误,请联系管理员!");
				}
		 })
	}
</script>


</html>