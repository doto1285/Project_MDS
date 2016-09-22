<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======

<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>


<html>
<head>
>>>>>>> 6232302385920d31315819668b20efa955175bca

<!doctype html>
<html lang="utf-8">
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <title>Vertical jQuery Accordion Nav Menu</title>
  <meta name="author" content="Jake Rocheleau">
  <link rel="shortcut icon" href="http://vandelaydesign.com/favicon.ico">
  <link rel="icon" href="http://vandelaydesign.com/favicon.ico">
  <link rel="stylesheet" type="text/css" href="/Project_MDS/assets/css/styles.css">
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Merienda:400,700">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
  <script type="text/javascript" language="javascript" charset="utf-8" src="/Project_MDS/assets/js/nav.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>
<<<<<<< HEAD
=======
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

>>>>>>> 6232302385920d31315819668b20efa955175bca

<body>
  <div id="w">
     <nav>
      <ul id="nav">
        <p>나의쇼핑몰 관리</p>
        <li><a href="#">나의 쇼핑몰 만들기</a></li>
        <p>고객센터</p>
        <li><a href="">공지사항</a></li>
        <li><a href="">FAQ</a></li>
        <li><a href="">Q & A</a></li>
          </ul>
       
        
    </nav>
  </div>
</body>
</html>