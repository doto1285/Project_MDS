<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>

<head>

<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets//css/TSA_main.css" rel="stylesheet"
	type="text/css">

</head>

<body>
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" id="logo" z
				href="http://localhost:8088/Project_MDS/main">logo</a>

			<c:choose>
				<c:when test='${empty authUser }'>
					<a href="/Project_MDS/main/admin_loginform"
						class="navbar-brand btn btn-danger" id="admin_login">관리자 로그인</a>
				</c:when>
				<c:otherwise>
					<li><a href="#">${authUser.member_name }님 안녕하세요 ^^;</a></li>
					<li><a href="#">회원정보수정</a></li>
					<li><a href="/Project_MDS/main/logout">로그아웃</a></li>
				</c:otherwise>
			</c:choose>



		</div>
	</div>
</body>

</html>