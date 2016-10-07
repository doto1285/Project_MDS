<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>

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
			<a class="navbar-brand" id="logo"
				href="http://localhost:8088/Project_MDS/TSA/main/slrkdurlfdkfdktjanjgkrpdy">
				<img src="/Project_MDS/assets/image/logo.png" id="img01">
			</a>

			<c:choose>
				<c:when test='${empty authUser }'>
					<a href="http://localhost:8088/Project_MDS/main/loginfromadmin"
						class="navbar-brand" id="admin_login">관리자 로그인</a>
				</c:when>
				<c:otherwise>
					<a href="#" span class="navbar-brand" id="user_hi">${authUser.member_name }님
						안녕하세요 ^^;</span>
					</a>
					<a href="/Project_MDS/TSA/main/logout" class="navbar-brand"
						id="admin_logout"><strong>로그아웃</strong></strong></a>
				</c:otherwise>
			</c:choose>



		</div>
	</div>
</body>

</html>