<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div>
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>


	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3" id="margin50px">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>

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

							<c:forEach items="${map.GetBoardContentsList}" var="GetBoardContentsList">
								<tr>
									<!--글번호-->
									<td>${GetBoardContentsList.board_no}</td>
									<!--제목-->
									<td><a href="view?no=${GetBoardContentsList.board_no}">
									<c:forEach var="i" begin="2"
											end="${GetBoardContentsList.board_depth}" step="1">
											 ↳ 
											</c:forEach> 
									${GetBoardContentsList.board_title}</a>
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
				
				
						<c:if test="${empty map.list}">
							<div id="search">
								<p class="search_list-right">
									등록된 게시글이 없습니다.<br>
								</p>
							</div>
						</c:if>
				
				
						<!-- begin:paging -->
						<c:if test='${not empty map.list }'>
				<div class="pager">
					<ul>

						<c:if test="${map.prevPage >= 0 }">
							<li><a href="/Project_MDS/main/board/${GetBoard.boardlist_no }?p=${map.prevPage }">◀</a></li>
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
									<li><a href="/Project_MDS/main/board/${GetBoard.boardlist_no }?p=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test='${map.nextPage > 0 }'>
							<li><a href="/Project_MDS/main/board/${GetBoard.boardlist_no }?p=${map.nextPage }">▶</a></li>
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
							<a href="writeform/${boardlist_no }" class="btn btn-success">글쓰기</a>
						</div>


					</c:when>
					<c:otherwise>
						<!-- 개인, 기업회원일 경우 글쓰기 버튼을 표시하지 않음  -->
					</c:otherwise>
				</c:choose>
			</div>
	

			<!-- 본문 끝-------------------------------------------- -->

		</div>

	</div>
	<!-- /.container -->



	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>


