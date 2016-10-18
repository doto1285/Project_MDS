<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->


<link href="/Project_MDS/assets/css/TSF_board.css" rel="stylesheet"
	type="text/css">
	
	
<title>모두의 쇼핑몰</title>
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="section">
		<div class="container">
			<!-- 본문 시작 -->
			<!-- 링크 : http://localhost:8088/Project_MDS/{domain}/write/{boardlist_no} -->
			
				<div id="container">
					<div id="content">
						<div id="board">
							<form class="board-form" method="post"
							
								action="write?boardlist_no=${boardlist_no}">
								<input type="hidden" name="a" value="write"> <br> <input
									type="hidden" name="member_no" value="${authUser.member_no }">
									 <input
									type="hidden" name="boardlist_no" value="${boardlist_no}">
			
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

			<!-- 본문 끝 -->
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>