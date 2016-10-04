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
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
	<title>모두의 쇼핑몰</title>
</head>
<body>
	<div class="section"  id="header">
		<div class="container">
			<div class="col-lg-4">
				<ul class="nav nav-pills">
					<!-- class="active" -->
					<li role="presentation"><a href="#">Notice&Events</a></li>
					<li role="presentation"><a href="#">고객센터</a></li>
				</ul>
			</div>
			<div class="col-lg-3">
				<img id="logo" src="/Project_MDS/assets/image/logo.png" class="img-responsive"
					alt="Responsive image">
			</div>
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
		</div>
	</div>
</body>
</html>