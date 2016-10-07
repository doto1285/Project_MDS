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
<link href="/Project_MDS/assets/css/SPA_order.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>주문 검색</h3>
		<!-- 검색 미구현 -->
		<form class="form-inline" method="post" action="order">
			<div class="form-group" id="inputFormGroup">
				<input name="product_search" type="text" class="form-control"
					id="inputBox" value=""> <input class="btn btn-info"
					type="submit" value="검색">
			</div>
		</form>
		<br>
		<h3>주문목록</h3>
		<table class="table" id="orderTable">
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
				<td>쇼핑몰 이름</td>
				<td>주문 번호</td>
				<td>상품명</td>
				<td>수량</td>
				<td>총 가격</td>
				<td>상태</td>
			</tr>
			
			<tr>
				<td id="tableContents">지마킛</td>
				<td id="tableContents">10101010102020</td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">2개</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">배송완료</td>
			</tr>
			
			<tr>
				<td id="tableContents">지마킛</td>
				<td id="tableContents">10101010102020</td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">2개</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">배송완료</td>
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