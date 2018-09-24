<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <meta charset="utf-8">
        <title> 无名指会员管理系统</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="author" content="SuggeElson" />
        <meta name="description" content=""/>
        <meta name="keywords" content=""/>
        <meta name="application-name" content="sprFlat admin template" />
        <link rel='stylesheet' type='text/css' />
        <link href="${pageContext.request.contextPath}/assets/css/icons.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/assets/css/custom.css" rel="stylesheet" />
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/img/ico/apple-touch-icon-57-precomposed.png">
        <link rel="icon" href="${pageContext.request.contextPath}/assets/img/ico/favicon.ico" type="image/png">
           <link href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />  
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css">
        <script src="${pageContext.request.contextPath}/assets/js/jquery-1.8.3.min.js"></script>
        <script type="text/JavaScript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
        <meta name="msapplication-TileColor" content="#3399cc" />
    </head>
<body>
        <!-- Start #header -->
        <div id="header">
            <div class="container-fluid">
                <div class="navbar">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.html">
                            <i class="im-windows8 text-logo-element animated bounceIn"></i><span class="text-logo"> 无名指会员系统</span><span class="text-slogan"></span> 
                        </a>
                    </div>
                    <nav class="top-nav" role="navigation">
                        <ul class="nav navbar-nav pull-left">
                            <li id="toggle-sidebar-li">
                                <a href="#" style="padding: 12px" id="toggle-sidebar"><i class="en-arrow-left2"></i>
                        		</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav pull-right">
                            <li class="dropdown">
                                <a href="#"  data-toggle="dropdown">设置</a>
                                <ul class="dropdown-menu right" role="menu">
                                    <li><a href="${pageContext.request.contextPath}/user/loginOut"><i class="im-exit"></i>退出登录</a>
                                    </li>
                                    <li><a href="###" onclick="uploadModal()"><i class="im-spell-check"></i>修改密码</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown" style="margin-top: 15px">
                               <span class="text-logo" style="margin-top: 15px">${user.userName}</span>
                            </li>
                        </ul>
                    </nav>
                </div>
                <!-- Start #header-area -->
                <!-- End #header-area -->
            </div>
            <!-- Start .header-inner -->
        </div>
        <!-- End #header -->
        <!-- Start #sidebar -->
        <div id="sidebar">
            <!-- Start .sidebar-inner -->
            <div class="sidebar-inner">
                <!-- Start #sideNav -->
                <ul id="sideNav" class="nav nav-pills nav-stacked">
                    <li>
                        <a href="#"> 系统管理 <i class="im-paragraph-justify"></i></a>
                        <ul class="nav sub">
                            <li>
                            	<a href="#" class="ec-users" onclick='addTab("user","${pageContext.request.contextPath}/pages/user_list.jsp","账户信息")'>
								 账户信息</a>
                            </li>
                            <li>
                            	<a href="#" class="ec-users" onclick='addTab("user","${pageContext.request.contextPath}/pages/user_list.jsp","信用状态")'>
								信用状态</a>
                            </li>
                            <li>
                            	<a href="#" class="ec-users" onclick='addTab("user","${pageContext.request.contextPath}/pages/user_list.jsp","约会地点维护")'>
								 约会地点信息</a>
                            </li>
                            <li>
                            	<a href="#" class="ec-users" onclick='addTab("user","${pageContext.request.contextPath}/pages/user_list.jsp","提醒信息维护")'>
								 提醒信息维护</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                    	 	 <a href="#" class="ec-users" onclick='addTab("user2","${pageContext.request.contextPath}/pages/user_list.jsp","会员管理")'> 会员管理 </a>
                    </li>
                    <li>
                    	 	 <a href="#" class="ec-users" onclick='addTab("user2","${pageContext.request.contextPath}/pages/user_list.jsp","会员积分信息")'> 会员积分信息 </a>
                    </li>
                    <li>
                    	 	 <a href="#" class="ec-users" onclick='addTab("user2","${pageContext.request.contextPath}/pages/user_list.jsp","约会信息")'> 约会信息 </a>
                    </li>
                </ul>
            </div>
            <!-- End .sidebar-inner -->
        </div>
        <!-- End #sidebar -->
        <!-- Start #content -->
        <div id="content">
            <!-- Start .content-wrapper -->
            <div class="content-wrapper">
                <!-- End .row -->
                <div class="outlet">
                		<div class="row">	  
                					<ul class="nav nav-tabs" style="margin:0px" role="tablist" id="deviceulid">
							
									</ul>
									<!-- 面板区 -->
									<div  id ="home" class="tab-content">
									
									</div>
                		</div>
                </div>
                <!-- End .outlet -->
            </div>
            <!-- End .content-wrapper -->
            <div class="clearfix"></div>
        </div>
        <script src="${pageContext.request.contextPath}/assets/plugins/core/pace/pace.min.js"></script>
        <script>
        window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-2.1.1.min.js">\x3C/script>')
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
        <script>
        window.jQuery || document.write('<script src="${pageContext.request.contextPath}/assets/js/libs/jquery-ui-1.10.4.min.js">\x3C/script>')
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap/bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jRespond.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/core/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/core/slimscroll/jquery.slimscroll.horizontal.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/forms/autosize/jquery.autosize.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/core/quicksearch/jquery.quicksearch.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/ui/bootbox/bootbox.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.pie.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.resize.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.time.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.growraf.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.categories.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.stack.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/jquery.flot.tooltip.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/flot/date.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/sparklines/jquery.sparkline.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/charts/pie-chart/jquery.easy-pie-chart.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/forms/icheck/jquery.icheck.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/forms/tags/jquery.tagsinput.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/forms/tinymce/tinymce.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/misc/highlight/highlight.pack.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/misc/countTo/jquery.countTo.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/ui/weather/skyicons.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/ui/notify/jquery.gritter.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/ui/calendar/fullcalendar.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.sprFlat.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/pages/dashboard.js"></script>
    
		<script src="${pageContext.request.contextPath}/js/moment-with-locales.js"></script>  
		<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script> 
		<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script> 
        
        <script>
		/**
         * 增加标签页
         */
        function addTab(  tabName ,tabUrl , title , obj) {
			$(".active").removeClass("active");
			$(obj).addClass("active");
            //option:
            //tabMainName:tab标签页所在的容器
            //tabName:当前tab的名称
            //tabTitle:当前tab的标题
            //tabUrl:当前tab所指向的URL地址
            var exists = checkTabIsExists('deviceulid', tabName);
            if(exists){
                $("#tab_a_"+tabName).click();
            } else {
                $("#deviceulid").append('<li id="tab_li_'+tabName+'"><a href="#tab_content_'+tabName+'" data-toggle="tab" id="tab_a_'+tabName+'" >'+title+'&nbsp;<span class="fa-remove" type="button" onclick="closeTab(this);"></span></a></li>');
                //固定TAB中IFRAME高度
                mainHeight = $(document.body).height() - 5;
                var content = '';
                if(content){
                    content = option.content;
                } else {
                    content = '<iframe id="myframe_'+tabName+'" src="' + tabUrl + '" width="100%"  height="780px"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes" allowtransparency="yes"></iframe>';
                }
                $("#home").append('<div id="tab_content_'+tabName+'" role="tabpanel" class="tab-pane" id="'+ tabName+'">'+content+'</div>');
                $("#tab_a_"+tabName).click();
            }
        }
         function toggleTab(obj){
      		   $("#tab_content_"+obj).click(function (e) {
      			   e.preventDefault();
      			   $("#tab_a_" + obj).tab('show');
         		});
         }
        
         
        /**
         * 关闭标签页
         * @param button
         */
        function closeTab (button) {
             
            //通过该button找到对应li标签的id
            var li_id = $(button).parent().parent().attr('id');
            var id = li_id.replace("tab_li_","");
             
            //如果关闭的是当前激活的TAB，激活他的前一个TAB
            if ($("li.active").attr('id') == li_id) {
                $("li.active").prev().find("a").click();
            }
             
            //关闭TAB
            $("#" + li_id).remove();
            $("#tab_content_" + id).remove();
        };
         
        /**
         * 判断是否存在指定的标签页
         * @param tabMainName
         * @param tabName
         * @returns {Boolean}
         */
        function checkTabIsExists(tabMainName, tabName){
            var tab = $("#"+tabMainName+" > #tab_li_"+tabName);
            //console.log(tab.length)
            return tab.length > 0;
        }

     	function uploadModal() {
     		$('#uploadModal').modal({backdrop: 'static'});
    			$("#uploadModal").modal("show");
    			
    		}
     	
     	function uploadPwd(){
     		var path = "${pageContext.request.contextPath}/user/pwd";
     		var pwd = $("#newpwd").val();
     		var confirm = $("#confirmpwd").val();
     		if(pwd=='' || confirm==''){
     			 alert("密码不能为空");
     			 return  false;
     		}
     		if(pwd != confirm){
     			 alert("两次密码不一致，请重新输入");
     			$("#newpwd").val("");
         		$("#confirmpwd").val("");
         		return false ;
     		}
     		$.ajax({
				url : path,
				type : 'post',
				data: {'pwd': pwd} ,
				dataType : 'json',
				success : function(data) {
					if (data.success) {
						alert( data.msg);
						closeModel();
					} else {
						alert( data.msg);
					}
	
				},
				error : function(transport) {
					alert( "系统产生错误,请联系管理员!");
				}
			});
     	}
	</script>
	
	<div class="modal fade" id="uploadModal" tabindex="-2" role="dialog"
		aria-labelledby="uploadModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width:400px; ">
			<div class="modal-content">
				<div class="modal-body">
					   	<form class="form-signin" role="form" method="POST"
						 id="mlbForm"
						action="${pageContext.request.contextPath}/uploadExcel/upload.do">
						<div class="form-group">
						    <label style="width: 70px" for="message-text" class="control-label">新密码:</label>
						    <input type="password"   id="newpwd" />
						</div>
						<div class="form-group">
						    <label style="width: 70px" for="message-text" class="control-label">确认密码:</label>
						    <input type="password"   id="confirmpwd" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button"  class="btn btn-primary"  onclick="uploadPwd()">修改密码</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
    </body>
</html>