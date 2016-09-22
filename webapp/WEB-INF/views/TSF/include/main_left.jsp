<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>


<html>
<head>

</head>
<body data-spy="scroll">

	<c:choose>
		<c:when test='${empty authUser }'>
			<!-- 비회원일경우 표시되는 메뉴 -->
			<div class="section section-warning">
				<div class="container">
					<div class="col-md-2">
						<ol>
							<li>로그인을 하세용</li>
						</ol>
					</div>
				</div>
			</div>
		</c:when>


		<c:when test='${authUser.member_distinction == 0}'>
			<!-- 개인 회원일경우 표시되는 메뉴 -->
			<div class="section section-warning">
				<div class="container">
					<div class="col-md-2">
						<ol>
							<li><a href="#">구매/배송조회</a></li>
							<li><a href="#">환불 / 취소</a></li>
						</ol>
					</div>
				</div>
			</div>
		</c:when>


		<c:when test='${authUser.member_distinction == 1 }'>
			<!-- 기업 회원일경우 표시되는 메뉴 -->
			<div class="section section-warning">
				<div class="container">
					<div class="col-md-2">
						<ol>
							<li><a href="#">나의 쇼핑몰 만들기</a></li>
						</ol>
					</div>
				</div>
			</div>
		</c:when>
	</c:choose>

	<hr>
	<div class="section section-warning">
		<div class="container">
			<div class="hidden-md row">
				<div class="col-md-2">
					<ol>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">FAQ</a></li>
						<li><a href="#">Q&A</a></li>
					</ol>
				</div>
			</div>
		</div>
	</div>


</body>

</html>