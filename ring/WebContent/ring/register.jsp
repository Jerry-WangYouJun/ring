<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html id="a1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<%@include file="/common.jsp"%>
<script src="${pageContext.request.contextPath }/js/dic.js" charset="utf-8"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.4.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css"  media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
<title>会员注册</title>
<style type="text/css">
.panel-body {
	padding: 0px !important;
}
</style>
</head>
<body id="a2">
	<div class="grid_3">
		<div class="container">
			<div class="services">
				<div class="col-sm-12 col-xs-12 login_left">
					<form id="dataForm"  class="form-horizontal" role="form"  enctype="multipart/form-data" 
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
							<label for="message-text" class="control-label">性别(必选):</label> 
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
								type="text" class="form-control email required " name="email" value="${mycust.email}" placeholder="必填"  >
						</div>
						<!-- <div class="form-group">
                            <label class="control-label">头像</label>
                                <input type="file" name="headFile" id="headFile" class="form-control " accept="image/*"  class="form-control" placeholder="请上传图片">
                        </div> -->
						<div class="form-group">
                                <input type="hidden" name="frontImg" id="frontImg" value="${mycust.frontImg}"  class="form-control required" >
							 <div class="layui-upload">
							  <button type="button" class="layui-btn" id="upfileFront">上传身份证正面</button>
							  <div class="layui-upload-list">
							    <img class="layui-upload-img" id="demo1" width="100%"  >
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
								type="text" class="form-control number required"  name="height" value="${mycust.height}" placeholder="必填">
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">体重(kg):</label> <input
								type="text" class="form-control number required" name="weight" value="${mycust.weight}" placeholder="必填">
						</div> 
						<div class="form-group ">
							<label for="message-text" class="control-label">婚姻状况(必选):</label> <select
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
							<label for="message-text" class="control-label">学历（全日制最高学历）(必选):</label> <select
								class="form-control dicSelect" name="degree"  value="${mycust.degree }"
								required>

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">住房状态(必选):</label> <select
								class="form-control dicSelect" name="houseStatus" value="${mycust.houseStatus }"
								placeholder="必填" required>

							</select>
						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">用车状态(必选):</label> <select
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
							<label for="message-text" class="control-label">从事行业(必选):</label> 
								<select
									class="form-control dicSelect" name="industry"  value="${mycust.industry }" required>
	
								</select>

						</div>
						<div class="form-group ">
							<label for="message-text" class="control-label">月收入(税前)(必选):</label> <select
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
						<hr width="150%" style="height:2px;margin: 30px -25% 10px" color=black>
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
							<button type="button" class="btn btn-primary" onclick="window.history.back()">返回</button>
						</div>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
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
		if("${mycust.hometown}"){
			var  hometownArr = "${mycust.hometown}".split(",");
			$("#hometownProvince").val(hometownArr[0]);
			$("#hometownCity").val(hometownArr[1])
			$("#hometownCountry").val(hometownArr[2]) 
		}else{
			$("#hometownProvince").val("");
			$("#hometownCity").val("")
			$("#hometownCountry").val("") 
		}
		if("${mycust.addtress}"){
			var  hometownArr = "${mycust.addtress}".split(",");
			$("#cmbProvince").val(hometownArr[0]);
			$("#cmbCity").val(hometownArr[1])
			$("#cmbArea").val(hometownArr[2]) 
		}
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
			 layer.msg("有必填选项没有填写，请仔细检查");
     		$('#chName').focus();
     		return false;
		} 
	            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
	            if (!myreg.test($("#telephone").val())) {
	            		 layer.msg("手机号不合法");
	                return false;
	            } 
	            var img1 = $("#frontImg").val();
	            if(img1 == ''){
	            		layer.msg("身份证正面必须上传");
	            		$('#upfileFront').focus();
	            		return false;
	            		
	            }
	            var img2 = $("#backImg").val();
	            if(img2 == ''){
	            		layer.msg("身份证反面必须上传");
	            		$('#upfileBack').focus();
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

	$(function() {
		//加载多选字典数据，第二个字段为多选的已有值或者默认值
		setCheckbox(dic,"");
		
		$(".dicSelect").each(
				function() {
					var field = this.name;
/* 					if(field.indexOf("2")>-1){
						field = field.replace(/2/,"");
					}
					concosle.info()
 */					var htmlStr = "";
					if (dic.hasOwnProperty(field)) {
						for ( var keyValue in dic[field]) {
							htmlStr += "<option value="+keyValue+">"
									+ dic[field][keyValue].describ
									+ "</option>"
						}
					}
					$(this).append(htmlStr);
					$(this).val($(this).attr("value"))
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