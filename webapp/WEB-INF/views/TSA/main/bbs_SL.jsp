<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<link href="/Project_MDS/assets/css/vGraph.css" rel="stylesheet"
	type="text/css">
<title>모두의 쇼핑몰</title>
</head>

<!--      ---------------------------------------------             -->
<div id="header">
	<c:import url='/WEB-INF/views/TSA/include/header_top.jsp' />
	<c:import url='/WEB-INF/views/TSA/include/header_tap.jsp' />
</div>
<!--      ---------------------------------------------             -->
<body>
</head>
<body>
	<div class="vGraph">
		<ul>
			<li>
			<span class="gLastTerm">LAST SUN</span>
			<span class="gTerm">SUN</span>
			<span class="gLastBar" style="height: 0%"><span>0%</span></span>
			<span class="gBar" style="height: 0%"><span>0%</span></span>
			</li>
		</ul>
	</div>
	<!--      ---------------------------------------------             -->
</body>
</html>