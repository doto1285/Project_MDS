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
<link href="/Project_MDS/assets/css/SPF_subMenu.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />
	<br>

	<div class="container">
		<h3 id="boardTitle">주문배송조회</h3>
		<table class="table" id="orderTable">
			<colgroup>
				<col width="13%" />
				<col width="13%" />
				<col width="13%" />
				<col width="12%" />
				<col width="13%" />
				<col width="13%" />
				<col width="13%" />
			</colgroup>
			<tr class="active">
				<td>주문일자 <br>[주문번호]
				</td>
				<td><label id="tdFirst">이미지</label></td>
				<td><string>상품명 <br>
					[상품상세]</string></td>
				<td><label id="tdFirst">수량</label></td>
				<td><label id="tdFirst">상품구매금액</label></td>
				<td><label id="tdFirst">주문처리상태</label>
				<td><label id="tdFirst">주문취소</label></td>
			</tr>
			<tr>
				<td id="tableContents">2016년 9월 5일 <br> [0000000000]
				</td>
				<td><img
					src="/Project_MDS/assets/image/SPF_orderProductSample1.png"
					alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
				<td id="tableContents">엠보단가라 <br> [색상:블루, <br>
					사이즈:FREE]
				</td>
				<td id="tableContents">2개</td>
				<td id="tableContents">29,500원</td>
				<td id="tableContents">배송 준비중</td>
				<td><button type="button" class="btn btn-default" id="orderDeliveryButton">주문취소</button></td>
			</tr>
		</table>
		<div style="text-align: center;">
			<label style="font-size: 14px;">주문 내역이 없습니다.</label> <br>
		</div>
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

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>