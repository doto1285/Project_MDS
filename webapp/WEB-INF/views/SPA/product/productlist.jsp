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
<link href="/Project_MDS/assets/css/SPA_product.css" rel="stylesheet" type="text/css">
<!-- /개인 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>상품 검색</h3>
		<!-- 검색 미구현 -->
		<form class="form-inline" method="get" action="">
			<div class="form-group" id="inputFormGroup">
				<input name="" type="text" class="form-control"
					id="inputBox" value=""> <input class="btn btn-info"
					type="submit" value="검색">
			</div>
		</form>

		<br>
		<h3>상품목록</h3>
		<table class="table" id="productTable">
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
				<td>상품 사진</td>
				<td>상품명</td>
				<td>판매가</td>
				<td>수량</td>
				<td>삭제</td>
			</tr>
			<tr>
				<td id="tableContents">지마킛</td>
				<td><img
					src="/Project_MDS/assets/image/SPF_orderProductSample1.png"
					alt="상품 이미지" class="img-thumbnail" id="productTableImage"></td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">2개</td>
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" id="tableContents">
							</label>
						</div>
					</div></td>
			</tr>

			<tr>
				<td id="tableContents">지마킛</td>
				<td><img
					src="/Project_MDS/assets/image/SPF_orderProductSample1.png"
					alt="상품 이미지" class="img-thumbnail" id="productTableImage"></td>
				<td id="tableContents">엠보단가라</td>
				<td id="tableContents">13500원</td>
				<td id="tableContents">2개</td>
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" id="tableContents">
							</label>
						</div>
					</div></td>
			</tr>
		</table>
		<nav>
		<ul class="pagination" id="paging">
			<li><a href="#" aria-label="Previous"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
		</nav>
		<div class="form-group" id="inputButton">
			<a href='productinsertform' class="btn btn-info">추가하기</a>
		</div>
		<br> <br> <br> <br>
	</div>
</body>
</html>