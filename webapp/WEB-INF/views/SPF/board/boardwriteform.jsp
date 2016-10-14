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

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="section">
		<div class="container">
			<!-- 본문 시작 -->
			<!-- 링크 : http://localhost:8088/Project_MDS/{domain}/write/{boardlist_no} -->
			<!-- 본문 끝 -->
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>