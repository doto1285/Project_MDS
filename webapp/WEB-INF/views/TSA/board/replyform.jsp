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

				<div id="container">
					<div id="content">
						<div id="board">
							<form class="board-form" method="post"
								action="/Project_MDS/main/board/reply/${boardlist_no}">
								<input type="hidden" name="a" value="write"> <br> <input
									type="hidden" name="member_no" value="${authUser.member_no }">
									 <input
									type="text" name="boardlist_no" value="${GetBoardContent.boardlist_no}">
									
							
								<input type="text" name="board_group" value="${GetBoardContent.board_group }"><br>
								<input type="text" name="board_orderno" value="${GetBoardContent.board_orderno }"><br>
								<input type="text" name="board_depth" value="${GetBoardContent.board_depth }"><br>

								<table class="tbl-ex">
									<tr>
										<th colspan="2">글쓰기</th>
									</tr>
									<tr>
										<td class=>제목</td>
										<td><input type="text" name="board_title" value=""></td>
									</tr>
									<tr>
										<td class=>내용</td>
										<td><textarea id="content" name="board_content"></textarea></td>
									</tr>

									<tr>
										<td class=>비밀번호</td>
										<td><textarea id="text" name="board_password"></textarea></td>
									</tr>

								</table>

								<div class="bottom">
									<a href="javascript:history.back(-1);">취소</a> <input type="submit"
										value="등록">
								</div>
							</form>
						</div>
					</div>
				</div>
	

		
	</div>
<!--      ---------------------------------------------             -->
</body>
</html>