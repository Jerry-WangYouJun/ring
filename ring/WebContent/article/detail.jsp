<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="assets/css/bootstrap.css" rel="stylesheet">
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/icons.css" rel="stylesheet">
<link href="assets/css/main.css" rel="stylesheet">
<link href="assets/css/animate.min.css" rel="stylesheet">
<link href="assets/css/owl.carousel.css" rel="stylesheet">
<link href="assets/css/responsive.css" rel="stylesheet">
<script src="assets/js/modernizr-2.8.3.min.js"></script>
<script src="assets/js/jquery-2.1.0.min.js"></script>
<script src="assets/js/jquery.magnific-popup.min.js"></script>
<script src="assets/js/gmap3.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/functions.js"></script>
<script src="assets/js/wow.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.ajaxchimp.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var dic = eval('(${dic})');
		var arr = dic.marriage;
		$(".dicValue").each(function() {
			var field = $(this).attr("name")
			var value = $(this).attr("value");
			if (dic[field][value] != undefined) {
				$(this).text(dic[field][value]["describ"]);
			}
		})
	});
	function addArticle() {
		window.location.href = "${pageContext.request.contextPath}/article/article.jsp";
	}

	function myArticle() {
		window.location.href = "${pageContext.request.contextPath}/article/myArticle";
	}

	function getArticle(state) {
		window.location.href = "${pageContext.request.contextPath}/article/index?state="
				+ state;
	}

	function detailArticle(id) {
		window.location.href = "${pageContext.request.contextPath}/article/detail?id="
				+ id;
	}
</script>
</head>
<body class="header-fixed-top">


	<div id="page-top" class="page-top"></div>
	<!-- /.page-top -->

	<section id="site-banner" class="site-banner text-center">
	<div class="container">
		<div class="site-logo ">
			<a href="./" class="pull-left"><img src="images/logo.png"
				style="width: 150px; height: auto" alt="Site Logo"></a>
		</div>
		<!-- /.site-logo -->
	</div>
	<!-- /.container --> </section>
	<!-- /#site-banner -->

	<section id="main-content" class="main-content blog-post-singgle-page">
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<div id="blog-post-content" class="blog-post-content">
					<article class="post type-post">
					<div class="post-top">
						<!-- /.post-thumbnail -->
						<div class="post-meta">
							<div class="entry-meta">
								<div class="author-avatar">
									<img src="images/author/1.jpg" alt="Author Image">
								</div>
								<!-- /.author-avatar -->
								<div class="entry-meta-content">
									<span class="author-name"> <a href="#">${article.author }</a>
									</span> <span class="entry-date"> <time datetime="2015-01-15">${article.articleDate }</time>
									</span>
								</div>
								<!-- /.meta-content -->
							</div>
							<!-- /.entry-meta -->
						</div>
						<!-- /.post-meta -->
					</div>
					<!-- /.post-top -->
					<div class="post-content">
						<h2 class="entry-title">${article.title }</h2>
						${article.editorValue }
					</div>
					<!-- /.post-content -->

					<div id="comments" class="comments">
						<div class="comments-area">
							<h3 class="comment-title">
								<span class="title-icon"><i class='st-book2'></i></span>阅读${article.articleRead }
							</h3>
							<h3 class="comment-title">
								<span class="title-icon"><i class='st-heart'></i></span>点赞${article.articleMark }
							</h3>
							<h3 class="comment-title">
								<span class="title-icon"><i class='st-email2'></i></span>转发${article.articleTransmit }
							</h3>
						</div>
						<!-- /.comment-area -->
					</div>
					<!-- /#comment --> </article>
				</div>
			</div>
			<div class="col-sm-4">
				<div id="blog-sidebar" class="blog-sidebar widget-area"
					role="complementary">
					<div class="sidebar-content">

						<aside class="widget widget_categories">
						<h3 class="widget-title">该作者其他文章</h3>
						<!-- /.widget-title -->

						<ul class="category-list">
							<c:forEach items="${articleList}" var="artName">
								<li><a href="###" onclick="detailArticle('${artName.id}')">${artName.title}(${artName.articleDate}) </a></li>
							</c:forEach>
						</ul>
						</aside>
						<!-- /.widget -->

						<aside class="widget widget_recent_entries">
						<h3 class="widget-title">其他文章</h3>
						<!-- /.widget-title -->
						<ul class="recent-post">
							<li>
								<div class="recent-post-details">
									<a class="post-title" href="##" onclick="getArticle('3')">精选</a><br>
								</div>
								<!-- /.recent-post-details -->
							</li>
							<li>
								<div class="recent-post-details">
									<a class="post-title" href="##"  onclick="getArticle('2')">美文</a><br>
								</div>
								<!-- /.recent-post-details -->
							</li>
							<li>
								<div class="recent-post-details">
									<a class="post-title" href="##"  onclick="getArticle('4')">置顶</a><br>
								</div>
								<!-- /.recent-post-details -->
							</li>
						</ul>
						<!-- /.recent-post --> </aside>
						<!-- /.widget -->

						<aside class="widget widget wp_widget_tag_cloud clearfix">
						<h3 class="widget-title">各种标签</h3>
						<!-- /.widget-title -->
						<div class="tag-cloud-wrapper">
							<a href="#">design</a> <a href="#">html5</a> <a href="#">css3</a>
							<a href="#">web-design</a> <a href="#">illustrator</a> <a
								href="#">Photoshop</a> <a href="#">ui/ux</a> <a href="#">js</a>
							<a href="#">icons</a> <a href="#">article</a> <a href="#">web</a>
							<a href="#">inDesign</a>
						</div>
						<!-- /.tag-cloud-wrapper --> </aside>
						<!-- /.widget -->

						<aside class="widget widget_archive">
						<h3 class="widget-title">不同时间文章</h3>
						<!-- /.widget-title -->
						<ul class="archive-list">
							<li><a href="#">April 2015 <span class="count">05</span></a>
							</li>
							<li><a href="#">March 2015 <span class="count">35</span></a>
							</li>
							<li><a href="#">February 2015 <span class="count">15</span></a>
							</li>
						</ul>
						</aside>
						<!-- /.widget -->


						<aside class="widget widget_rss">
						<h3 class="widget-title">
							<a class="rsswidget" href="#" title="Syndicate this content"><i
								class="rss-icon fa fa-rss"></i>其他</a>
						</h3>
						<ul>
							<li><a class="rsswidget" href="#">活动</a></li>
							<li><a class="rsswidget" href="#">约会</a></li>
							<li><a class="rsswidget" href="#">美文</a></li>
						</ul>
						</aside>
					</div>
					<!-- /.sidebar-content -->
				</div>
				<!-- /#sidebar -->
			</div>
		</div>
	</div>
	<!-- /.container --> </section>
	<!-- /#main-content -->

</body>
</html>