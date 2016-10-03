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
<link href="/Project_MDS/assets/css/TSA_main.css" rel="stylesheet"
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
			<P id="notice_p">공지사항</P>
		</center>

		<form id="search_form" action="Project_MDS/main/" method="get">
			<input type="text" id="kwd" name="kwd" value="${keyword }"> <input
				type="submit" value="찾기">
		</form>

		<table class="table table-striped table-hover " id="table_notice">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
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

				<c:forEach items="${GetBoardContentsList }"
					var="GetBoardContentsList">
					<tr>
						<!--글번호-->
						<td>${GetBoardContentsList.board_no}</td>
						<!--제목-->
						<td><a href="view?no=${GetBoardContentsList.board_no}">${GetBoardContentsList.board_title}</a></td>
						<!--글쓴이  -->
						<td>${GetBoardContentsList.name}</td>
						<!--조회수  -->
						<td>${GetBoardContentsList.board_hit}</td>
						<!--작성일  -->
						<td>${GetBoardContentsList.board_date}</td>
					</tr>
				</c:forEach>


			</tbody>
		</table>
		</table>



		<div class="bottom">
			<c:choose>
				<c:when test='${authUser.member_distinction == 9}'>
					<!-- admin만 글쓰기 버튼 보여준다  -->

					<a href="#" class="btn btn-primary" id="write">글쓰기</a>
		</div>
		</c:when>
		</c:choose>
		<!-- -------------------------------- -->
		</nav>
	</div>

	</div>
	<!--      ---------------------------------------------             -->
</body>
</html>