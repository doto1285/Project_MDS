<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>


<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"><span>Brand</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">Home</a></li>



				<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="/Project_MDS/main/loginfrom">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#">${authUser.member_name }님 안녕하세요 ^^;</a></li>
						<li><a href="#">회원정보수정</a></li>
						<li><a href="/Project_MDS/main/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
	</div>
</div>