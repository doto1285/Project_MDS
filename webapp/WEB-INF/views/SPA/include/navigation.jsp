<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(function() {
		$("#accordian h3").click(function() {
			$("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
		});
	})
</script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">

</head>

<body>
	<div class="col-lg-2">
		<a href="main"><img src="/Project_MDS/assets/image/logo.png"
			id="logoImage"></a>
		<div id="accordian">
			<ul>
				<li>
					<h3>
						<span class="icon-dashboard"></span>Dashboard
					</h3>
					<ul>
						<li><a href="#">Reports</a></li>
						<li><a href="#">Search</a></li>
						<li><a href="#">Graphs</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
					<h3>
						<span class="icon-tasks"></span>Tasks
					</h3>
					<ul>
						<li><a href="#">Today's tasks</a></li>
						<li><a href="#">Urgent</a></li>
						<li><a href="#">Overdues</a></li>
						<li><a href="#">Recurring</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
				<li>
					<h3>
						<span class="icon-calendar"></span>Calendar
					</h3>
					<ul>
						<li><a href="#">Team Calendar</a></li>
						<li><a href="#">Private Calendar</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
				<li>
					<h3>
						<span class="icon-heart"></span>Favourites
					</h3>
					<ul>
						<li><a href="#">Global favs</a></li>
						<li><a href="#">My favs</a></li>
						<li><a href="#">Team favs</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
			</ul>
		</div>


	</div>



	<!-- <div id="navigation">
	<h2><a href="main">메인으로</a></h2>
		<div class="accord_menu">
			<ul>
				<li class="outer_li">쇼핑몰관리
					<ul class="inner_li">
						<li><a href="mallinfo">쇼핑몰정보관리</a></li>
					</ul>
				</li>
				<li class="outer_li">카테고리관리
					<ul class="inner_li">
						<li><a href="category">카테고리정보관리</a></li>
					</ul>
				</li>
				<li class="outer_li">상품관리
					<ul class="inner_li">
						<li><a href="">상품 목록/검색</a></li>
					</ul>
				</li>
				<li class="outer_li">주문관리
					<ul class="inner_li">
						<li><a href="">주문목록/검색</a></li>
						<li><a href="">취소/교환/반품/환불</a></li>
					</ul>
				</li>
				<li class="outer_li">고객관리
					<ul class="inner_li">
						<li><a href="">고객목록/검색</a></li>
					</ul>
				</li>
				<li class="outer_li">고객센터
					<ul class="inner_li">
						<li><a href="">FAQ</a></li>
						<li><a href="">Q&A</a></li>
					</ul>
				</li>
			</ul>

		</div>

	</div>
 -->
</body>

</html>
