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
<title>모두의 쇼핑몰</title>
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="section">
		<div class="container">
			<!-- 링크 : http://localhost:8088/Project_MDS/{domain}/boardlist/{boardlist_no} -->
			<!-- 본문 시작-------------------------------------------- -->

			<div class="col-md-9" id="margin50px">
				<center>
					<p class="lead">${GetBoard.boardlist_name }</P>
				</center>

				<form id="search_form" action="#" method="get">
					<center>
						<input type="text" id="kwd" name="kwd" value="${keyword }">
						<input type="submit" value="찾기">
					</center>
				</form>

				유저 유형 ${authUser.member_distinction } <br> 쓰기권한
				${GetBoard.boardlist_write_accessright } <br> 읽기권한
				${GetBoard.boardlist_read_accessright } <br>

				<table class="tbl-ex">
					<table class="table table-striped table-hover ">
						<tr>
							<th>번호 ${authUser.member_distinction}</th>
							<th>제목 ${GetBoard.boardlist_write_accessright }</th>
							<th>글쓴이${GetBoard.boardlist_read_accessright }</th>
							<th>조회수${authUser.member_no }</th>
							<th>작성일</th>
						</tr>


						<tbody>

							<c:forEach items="${map.GetBoardContentsList}"
								var="GetBoardContentsList">
								<tr>
									<!--글번호-->
									<td>${GetBoardContentsList.board_no}</td>
									<!-- -------------------- -->

									<!--제목-->


									<!-- -------------------- -->
									<c:choose>
										<c:when
											test='${authUser.member_distinction >= GetBoard.boardlist_read_accessright }'>
											<!-- 해당 게시판에 권한이 있는 사용자만 글 보기 링크를 제공한다  -->
											<td>
											<a href="view?board_no=${GetBoardContentsList.board_no}&boardlist_no=${GetBoardContentsList.boardlist_no}">
													<c:forEach var="i" begin="2"
														end="${GetBoardContentsList.board_depth}" step="1">
											 ↳ 
											</c:forEach> ${GetBoardContentsList.board_title}
											</a>
											</td>


										</c:when>
										<c:otherwise>
											<!-- 권한 없는 사용자일경우, 팝업 메세지를 띄운다 (script restrict)  -->
											<td class="restrict" style="cursor: pointer"><c:forEach
													var="i" begin="2" end="${GetBoardContentsList.board_depth}"
													step="1">
											 ↳ 
											</c:forEach> ${GetBoardContentsList.board_title}</td>
										</c:otherwise>
									</c:choose>
									<!-- -------------------- -->
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


				<c:if test="${empty map.GetBoardContentsList}">
					<div id="search">
						<div id="search_risk">
							<img src="/gs25/assets/images/customcenter/risk.png">
						</div>
						<p class="search_list-right">
							검색된 결과를 찾을 수 없습니다. <br>
						</p>
					</div>
				</c:if>

				<c:if test='${not empty map.GetBoardContentsList }'>
					<!-- begin:paging -->
					<div class="pager">
						<ul>

							<c:if test="${map.prevPage >= 0 }">
								<li><a
									href="boardlist?boardlist_no=${GetBoard.boardlist_no }&p=${map.prevPage }">◀</a></li>
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
										<li><a
											href="boardlist?boardlist_no=${GetBoard.boardlist_no }&p=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test='${map.nextPage > 0 }'>
								<li><a
									href="boardlist?boardlist_no=${GetBoard.boardlist_no }&p=${map.nextPage }">▶</a></li>
							</c:if>
						</ul>
					</div>
				</c:if>
				<!-- end:paging -->



				<c:choose>
					<c:when
						test='${authUser.member_distinction >= GetBoard.boardlist_write_accessright }'>
						<!-- 해당 게시판에 권한이 있는 사용자만 글쓰기 버튼 보여준다  -->

						<div class="text-right">
							<a href="writeform?boardlist_no=${GetBoard.boardlist_no }"
								class="btn btn-success">글쓰기</a>
						</div>


					</c:when>
					<c:otherwise>
						<!-- 권한이 없을 경우 표시하지 않음  -->
					</c:otherwise>
				</c:choose>
			</div>


			<!-- 본문 끝-------------------------------------------- -->
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>


<script>
	// 권한 없을때 이벤트 발생
	$(".restrict").on("click", function() {
		alert("권한이 없습니다");

	});
</script>
