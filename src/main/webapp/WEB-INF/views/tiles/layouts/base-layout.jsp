<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="pixelcave">
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
<meta name="description" content="Cơ Khí Mỹ Thuật - Tuệ An">

<!-- Icons -->
<!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
<link rel="shortcut icon" href="assets/img/favicons/favicon.png">

<tiles:importAttribute name="title" />
<title><spring:message code="${title}" /></title>

<!-- Stylesheets -->
<!-- Web fonts -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600,700%7COpen+Sans:300,400,400italic,600,700">

<!-- Page JS Plugins CSS go here -->
<link rel="stylesheet" href="assets/js/plugins/slick/slick.min.css">
<link rel="stylesheet" href="assets/js/plugins/slick/slick-theme.min.css">
<link rel="stylesheet" href="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="assets/js/plugins/magnific-popup/magnific-popup.min.css">
<link rel="stylesheet" href="assets/js/plugins/dropzonejs/dropzone.min.css">
<link rel="stylesheet" href="assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.css">
<link rel="stylesheet" href="assets/js/plugins/sweetalert/sweetalert.min.css">

<!-- Bootstrap and OneUI CSS framework -->
<link rel="stylesheet" href="assets/css/bootstrap.min-3.0.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" id="css-main" href="assets/css/oneui.min-3.3.css">
<!-- END Stylesheets -->

<!-- Back-to-top -->
<link rel="stylesheet" href="assets/css/back.top.css">
</head>
<body>
	<!-- Page Container -->
    <!-- <div id="page-container" class="sidebar-l sidebar-o side-scroll header-navbar-fixed"> --><!-- default show menu -->
	<div id="page-container" class="sidebar-l sidebar-mini sidebar-o side-scroll header-navbar-fixed"><!-- default hide menu -->
		<!-- default show -->
		<!-- Side Overlay-->
		<aside id="side-overlay">
			<!-- Side Overlay Scroll Container -->
			<div id="side-overlay-scroll"></div>
			<!-- END Side Overlay Scroll Container -->
		</aside>
		<!-- END Side Overlay -->

		<!-- Sidebar -->
		<nav id="sidebar">
			<tiles:insertAttribute name="menu" />
		</nav>
		<!-- END Sidebar -->

		<!-- Header -->
		<header id="header-navbar" class="content-mini content-mini-full" style="padding-bottom: 8px;">
			<tiles:insertAttribute name="header" />
		</header>
		<!-- END Header -->

		<!-- Main Container -->
		<main id="main-container">
		<div class="content bg-gray-lighter">
			<div class="row items-push">
				<div class="col-sm-4 hidden-xs">
					<ol class="breadcrumb push-10-t">
						<li>Trang chủ</li>
						<li><a class="link-effect" href="">Sản phẩm</a></li>
					</ol>
				</div>
			</div>
		</div>
		<div class="content">
			<tiles:insertAttribute name="body" />
		</div>
		</main>
		<!-- END Main Container -->

		<!-- Footer page -->
		<footer id="page-footer" class="content-mini content-mini-full font-s12 bg-gray-lighter clearfix">
			<tiles:insertAttribute name="footer" />
		</footer>

	</div>
	<!-- END Page Container -->

	<a href="#" class="scrollToTop"><span class="sr-only">Top</span></a>

	<!-- OneUI Core JS: jQuery, Bootstrap, slimScroll, scrollLock, Appear, CountTo, Placeholder, Cookie and App.js -->
	<script src="assets/js/oneui.min-3.3.js"></script>
	<script src="assets/js/plugins/chartjsv2/Chart.min.js"></script>
	<script src="assets/js/pages/base_pages_dashboard_v3.js"></script>


	<!-- Page JS Plugins + Page JS Code -->
	<!-- Page Plugins -->
	<script src="assets/js/plugins/slick/slick.min.js"></script>
	<script src="assets/js/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/plugins/magnific-popup/magnific-popup.min.js"></script>
	<script src="assets/js/plugins/dropzonejs/dropzone.min.js"></script>
	<script src="assets/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
	<script src="assets/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
	<script src="assets/js/plugins/sweetalert/sweetalert.min.js"></script>

	<!-- Back-to-top -->
	<script src="assets/js/back.top.js"></script>
	<!-- "Bootstrap's JavaScript requires jQuery version 1.9.1 or higher, but lower than version 4" -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->

	<!-- Page JS Code -->
	<script type="text/javascript">
		jQuery(function() {
			App.initHelpers([ 'table-tools', 'magnific-popup', 'slick',	'datepicker', 'datetimepicker', 'slimscroll', 'tags-inputs', 'notify' ]);
		});
	</script>
</body>
</html>