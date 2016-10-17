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
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets//css/TSA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<!--      ---------------------------------------------             -->
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSA/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSA/include/header_tap.jsp' />
	</div>

	<div class="jumbotron" id="maincol">
		<nav id="navline">
		<center>
		<br>
			<P id="center_p">고객센터</P>
			<br>
			<a href="/Project_MDS/TSA/main/board/2" class="btn btn-default" id="serv_button">FAQ</a>
			<br>
			<br>
			<a href="/Project_MDS/TSA/main/board/3" class="btn btn-default" id="serv_button">QNA</a>
		</center>
			</nav>
		<center>
			<P>${GetBoard.boardlist_name }</P>
		</center>

		<form id="search_form" action="/mysite5/board" method="get">
			<input type="text" id="kwd" name="kwd" value="${keyword }"> <input
				type="submit" value="찾기">
		</form>


		<table class="table table-striped table-hover ">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>


						<tbody>

							<c:forEach items="${map.GetBoardContentsList}" var="GetBoardContentsList">
								<tr>
									<!--글번호-->
									<td>${GetBoardContentsList.board_no}</td>
									<!--제목-->
									<td><c:forEach var="i" begin="2"
											end="${GetBoardContentsList.board_depth}" step="1">
						 ↳ 
						</c:forEach> <a href="view?no=${GetBoardContentsList.board_no}">${GetBoardContentsList.board_title}</a>
									</td>
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
						<!-- begin:paging -->
				<div class="pager">
					<ul>

						<c:if test="${map.prevPage >= 0 }">
							<li><a href="/Project_MDS/TSA/main/board/${GetBoard.boardlist_no }?p=${map.prevPage }">◀</a></li>
						</c:if>

						<c:forEach begin='${map.firstPage }' end='${map.lastPage }'
							step='1' var='i'>
							<c:choose>
								<c:when test='${map.currentPage == i }'>
									<li class="selected">${i }</li>
								</c:when>
								<c:when test='${i > map.pageCount }'>
									<li>${i }</li>
								</c:when>
								<c:otherwise>
									<li><a href="/Project_MDS/TSA/main/board/${GetBoard.boardlist_no }?p=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test='${map.nextPage > 0 }'>
							<li><a href="/Project_MDS/TSA/main/board/${GetBoard.boardlist_no }?p=${map.nextPage }">▶</a></li>
						</c:if>
					</ul>
				</div>
			<!-- end:paging -->
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
		</div>


	<!--      ---------------------------------------------             -->
</body>
</html>