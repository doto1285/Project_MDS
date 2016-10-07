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
			<!-- 본문 시작-------------------------------------------- -->

			<div id="content">
				<div id="board" class="board-form" id="margin50px">
					<table class="tbl-ex" id="margin50px">
						<tr>
							<th colspan="2">글보기</th>
						</tr>
						<tr>
							<td>제목</td>
							<td>${GetBoardContent.board_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<div class="view-content">${GetBoardContent.board_content}</div>
							</td>
						</tr>

					</table>
					<div class="bottom">
						<a href="replyform/${GetBoardContent.board_no }">답글</a> <a
							href="javascript:history.back(-1);">목록</a> <a
							href="modify?no=${GetBoardContent.board_no }">글수정</a> <a
							href="delete?no=${GetBoardContent.board_no }">삭제</a>
					</div>
				</div>
			</div>

			<!-- 본문 끝-------------------------------------------- -->

		</div>

	</div>
		
	</div>
<!--      ---------------------------------------------             -->
</body>
</html>