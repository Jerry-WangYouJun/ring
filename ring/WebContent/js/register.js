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
	function subInfo() {
		subInfoAll("customer");
	}

	function checkTelephone(){
		 var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
         if (!myreg.test($("#telephone").val())) {
         		 layer.msg("手机号不合法,请重填");
         		$("#telephone").val("")
             return false;
         } 
         check_unique('telephone');
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
		