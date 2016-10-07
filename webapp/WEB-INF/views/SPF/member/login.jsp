<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPF_member.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container" style="text-align: center">
		<label id="joinText">아직 회원이 아니십니까?</label> <br> <label
			id="joinText">회원을 위한 다양한 혜택이 준비되어 있습니다.</label> <br> <br> <br>
		<br>
		<div id="loginForm">
			<form class="form-inline" method="post" action="loginCheck">
				<div class="form-group">
					<label for="exampleInputName2" id="loginTextId">아이디 &nbsp;
						&nbsp;</label> <input type="text" class="form-control" name="id"
						id="exampleInputName2" placeholder="아이디">
				</div>
				<br> <br>
				<div class="form-group" id="passwordForm">
					<label for="exampleInputPassword3" id="loginTextPassword">비밀번호
						&nbsp; &nbsp;</label> <input type="password" class="form-control"
						name="password" id="exampleInputPassword3" placeholder="비밀번호">
				</div>

				<button id="loginButton" type="submit"
					class="btn btn-default btn-lg">로그인</button>
			</form>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
		<div id="loginFormBottomLabel">
			<label id="loginText"><a href="">아이디 찾기</a></label> <label
				id="loginText">&nbsp;|&nbsp;</label> <label id="loginText"><a
				href="">비밀번호 찾기</a></label> <label id="loginText">&nbsp;|&nbsp;</label> <label
				id="loginText"><a href="./join">회원가입</a></label>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>