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

	<c:choose>
		<c:when test='${empty authUser }'>
			<!-- 비회원일경우 표시되는 화면  -->
			<p class="lead">아직 모두의 쇼핑몰 회원이 아니시군요?</p>
			<p>쇼핑몰을 만드시거나 이용하시려면</p>
			<p>모두의 쇼핑몰 로그인이 필요합니다.</p>
		</c:when>

		<c:when test='${authUser.member_distinction == 0}'>
			<!-- 개인 회원일경우 표시되는 화면  -->

			<p class="lead">내가 가입한 쇼핑몰</p>
			<br>
			<p>==================</p>
			<c:forEach items="${auth_MallList }" var="auth_MallList">
				<br>
				<a
					href="http://localhost:8088/Project_MDS/${auth_MallList.mall_domain }/main">${auth_MallList.mall_name }</a>
				<br>
			</c:forEach>
		</c:when>

		<c:when test='${authUser.member_distinction == 1 }'>
			<!-- 기업 회원일경우 표시되는 화면  -->

			<p class="lead">내가 개설한 쇼핑몰</p>
			<br>
			<p>==================</p>
			<c:forEach items="${auth_MallList }" var="auth_MallList">
				<br>
				<a
					href="http://localhost:8088/Project_MDS/${auth_MallList.mall_domain }/main">${auth_MallList.mall_name }</a>
				<br>
			</c:forEach>
		</c:when>

		<c:when test='${authUser.member_distinction == 9 }'>
			<!-- admin일경우 표시되는 화면  -->
			<p class="lead">admin 로그인</p>
		</c:when>
	</c:choose>

	<div class="container" style="text-align: center">
		<label id="joinText">모두의 쇼핑몰 회원이시군요</label> <br> <label
			id="joinText">개인정보 이용 동의 후 쇼핑몰 이용이 가능합니다!</label> <br> <br>
		<br> <br> <label id="joinText">개인정보 이용 동의</label> &nbsp;
		&nbsp; <label><input type="checkbox" id="joinCheckBox"></label>
		&nbsp; &nbsp; &nbsp; &nbsp;
		<button type="button" class="btn btn-default btn-sm">약관보기</button>
		<br> <br> <br> <br>
		<button type="button" class="btn btn-default btn-lg">가입하기</button>
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
	<br>
	<br>


	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>