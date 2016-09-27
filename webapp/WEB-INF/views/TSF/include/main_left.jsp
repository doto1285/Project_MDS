<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Vertical jQuery Accordion Nav Menu</title>
<meta name="author" content="Jake Rocheleau">
<link rel="shortcut icon" href="http://vandelaydesign.com/favicon.ico">
<link rel="icon" href="http://vandelaydesign.com/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/Project_MDS/assets/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Merienda:400,700">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" language="javascript" charset="utf-8"
	src="/Project_MDS/assets/js/nav.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>

<body>
	<div id="w">
		<nav>
			<ul id="nav">

				<c:choose>
					<c:when test='distinction == 0}'>
						<!-- 개인 회원일경우 표시되는 메뉴  -->
						<li><a href="#">구매 / 배송조회</a></li>
						<li><a href="#">환불 / 취소</a></li>
					</c:when>


					<c:when test='${authUser.member_distinction == 1 }'>
						<!-- 기업 회원일경우 표시되는 메뉴  -->
						<li><a href="#">쇼핑몰 만들기</a></li>
					</c:when>

					<c:when test='${authUser.member_distinction == 9 }'>
						<!-- 기업 회원일경우 표시되는 메뉴  -->
						<li><a href="#"> admin 로그인</a></li>
					</c:when>

					<c:otherwise>
						<!-- 비회원일경우 표시되는 메뉴  -->
						<a href="/Project_MDS/main/loginfrom">로그인 하세요</a>
					</c:otherwise>

				</c:choose>



				<c:forEach items="${GetBoardList }" var="GetBoardList">
					<p><a href="http://localhost:8088/Project_MDS/main/board/${GetBoardList.boardlist_no } "
						class="btn btn-default">${GetBoardList.boardlist_name }</a></p>
				</c:forEach>
				
				
			</ul>




		</nav>
	</div>
</body>
</html>