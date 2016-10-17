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
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->

<!-- 개인 -->
<link href="/Project_MDS/assets/css/SPA_product.css" rel="stylesheet"
	type="text/css">
<!-- /개인 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>상품추가</h3>
		<form class="board-form" method="post" enctype="multipart/form-data"
			action="product">
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">상품명</label> <input name="product_name" type="text"
					class="form-control" id="inputBox" value="">
			</div>
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">상품가격</label> <input name="product_price" type="text"
					class="form-control" id="inputBox" value="">
			</div>
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">제조사</label> <input name="product_maker" type="text"
					class="form-control" id="inputBox" value="">
			</div>
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">제조일자</label> <input name="product_makedate"
					type="text" class="form-control" id="inputBox" value="">
			</div>
			<div class="form-group" id="inputFormGroup">

				<img src="/Project_MDS/assets/image/SPA_header_logo.png"
					alt="썸네일이미지" id="productsomeimg" class="img-thumbnail"> <input
					class="btn btn-info" id="productsomeimg" name="productsomeimg"
					type="file" value="첨부하기"> <br>
			</div>
			<div class="form-group" id="inputFormGroup">
				<img src="/Project_MDS/assets/image/SPA_header_logo.png"
					alt="상품 메인이미지" id="productmainimg" class="img-thumbnail"> <input
					class="btn btn-info" id="productmainimg" name="productmainimg"
					type="file" value="첨부하기">

			</div>
			<div class="form-group" id="inputFormGroup">
				<img src="/Project_MDS/assets/image/SPA_header_logo.png"
					alt="상품 상세이미지" id="productdetailimg" class="img-thumbnail"> <input
					class="btn btn-info" id="productdetailimg" name="productdetailimg"
					type="file" value="첨부하기">
			</div>
			<div class="form-group" id="inputButton">
			 <input
					class="btn btn-info" type="submit" value="추가하기">
			</div>
		</form>
	</div>
	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>