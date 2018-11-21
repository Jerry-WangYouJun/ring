<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Marital Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
<!-- ============================  Navigation Start =========================== -->
 <div class="navbar navbar-inverse-blue navbar">
    <!--<div class="navbar navbar-inverse-blue navbar-fixed-top">-->
      <div class="navbar-inner navbar-inner_1">
        <div class="container">
           <a class="brand" href="index.html"><img src="${pageContext.request.contextPath}/ring/images/logo.png" alt="logo"></a>
           <div class="pull-right">
          	<nav class="navbar nav_bottom" role="navigation">
 
		 <!-- Brand and toggle get grouped for better mobile display -->
		  <div class="navbar-header nav_2">
		      <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">我的
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#"></a>
		   </div> 
		   <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
		        <ul class="nav navbar-nav nav_1">
		       		<li><a href="${pageContext.request.contextPath}/web/dateInfo">我的约会</a></li>
		            <li><a href="${pageContext.request.contextPath}/web/info">邀请记录</a></li>
		            <li><a href="about.html">留言信息</a></li>
		            <li class="last"><a href="contact.html">联系方式</a></li>
		        </ul>
		     </div><!-- /.navbar-collapse -->
		    </nav>
		   </div> <!-- end pull-right -->
          <div class="clearfix"> </div>
        </div> <!-- end container -->
      </div> <!-- end navbar-inner -->
    </div> <!-- end navbar-inverse-blue -->
<!-- ============================  Navigation End ============================ -->
<div class="banner">
  </div> 
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
        		<c:forEach items="${list}" var ="customer">
		      <li><div class="col_1"><a href="${pageContext.request.contextPath}/web/customer?id=${customer.id}">
				<img src="${pageContext.request.contextPath}/ring/images/p1.jpg" alt="" class="hover-animation image-zoom-in img-responsive"/>
	             <div class="layer m_1 hidden-link hover-animation delay1 fade-in">
	                <div class="center-middle">详细信息</div>
	             </div>
	             <h3><span class="m_3">无名指ID : MI-${customer.id}</span><br>${customer.birthday }, ${customer.industry }, ${customer.addtress }<br>${customer.declaration }</h3></a></div>
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
<div class="grid_2">
	<div class="container">
		<h2>成功案例</h2>
       	<div class="heart-divider">
			<span class="grey-line"></span>
			<i class="fa fa-heart pink-heart"></i>
			<i class="fa fa-heart grey-heart"></i>
			<span class="grey-line"></span>
        </div>
        <div class="row_1">
	     <div class="col-md-8 suceess_story">
	         <ul> 
	            <li>
				  	<div class="suceess_story-date">
						<span class="entry-1">Dec 20, 2015</span>
					</div>
					<div class="suceess_story-content-container">
						<figure class="suceess_story-content-featured-image">
						   <img width="75" height="75" src="images/13.jpg" class="img-responsive" alt=""/>				            
					    </figure>
						<div class="suceess_story-content-info">
				        	<h4><a href="#">张** & 李**</a></h4>				        	
				        	<p>每一段感情都是始于颜值,陷于才华,忠于人品,安于陪伴.<a href="#">更多...</a></p>
				        </div>
				    </div>
				</li>
				
	        </ul>
	    </div>
	     <div class="clearfix"> </div>
	   </div> 
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
    		<div class="col-md-2 col_2">
    			<h4>分享</h4>
    			<ul class="footer_social">
				  <li><a href="#"><i class="fa fa-facebook fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-twitter fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-google-plus fa1"> </i></a></li>
				  <li><a href="#"><i class="fa fa-youtube fa1"> </i></a></li>
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