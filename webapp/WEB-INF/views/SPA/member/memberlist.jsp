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
		<h3>고객 검색</h3>
		<!-- 검색 미구현 -->
		<form class="form-inline" method="post" action="product">
			<div class="form-group" id="inputFormGroup">
				<input name="product_search" type="text" class="form-control"
					id="inputBox" value=""> <input class="btn btn-info"
					type="submit" value="검색">
			</div>
		</form>
		<br>
		<h3>고객목록</h3>
		<table class="table" id="memberTable">
			<colgroup>
				<col width="10%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>

			<tr class="active">
				<td>번호</td>
				<td>아이디</td>
				<td>이름</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>주소</td>
			</tr>
			
			<tr>
				<td id="tableContents">010101010101</td>
				<td id="tableContents">test</td>
				<td id="tableContents">테스터</td>
				<td id="tableContents">test@test.com</td>
				<td id="tableContents">000-1111-2222</td>
				<td id="tableContents">주소오</td>
			</tr>
			
		</table>
		<nav>
		<ul class="pagination" id="paging">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>
	</div>
</body>
</html>