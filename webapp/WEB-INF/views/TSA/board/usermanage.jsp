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
<script type="text/javascript" src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>
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
	<!--      ---------------------------------------------             -->
	<div class="jumbotron" id="maincol">
		<center>
			<P id="center_p">회원관리</P>
		</center>

		<form id="search_form" action="/mysite5/board" method="get">
			<input type="text" id="kwd" name="kwd" value="${keyword }"> <input
				type="submit" value="찾기">
		</form>

		<table class="table table-striped table-hover ">
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
				<th>구분</th>
			</tr>

			<tbody>
				<c:forEach items="${GetUserManageList }" var="GetUserManageList">
				<tr>
					<td>${GetUserManageList.member_no}</td>
		<td><!--<a href="view?no=${GetUserManageList.member_no}">-->${GetUserManageList.member_id}<!--</a>--></td>
					<td>${GetUserManageList.member_name}</td>
					<td>${GetUserManageList.member_joindate}</td>
					<td>${GetUserManageList.member_distinction}</td>
				</tr>
			</c:forEach>
				</tbody>
		</table>

			</div>
		<div class="bottom" id="serv_bot">
			<!-- begin:paging -->
			<div class="pager">
				<ul>

					<c:if test="${map.prevPage >= 0 }">
						<li><a
							href="/Project_MDS/TSA/main/board/usermanage?p=${map.prevPage }">◀</a></li>
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
									href="/Project_MDS/TSA/main/board/usermanage?p=${i }">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test='${map.nextPage > 0 }'>
						<li><a
							href="/Project_MDS/TSA/main/board/usermanage?p=${map.nextPage }">▶</a></li>
					</c:if>
				</ul>
	</div>
	<!--      ---------------------------------------------             -->
</body>
</html>