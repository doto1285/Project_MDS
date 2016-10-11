<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 쇼핑몰</title>
<!-- 공통 -->
<script type="text/javascript" src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet" type="text/css">
<!-- /공통 -->
<!-- 개인 -->
<link href="/Project_MDS/assets/css/SPA_member.css" rel="stylesheet" type="text/css">
<!-- /개인 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>FAQ 검색</h3>
		<form class="form-inline" method="get" action="">
			<div class="form-group" id="inputFormGroup">
				<input name="" type="text" class="form-control"
					id="inputBox" value=""> <input class="btn btn-info"
					type="submit" value="검색">
			</div>
		</form>
		<br>
		<h3>FAQ 목록</h3>
		<div class="col-lg-9">
			<table class="tbl-ex">
				<table class="table table-striped table-hover ">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>


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

			<c:choose>
				<c:when
					test='${authUser.member_distinction >= GetBoard.boardlist_write_accessright }'>
					<!-- 해당 게시판에 권한이 있는 사용자만 글쓰기 버튼 보여준다  -->

					<div class="text-right">
						<a href="writeform/${boardlist_no }" class="btn btn-info">글쓰기</a>
					</div>


				</c:when>
				<c:otherwise>
					<!-- 개인, 기업회원일 경우 글쓰기 버튼을 표시하지 않음  -->
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>