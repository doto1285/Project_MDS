<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPF_product.css" rel="stylesheet"
	type="text/css">
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="container">
		<div class="col-lg-6">
			<div class="thumbnail">
				<img src="/Project_MDS/assets/image/SPF_productDetailSample2.jpg"
					alt="상품 상세 이미지" id="productDetailSample1">
			</div>
		</div>

		<div class="col-lg-6">
			<div class="thumbnail">
				<h4>&nbsp;상품명
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					데일리 보카시</h4>
				<br>
				<h4>&nbsp;상품가격
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16,900원</h4>
				<br>
				<h4>&nbsp;제조사
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					모두의 쇼핑몰</h4>
				<br>
				<h4>&nbsp;제조일자
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2016-04-26</h4>
				<br>
				<h4>
					&nbsp;색상 <select class="form-control" id="form-control1"
						style="float: right">
						<option>화이트</option>
						<option>그레이</option>
						<option>블랙</option>
						<option>레드</option>
						<option>블루</option>
					</select>
				</h4>
				<br>
				<h4>
					&nbsp;사이즈 <select class="form-control" id="form-control1"
						style="float: right">
						<option>size XS(85)</option>
						<option>size S(90)</option>
						<option>size M(95)</option>
						<option>size L(100)</option>
						<option>size XL(105)</option>
					</select>
				</h4>
				<br>
				<h5 style="color: gray">&nbsp; ※위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</h5>
				<hr id="hr1">
				<br>
				<form class="form-inline">
					<div class="form-group">
						<label id="optionText" for="exampleInputName2">&nbsp;&nbsp;&nbsp;&nbsp;
							화이트 / size XS(85)</label> &nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
							class="form-control" id="exampleInputName2" placeholder="1">
					</div>
				</form>
				<br> <label id="productPriceText1">&nbsp; 총 상품금액(수량) :
					<label id="productPriceText2">0 </label> <label
					id="productPriceText3">(0개) </label>
				</label> <br>

				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group btn-group-lg" role="group">
						<button type="button" class="btn btn-default">장바구니</button>
					</div>
					<div class="btn-group btn-group-lg" role="group">
						<button type="button" class="btn btn-primary">주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample5.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample2.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample3.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample4.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample1.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample6.jpg"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
		<div class="col-lg-12" id="productExplanImage">
			<img src="/Project_MDS/assets/image/SPF_productExplanSample8.png"
				alt="상품 설명 이미지" class="img-rounded">
		</div>
	</div>
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>