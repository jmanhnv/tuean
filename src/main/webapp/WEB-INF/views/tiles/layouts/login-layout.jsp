<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html>
<html class="no-focus" lang="en">
<head>
<meta charset="utf-8">
<meta name="author" content="pixelcave">
<meta name="robots" content="noindex, nofollow">
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
<meta name="description" content="Cơ Khí Mỹ Thuật - Tuệ An">

<tiles:importAttribute name="title" />
<title><spring:message code="${title}" /></title>

<link rel="shortcut icon" href="assets/img/favicons/favicon.png">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,600,700%7COpen+Sans:300,400,400italic,600,700">
<link rel="stylesheet" href="assets/css/bootstrap.min-3.0.css">
<link rel="stylesheet" id="css-main" href="assets/css/oneui.min-3.3.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
</head>
<body>
	<!-- Page Container -->
	<tiles:insertAttribute name="body" />
	<!-- END Page Container -->

	<script src="assets/js/oneui.min-3.3.js"></script>
	<script src="assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
	<script src="assets/js/pages/base_pages_login.js"></script>

	<!-- "Bootstrap's JavaScript requires jQuery version 1.9.1 or higher, but lower than version 4" -->
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
</body>
</html>