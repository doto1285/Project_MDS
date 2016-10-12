<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div class="section" id="header">
		<div class="container">
			<div class="col-lg-4">
				<ul class="nav nav-pills">
					<!-- class="active" -->
					<li role="presentation"><a href="#">Notice&Events</a></li>
					<li role="presentation"><a href="#">고객센터</a></li>
				</ul>
			</div>
			<c:choose>
				<c:when test='${empty mallimgVoLogo }'>
					<div class="col-lg-3">
						<img id="logo" src="/Project_MDS/assets/image/logo.png"
							class="img-responsive" alt="Responsive image">
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-lg-3">
						<img id="logo" src="${mallimgVoLogo.mallimg_image }"
							class="img-responsive" alt="Responsive image">
					</div>
				</c:otherwise>
			</c:choose>


			<c:choose>
				<c:when test='${empty authUser }'>
					<div class="col-lg-2"></div>
					<div class="col-lg-3">
						<ul class="nav nav-pills">
							<!-- class="active" -->
							<li role="presentation"><a href="login">로그인</a></li>
							<li role="presentation"><a href="join">회원가입</a></li>
							<div class="row">
								<div class="col-lg-12">
									<form class="form-inline">
										<div class="form-group">
											<label for="inputEmail3" class="sr-only">Password</label> <input
												type="Email" class="form-control" id="inputEmail3"
												placeholder="SERACH">
										</div>
										<button type="submit" class="btn btn-default">검색</button>
									</form>
								</div>
							</div>
						</ul>
					</div>
				</c:when>

				<c:when test='${SPFauthUser.member_no == null}'>
					<div class="col-lg-2"></div>
					<div class="col-lg-3">
						<ul class="nav nav-pills">
							<!-- class="active" -->
							<li role="presentation"><a href="join">쇼핑몰 회원가입</a></li>
							<div class="row">
								<div class="col-lg-12">
									<form class="form-inline">
										<div class="form-group">
											<label for="inputEmail3" class="sr-only">Password</label> <input
												type="Email" class="form-control" id="inputEmail3"
												placeholder="SERACH">
										</div>
										<button type="submit" class="btn btn-default">검색</button>
									</form>
								</div>
							</div>
						</ul>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-lg-5">
						<ul class="nav nav-pills">
							<!-- class="active" -->
							<li role="presentation"><a href="logout">로그아웃</a></li>
							<li role="presentation"><a href="join">장바구니</a></li>
							<li role="presentation"><a href="login">주문배송조회</a></li>
							<li role="presentation"><a href="join">마이페이지</a></li>
							<div class="row">
								<div class="col-lg-12">
									<form class="form-inline">
										<div class="form-group">
											<label for="inputEmail3" class="sr-only">Password</label> <input
												type="Email" class="form-control" id="inputEmail3"
												placeholder="SERACH">
										</div>
										<button type="submit" class="btn btn-default">검색</button>
									</form>
								</div>
							</div>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>