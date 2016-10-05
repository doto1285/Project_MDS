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


<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top"  role="navigation">
<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="http://localhost:8088/Project_MDS/main">Start Bootstrap</a>
	</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
		
		
			
			<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="/Project_MDS/main/loginfrom"  id = "padding-left_600px">로그인</a></li>
						<li><a href="/Project_MDS/main/joinform_choose">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#"  id = "padding-left_450px">${authUser.member_name }님 안녕하세요 ^^;</a></li>
						<li><a href="#">회원정보수정</a></li>
						<li><a href="/Project_MDS/main/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			
			
			
			
		</ul>
	</div>
	<!-- /.navbar-collapse -->
</div>
<!-- /.container --> </nav>