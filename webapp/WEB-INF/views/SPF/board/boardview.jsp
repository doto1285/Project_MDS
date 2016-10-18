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
			<!-- 링크 : http://localhost:8088/Project_MDS/{domain}/view/{boardlist_no} -->

			<div id="content">
				<div id="board" class="board-form" id="margin50px">
					<table class="tbl-ex" id="margin50px">
						<tr>
							<th colspan="2">글보기 ${authUser.member_distinction }, ${GetBoard.boardlist_write_accessright }, ${SPFauthUser.member_no } </th>
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
						<!-- ---------------- -->
						<c:choose>
							<c:when
								test='${authUser.member_distinction >= GetBoard.boardlist_write_accessright && SPFauthUser.member_no != null}'>
								<!-- 권한 있을때만 답글달기 버튼 표시  -->
								<td><a
									href="replyform?board_no=${GetBoardContent.board_no }">답글</a></td>

							</c:when>
							<c:otherwise>
								<!-- 권한이 없을 경우 답글달기 버튼을 표시하지 않음 -->
							</c:otherwise>
						</c:choose>

						<!-- ---------------- -->

						<a href="javascript:history.back(-1);">목록</a> <a
							href="modify?no=${GetBoardContent.board_no }">글수정</a> <a
							href="delete?no=${GetBoardContent.board_no }">삭제</a>
					</div>
				</div>
			</div>


			<!-- 본문 끝 -->
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>