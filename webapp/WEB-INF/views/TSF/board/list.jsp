<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="utf-8">

<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">


<link href="/Project_MDS/assets/css/mycss.css" rel="stylesheet"
	type="text/css">


<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

</head>
<body data-spy="scroll">

	<div id="header">
		<div id="container">
			<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
			<c:import url='/WEB-INF/views/TSF/include/header_search.jsp' />
			<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
		</div>
	</div>
	<div id="wrapper">
		<div id="content">
			<p>로그인 안했을때</p>
		</div>
	</div>
	<div id="navigation">
		<p>
			<strong>오른쪽</strong>
	</div>
	<div id="extra">
		<p>왼쪽</p>
	</div>
	<div id="footer">
		<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
	</div>





	<!-- ------------------------------------------------------------------------ -->



	<div class="row">
		<div class="col-md-2">
			<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
		</div>
		<div class="col-md-6">

			<!-- 본문 부분 ------------------------------------------------------------------------ -->
	<div id="content">
			<div id="board">
				<form id="search_form" action="/mysite_jstl/board" method="get">
					<input type="text" id="kwd" name="kwd" value="${keyword }">
					<input type="submit" value="찾기">
				</form>
				<table class="tbl-ex">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
					<c:set var="firstIndex"	value="${totalCount - (currentPage - 1)*sizeList }" />	
					<c:forEach var='vo' items='${list }' varStatus='status'>				
						<tr>
							<td>${firstIndex - status.index }</td>
							<td style="text-align:left;padding-left:${(vo.depth-1)*10 }px">
								<c:if test='${vo.depth > 1 }' >
									<img src="/mysite_jstl/assets/images/re3.png">
								</c:if>
								<a href="/mysite_jstl/board?a=view&no=${vo.no }&p=${currentPage }">${vo.title }</a>
							</td>
							<td>${vo.userName }</td>
							<td>${vo.viewCount }</td>
							<td>${vo.regDate }</td>
							<td>
								<c:choose>
									<c:when test='${not empty authUser && authUser.no == vo.userNo }'>
										<a href="/mysite_jstl/board?a=delete&no=${vo.no }&p=${currentPage }" class="del">삭제</a>
									</c:when>
									<c:otherwise>
										&nbsp;
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</table>
				<!-- begin:paging -->
				<div class="pager">
					<ul>
						<c:if test="${prevPage > 0 }">
							<li><a href="/mysite_jstl/board?a=list&p=${prevPage }&kwd=${keyword }">◀</a></li>
						</c:if>						
						<c:forEach 
							begin='${firstPage }' 
							end='${lastPage }' 
							step='1' 
							var='i'>
							<c:choose>
								<c:when test='${currentPage == i }'>
									<li class="selected">${i }</li>
								</c:when>
								<c:when test='${i > pageCount }'>
									<li>${i }</li>
								</c:when>
								<c:otherwise>
									<li><a href="/mysite_jstl/board?a=list&p=${i }&kwd=${keyword }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						
						<c:if test='${nextPage > 0 }'>
							<li><a href="/mysite_jstl/board?a=list&p=${nextPage }&kwd=${keyword }">▶</a></li>
						</c:if>
					</ul>
				</div>
				<!-- end:paging -->
				<div class="bottom">
					<c:if test='${not empty authUser }'>
						<a href="/mysite_jstl/board?a=writeform" id="new-book">글쓰기</a>
					</c:if>
				</div>				
			</div>
		</div>


			<!-- 본문 부분 ------------------------------------------------------------------------ -->

		</div>
		<div class="col-md-2">
			<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />
		</div>
	</div>


	<!-- ------------------------------------------------------------------------ -->





</body>
</html>