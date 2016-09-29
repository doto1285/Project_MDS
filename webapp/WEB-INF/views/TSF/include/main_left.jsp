<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">

</head>

<p class="lead">마이페이지</p>
<div class="list-group">



	<c:choose>
		<c:when test='${authUser.member_distinction == 0}'>
			<!-- 개인 회원일경우 표시되는 메뉴  -->
			<a href="#" class="list-group-item">구매 / 배송조회</a>
			<a href="#" class="list-group-item">환불 / 취소</a>
		</c:when>


		<c:when test='${authUser.member_distinction == 1 }'>
			<!-- 기업 회원일경우 표시되는 메뉴  -->
			<a href="/Project_MDS/main/join_mall" class="list-group-item">쇼핑몰
				만들기</a>
		</c:when>

		<c:when test='${authUser.member_distinction == 9 }'>
			<!-- admin일경우 표시되는 메뉴  -->
			<a href="#" class="list-group-item"> admin 로그인</a>
		</c:when>

		<c:otherwise>
			<!-- 비회원일경우 표시되는 메뉴  -->
			<a href="/Project_MDS/main/loginfrom" class="list-group-item">로그인
				하세요</a>
		</c:otherwise>

	</c:choose>

</div>

<p class="lead">고객 센터</p>
<div class="list-group">
	<c:forEach items="${GetBoardList }" var="GetBoardList">
		<a
			href="http://localhost:8088/Project_MDS/main/board/${GetBoardList.boardlist_no } "
			class="list-group-item"> ${GetBoardList.boardlist_name }</a>

	</c:forEach>






</div>