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
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPA_order.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>상품 검색</h3>
		<div class="form-group" id="inputFormGroup">
			<input name="order" type="text" class="form-control" id="inputBox"
				value=""> <input class="btn btn-info" type="submit"
				value="검색">
		</div>
		<br>
		<h3>상품목록</h3>
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
				<td>선택</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>판매가</td>
				<td>수량</td>
				<td>배송비</td>
				<td>합계</td>
			</tr>
			<tr>
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" id="tableContents">
							</label>
						</div>
					</div></td>
				<td><img
					src="/Project_MDS/assets/image/SPF_orderProductSample1.png"
					alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">2개</td>
				<td id="tableContents">2500원</td>
				<td id="tableContents">29500원</td>
			</tr>
			<tr>
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" id="tableContents">
							</label>
						</div>
					</div></td>
				<td><img
					src="/Project_MDS/assets/image/SPF_orderProductSample1.png"
					alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">2개</td>
				<td id="tableContents">2500원</td>
				<td id="tableContents">29500원</td>
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
		<button type="button" class="btn btn-primary btn-lg" id="payButton">추가하기</button>
		<br> <br> <br> <br>
	</div>
</body>
</html>