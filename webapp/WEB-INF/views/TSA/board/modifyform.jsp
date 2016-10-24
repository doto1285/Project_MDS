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
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- /공통 -->
<!-- Custom CSS -->
<link href="/Project_MDS/assets/css/TSA_main.css" rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSA_board.css" rel="stylesheet" type="text/css">

<title>모두의 쇼핑몰</title>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSA/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSA/include/header_tap.jsp' />
	</div>
	<!--      ---------------------------------------------             -->
	<div class="jumbotron" id="maincol">
		<!-- Page Content -->
		<div id="board">

			<form class="board-form" method="post"
				action="/Project_MDS/TSA/main/board/modify?no=${GetBoardContent.board_no}">
				<input type="hidden" name="a" value="write"> <br> <input
					type="text" name="member_no" value="${authUser.member_no }">
				<input type="hidden" name="boardlist_no"
					value="${GetBoardContent.board_no}">

				<table class="tbl-ex">
					<tr>
						<th colspan="2">글쓰기 ${boardlist_no }</th>
					</tr>
					<tr>
						<td class=>제목</td>
						<td><input type="text" name="board_title"
							value="${GetBoardContent.board_title }"></td>
					</tr>
					<tr>
						<td class=>내용</td>
						<td><textarea id="content" name="board_content"> ${GetBoardContent.board_content }  </textarea></td>
					</tr>

					<tr>
						<td class=>비밀번호</td>
						<td><input type="password" name="board_password"
							value="${GetBoardContent.board_password }">
						<td>
					</tr>

				</table>

				<div class="bottom">
					<a href="javascript:history.back(-1);">취소</a> <input type="submit"
						value="수정">
				</div>
			</form>
		</div>
	</div>
	<!-- 본문 끝-------------------------------------------- -->
	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>

</html>



