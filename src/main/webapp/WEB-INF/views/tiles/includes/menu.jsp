<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="sidebar-scroll">
	<div class="sidebar-content">
		<div class="side-header side-content bg-white-op">
			<button class="btn btn-link text-gray pull-right hidden-md hidden-lg" type="button" data-toggle="layout"
				data-action="sidebar_close">
				<i class="fa fa-times"></i>
			</button>
			<div class="btn-group pull-right">
				<button class="btn btn-link text-gray dropdown-toggle" data-toggle="dropdown" type="button">
					<i class="si si-drop"></i>
				</button>
				<ul class="dropdown-menu dropdown-menu-right font-s13 sidebar-mini-hide">
					<li><a data-toggle="theme" data-theme="default" tabindex="-1" href="javascript:void(0)"> <i
							class="fa fa-circle text-default pull-right"></i> <span class="font-w600">Default</span>
					</a></li>
					<li><a data-toggle="theme" data-theme="assets/css/themes/amethyst.min-3.0.css" tabindex="-1"
						href="javascript:void(0)"> <i class="fa fa-circle text-amethyst pull-right"></i> <span class="font-w600">Amethyst</span>
					</a></li>
					<li><a data-toggle="theme" data-theme="assets/css/themes/city.min-3.0.css" tabindex="-1"
						href="javascript:void(0)"> <i class="fa fa-circle text-city pull-right"></i> <span class="font-w600">City</span>
					</a></li>
					<li><a data-toggle="theme" data-theme="assets/css/themes/flat.min-3.0.css" tabindex="-1"
						href="javascript:void(0)"> <i class="fa fa-circle text-flat pull-right"></i> <span class="font-w600">Flat</span>
					</a></li>
					<li><a data-toggle="theme" data-theme="assets/css/themes/modern.min-3.0.css" tabindex="-1"
						href="javascript:void(0)"> <i class="fa fa-circle text-modern pull-right"></i> <span class="font-w600">Modern</span>
					</a></li>
					<li><a data-toggle="theme" data-theme="assets/css/themes/smooth.min-3.0.css" tabindex="-1"
						href="javascript:void(0)"> <i class="fa fa-circle text-smooth pull-right"></i> <span class="font-w600">Smooth</span>
					</a></li>
				</ul>
			</div>
			<a class="h5 text-white" href="<c:url value="/"/>"><i class="fa fa-home text-primary"></i><span
				class="h4 font-w600 sidebar-mini-hide"></span></a>
		</div>
		<div class="side-content side-content-full">
			<ul class="nav-main">
				<li><a class="active" href="<c:url value="/"/>"><i class="fa fa-home"></i><span class="sidebar-mini-hide"><spring:message
								code="menu.dashboard" /></span></a></li>
				<li><a href="<c:url value="/introduce"/>"><i class="fa fa-info-circle"></i><span class="sidebar-mini-hide"><spring:message
								code="menu.about" /></span></a></li>
				<li><a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="fa fa-th-list"></i><span
						class="sidebar-mini-hide"><spring:message code="menu.product" /></span></a>
					<ul>
						<li><a href="<c:url value="/product?categoryId=1"/>">Ban công</a></li>
						<li><a href="<c:url value="/product?categoryId=2"/>">Cấu thang</a></li>
						<li><a href="<c:url value="/product?categoryId=3"/>">Mái kính</a></li>
						<li><a href="<c:url value="/product?categoryId=4"/>">Song hoa cửa sắt</a></li>
						<li><a href="<c:url value="/product?categoryId=5"/>">Hàng rào...</a></li>
					</ul></li>
				<li><a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="fa fa-tasks"></i><span
						class="sidebar-mini-hide"><spring:message code="menu.category" /></span></a>
					<ul>
						<li><a href="#">Pre-made</a></li>
						<li><a href="#">Elements</a></li>
						<li><a href="#">Pickers &amp; More</a></li>
						<li><a href="#">Text Editors</a></li>
						<li><a href="#">Validation</a></li>
						<li><a href="#">Wizard</a></li>
					</ul></li>
				<li><a href="<c:url value="/contact"/>"> <i class="si si-rocket"></i><span class="sidebar-mini-hide"><spring:message
								code="menu.contact" /></span>
				</a></li>
				<li><a class="nav-submenu" data-toggle="nav-submenu" href="#"><i class="fa fa-gears"></i><span
						class="sidebar-mini-hide"><spring:message code="menu.admin" /></span></a>
					<ul>
						<li><a href="<c:url value="/upload"/>"><i class="si si-cloud-upload"></i><span class="sidebar-mini-hide">Upload</span></a></li>
						<li><a href="<c:url value="/register"/>"><i class="fa fa-user-plus"></i><span class="sidebar-mini-hide">Register</span></a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
