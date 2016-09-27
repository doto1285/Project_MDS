<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link href="/Project_MDS/assets/css/board.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/styles.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
</head>
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>
	<div id="wrapper">
		<div id="content">
			<nav id="nav">
			<div id="extra">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>
			</nav>
			<div>
				<nav id="nav1"> 
				<!-- -------------------------------- -->
				
				

				<center>
					<P>공지사항</P>
				</center>

				<form id="search_form" action="/mysite5/board" method="get">
					<input type="text" id="kwd" name="kwd" value="${keyword }">
					<input type="submit" value="찾기">
				</form>


				<table class="tbl-ex">
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

				</table>

				
				
				 <c:choose>
					<c:when test='${authUser.member_distinction == 9}'>
						<!-- admin만 글쓰기 버튼 보여준다  -->

						<div class="bottom">
							<a href="notice/write" id="new-book">글쓰기</a>
						</div>
					</c:when>

					<c:otherwise>
						<!-- 개인, 기업회원일 경우 글쓰기 버튼을 표시하지 않음  -->
					</c:otherwise>
				</c:choose>
				 <!-- -------------------------------- --> 
				 </nav>
			</div>
			<nav id="nav2">
			<div id="navigation">
				<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />

			</div>
			</nav>
		</div>
	</div>


	<div id="footer">
		<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
	</div>
</body>
</html>