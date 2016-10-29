<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 공통 -->
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/css/TSA_admin_loginform.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>
<title>모두의 쇼핑몰</title>
<!-- /공통 -->
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="user">
	<div class="login-page">
		<div class="form">
			<form class="login-form" id="login-form" name="loginform"
				method="post" action="/Project_MDS/TSA/main/OnlyAdmin">
			<input type="radio" id="admin_radio" name="member_distinction"value="9" checked>
			<label for="admin_radio" id="radio_label">관리자 로그인</label>
				<input id="id" name="id" value="" type="text" placeholder="ID" /> 
				<input name="password"type="password" value="" placeholder="password" />
				<c:if test='${param.r == "fail" }'>
					<p>로그인이 실패 했습니다.</p>
				</c:if>
				<input type="submit" id="button" value="로그인">
				<p class="message">관리자 페이지로 일반 사용자는 로그인이 불가능합니다.</p>
			</form>
		</div>
	</div>
	</div>
	</div>
	</div>

</body>
</html>