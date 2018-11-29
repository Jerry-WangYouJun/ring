<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	 function addArticle(){
		 window.location.href="${pageContext.request.contextPath}/article/article.jsp" ;
	 }
</script>
</head>
<body class="header-fixed-top">
	<section>
	<div class="search-page">
		<!-- Start .search-page -->
		<div class="col-lg-12 mt5 mb5 " >
			<form class="form-inline search-page-form">
					<div class="input-group pull-right">
						<input type="text" class="form-control" value="搜索文章"
							placeholder="search here ..."> <span
							class="input-group-btn">
							<button type="submit" class="btn btn-primary">
								<i class="ec-search s16"></i>
							</button>
						</span>
					</div>
			</form>
		</div>
	</div>
	</section>
	<section>
	<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6" style="margin: 0 5">
		<div class="tile-stats b brall mb5 teal-bg">
			<a href="###" onclick="addArticle()">
				<div class="tile-stats-icon">
					<i class="st-pencil color-white"></i>
				</div>
				<div class="tile-stats-content">
					<div class="tile-stats-number color-white">写文章</div>
					<div class="tile-stats-text color-white"></div>
				</div>
				<div class="clearfix"></div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6" style="margin: 0 5">
		<div class="tile-stats b brall mb5 gray-bg">
			<a href="#">
				<div class="tile-stats-icon">
					<i class="st-book2 color-white"></i>
				</div>
				<div class="tile-stats-content">
					<div class="tile-stats-number color-white">文海</div>
					<div class="tile-stats-text color-white"></div>
				</div>
				<div class="clearfix"></div>
			</a>
		</div>
	</div>

	<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6" style="margin: 0 5">
		<div class="tile-stats b brall mb5 dark-bg">
			<a href="#">
				<div class="tile-stats-icon">
					<i class="st-cube color-white"></i>
				</div>
				<div class="tile-stats-content">
					<div class="tile-stats-number color-white">历史精选</div>
					<div class="tile-stats-text color-white"></div>
				</div>
				<div class="clearfix"></div>
			</a>
		</div>
	</div>
	<div class="col-lg-3 col-md-4 col-sm-6 col-xs-6" style="margin: 0 5">
		<div class="tile-stats b brall mb5 green-bg">
			<a href="#">
				<div class="tile-stats-icon">
					<i class="st-star color-white"></i>
				</div>
				<div class="tile-stats-content">
					<div class="tile-stats-number color-white">文章推荐</div>
					<div class="tile-stats-text color-white"></div>
				</div>
				<div class="clearfix"></div>
			</a>
		</div>
	</div>
	</section>

	<section id="latest-post" class="latest-post">
	<div class="container">
		<div class="post-area">
			<div class="post-area-top text-center">
				<h2 class="">精选文章</h2>
				<p class="title-description">Vestibulum auctor dapibus nequ待定。</p>
			</div>
			<!-- /.post-area-top -->

			<div class="row">
				<div class="latest-posts">
					<div class="col-sm-6">
						<div class="item">
							<article class="post type-post">
							<div class="post-top">
								<div class="post-thumbnail">
									<img src="images/blog/1.jpg" alt="post Image">
								</div>
								<!-- /.post-thumbnail -->
								<div class="post-meta">
									<div class="entry-meta">
										<span class="entry-date"> <time datetime="2015-01-15">15
											Jan 2015</time>
										</span> <span class="author-name"> <a href="#">John Doe</a>
										</span> <span class="post-tags">
											<ul class="tag-list">
												<li><a href="#">web-design</a></li>
												<li><a href="#">html5</a></li>
												<li><a href="#">css3</a></li>
											</ul>
										</span>
									</div>
									<!-- /.entry-meta -->
								</div>
								<!-- /.post-meta -->
							</div>
							<!-- /.post-top -->
							<div class="post-content">
								<h2 class="entry-title">
									<a href="blog-single.html">Standard Blog post Title</a>
								</h2>
								<p class="entry-text">Class aptent taciti sociosqu ad litora
									torquent per conubia nostra, per inceptos himenaeos. Mauris in
									erat justo. Nullam ac urna eu felis dapibus condimentum sit
									amet a augue. Sed non neque elit. Sed ut imperdiet nisi. Proin
									condimentum fermentum nunc. Etiam pharetra, erat sed fermentum
									feugiat, velit mauris egestas quam, ut aliquam massa nisl quis
									neque. Suspendisse in orci enim.</p>
								<a class="btn" href="#"> <span class="btn-icon"><i
										class="fa fa-arrow-circle-right"></i></span> Read More
								</a>
							</div>
							<!-- /.post-content --> </article>
						</div>
						<!-- /.item -->
					</div>
					<div class="col-sm-6">
						<div class="item">
							<article class="post type-post">
							<div class="post-top">
								<div class="post-thumbnail">
									<img src="images/blog/2.jpg" alt="post Image">
								</div>
								<!-- /.post-thumbnail -->
								<div class="post-meta">
									<div class="entry-meta">
										<span class="entry-date"> <time datetime="2015-01-15">15
											Jan 2015</time>
										</span> <span class="author-name"> <a href="#">John Doe</a>
										</span> <span class="post-tags">
											<ul class="tag-list">
												<li><a href="#">web-design</a></li>
												<li><a href="#">html5</a></li>
												<li><a href="#">css3</a></li>
											</ul>
										</span>
									</div>
									<!-- /.entry-meta -->
								</div>
								<!-- /.post-meta -->
							</div>
							<!-- /.post-top -->
							<div class="post-content">
								<h2 class="entry-title">
									<a href="blog-single.html">Standard Blog post Title</a>
								</h2>
								<p class="entry-text">Class aptent taciti sociosqu ad litora
									torquent per conubia nostra, per inceptos himenaeos. Mauris in
									erat justo. Nullam ac urna eu felis dapibus condimentum sit
									amet a augue. Sed non neque elit. Sed ut imperdiet nisi. Proin
									condimentum fermentum nunc. Etiam pharetra, erat sed fermentum
									feugiat, velit mauris egestas quam, ut aliquam massa nisl quis
									neque. Suspendisse in orci enim.</p>
								<a class="btn" href="#"> <span class="btn-icon"><i
										class="fa fa-arrow-circle-right"></i></span> Read More
								</a>
							</div>
							<!-- /.post-content --> </article>
						</div>
						<!-- /.item -->
					</div>
				</div>
				<!-- /.latest-posts -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.post-area -->
	</div>
	<!-- /.container --> </section>

</body>
</html>