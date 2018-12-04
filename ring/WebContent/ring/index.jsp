<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>无名指之约</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<link href="${pageContext.request.contextPath}/ring/css/bootstrap-3.1.1.min.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/ring/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/ring/js/bootstrap.min.js"></script>
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath}/ring/css/style.css" rel='stylesheet' type='text/css' />
<link href='https://fonts.googleapis.com/css?family=Oswald:300,400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700' rel='stylesheet' type='text/css'>
<!----font-Awesome----->
<link href="${pageContext.request.contextPath}/ring/css/font-awesome.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath}/ring/assets/css/icons.css" rel="stylesheet" />
        <!-- jQueryUI -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/sprflat-theme/jquery.ui.all.css" rel="stylesheet" />
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- Plugins stylesheets (all plugin custom css) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/plugins.css" rel="stylesheet" />
        <!-- Main stylesheets (template main css file) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/main.css" rel="stylesheet" />
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <link href="${pageContext.request.contextPath}/ring/assets/css/custom.css" rel="stylesheet" />
<!----font-Awesome----->
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
<body>
   <%@include file="/ring/header.jsp"%>
<!-- ============================  Navigation Start =========================== -->
                    <div class="row" style="margin-top:50px" >
                        <!-- Start .row -->
                        <div class="col-lg-12">
                            <!-- Start col-lg-12 -->
                            <div class="panel panel-default toggle">
                                <!-- Start .panel -->
                                <div class="panel-heading">
                                    <h3 class="panel-title">按条件查询</h3>
                                </div>
                                <div class="panel-body">
                                    <form class=" group-border hover-stripped" role="form" action="${pageContext.request.contextPath}/web/index" method="post">
                                        <div class="form-group " >
                                            <label class="col-lg-2 col-md-2 col-xs-12 control-label">年龄</label>
                                            <div class="col-lg-5 col-md-5 col-xs-5 mb10">
                                                <input type="text" class="form-control"  name="ageFrom">
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-xs-2 mb10" >
                                               至
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-xs-5 mb10">
                                                <input type="text" class="form-control"  name="ageTo">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-xs-12 control-label">身高</label>
                                            <div class="col-lg-5 col-md-5 col-xs-5 mb10">
                                                <input type="text" class="form-control" name="heightFrom">
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-xs-2 mb10">
                                               至
                                            </div>
                                            <div class="col-lg-5 col-md-5 col-xs-5 mb10">
                                                <input type="text" class="form-control"  name="heightTo">
                                            </div>
                                        </div>
                                        <!-- End .form-group  -->
                                        <div class="form-group">
                                            <label class="col-lg-2 col-md-2 col-sm-12 control-label">活动范围</label>
                                            <div class="col-lg-10 col-md-10 mb10" >
                                                <select name="loca" class="form-control col-xs-5 mb10" >
                                               	   <option value="">请选择</option>
                                                	   <option value="1">青岛</option>
                                                	   <option value="2">省内</option>
                                                	   <option value="3">国内</option>
                                                	   <option value="4">国外</option>
                                                </select>
                                                 <select name="addtress" class="form-control col-xs-5 mb10" >
                                                	  	<option value="">请选择</option>
                                                	   <option value="1">市南</option>
                                                	   <option value="2">市北</option>
                                                	   <option value="3">李沧</option>
                                                	   <option value="4">崂山</option>
                                                	   <option value="5">即墨</option>
                                                	   <option value="6">其他</option>
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                         
                                                <button class="btn btn-lg btn-purple btn-block"  >Go!</button>
                                            </div>
                                        <!-- End .form-group  -->
                                    </form>
                                </div>
                            </div>
                            <!-- End .panel -->
                        </div>
                        <!-- End col-lg-12 -->
                    </div>
                    <!-- End .row -->

<div class="grid_1">
      <div class="container">
      	<h1>会员列表</h1>
       	<div class="heart-divider">
			<span class="grey-line"></span>
			<i class="fa fa-heart pink-heart"></i>
			<i class="fa fa-heart grey-heart"></i>
			<span class="grey-line"></span>
        </div>
        <ul id="">
        		<c:forEach items="${list}" var ="customerJoin">
		      <li><div class="col_1"><a href="${pageContext.request.contextPath}/web/customer?id=${customerJoin.id}">
				<img src="${pageContext.request.contextPath}/ring/images/p1.jpg" alt="" class="hover-animation image-zoom-in img-responsive"/>
	             <div class="layer m_1 hidden-link hover-animation delay1 fade-in">
	                <div class="center-middle">详细信息</div>
	             </div>
	             <h3><span class="m_3">无名指ID : MI-${customerJoin.id}</span><br>${customerJoin.birthday }, ${customerJoin.industry }, ${customerJoin.addtress }<br>${customerJoin.declaration }</h3></a></div>
	          </li>
        		</c:forEach>
	    </ul>
	    <script type="text/javascript">
		 $(window).load(function() {
			$("#flexiselDemo3").flexisel({
				visibleItems: 6,
				animationSpeed: 1000,
				autoPlay:false,
				autoPlaySpeed: 3000,    		
				pauseOnHover: true,
				enableResponsiveBreakpoints: true,
		    	responsiveBreakpoints: { 
		    		portrait: { 
		    			changePoint:480,
		    			visibleItems: 1
		    		}, 
		    		landscape: { 
		    			changePoint:640,
		    			visibleItems: 2
		    		},
		    		tablet: { 
		    			changePoint:768,
		    			visibleItems: 3
		    		}
		    	}
		    });
		    
		});
	   </script>
	   <script type="text/javascript" src="${pageContext.request.contextPath}/ring/js/jquery.flexisel.js"></script>
    </div>
</div>
    <div class="footer">
    	<div class="container">
    		<div class="col-md-4 col_2">
    			<h4>关于我们</h4>
    			<p>"无名指之约。。。"</p>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>帮助 & 支持</h4>
    			<ul class="footer_links">
    				<li><a href="contact.html">联系我们</a></li>
    				<li><a href="faq.html">常见问题</a></li>
    			</ul>
    		</div>
    		<div class="col-md-2 col_2">
    			<h4>合作单位</h4>
    			<ul class="footer_links">
    				<li><a href="privacy.html">Privacy Policy</a></li>
    				<li><a href="terms.html">Terms and Conditions</a></li>
    				<li><a href="services.html">Services</a></li>
    			</ul>
    		</div>
    		<div class="clearfix"> </div>
    		<div class="copy">
		      <p>Copyright &copy; 2018.Company name All rights reserved.</p>
	        </div>
    	</div>
    </div>
</body>
</html>