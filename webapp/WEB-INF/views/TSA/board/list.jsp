<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<!--  -----------------CSS-----------------------------              -->

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets//css/TSA_main.css" rel="stylesheet"
	type="text/css">

<!--      ---------------------------------------------             -->

<!--      ---------------------------------------------             -->
<title>mysite</title>
<!--      ---------------------------------------------             -->

<meta http-equiv="content-type" content="text/html; charset=utf-8">

</head>

<!--      ---------------------------------------------             -->
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSA/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSA/include/header_tap.jsp' />
	</div>
	<!--      ---------------------------------------------             -->
	<!--   <div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
				<p>dddd</p>
			</div>
		</div>
		-->
	<!--      ---------------------------------------------             -->
	<div class="jumbotron" id="maincol">


		<center>
			<P>${GetBoard.boardlist_name }</P>
		</center>

		<form id="search_form" action="/mysite5/board" method="get">
			<input type="text" id="kwd" name="kwd" value="${keyword }"> <input
				type="submit" value="찾기">
		</form>


		<table class="tbl-ex">
			<table class="table table-striped table-hover ">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>

				<c:forEach items="${listBoard }" var="boardVo">
					<tr>
						<td>${boardVo.no}</td>
						<td><a href="view?no=${boardVo.no}">${boardVo.title}</a></td>
						<td>${boardVo.regDate}</td>
					</tr>
				</c:forEach>
				<tbody>
					<tr>
						<td>1</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>3</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>5</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>6</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>
					<tr>
						<td>7</td>
						<td>Column content</td>
						<td>Column content</td>
					</tr>

				</tbody>
			</table>
		</table>

		<c:choose>
			<c:when
				test='${authUser.member_distinction } >= ${GetBoard.boardlist_write_accessright }'>
				<!-- admin만 글쓰기 버튼 보여준다  -->

				<div class="bottom">
					<a href="notice/writeform" id="new-book">글쓰기</a>
				</div>
			</c:when>
			<c:otherwise>
				<!-- 개인, 기업회원일 경우 글쓰기 버튼을 표시하지 않음  -->
			</c:otherwise>
		</c:choose>