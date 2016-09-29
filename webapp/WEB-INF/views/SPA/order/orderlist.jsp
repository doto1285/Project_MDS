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
	<div class="container">
		주문리스트
		<br>
		<h3 id="boardTitle">상품검색</h3>
		<h3 id="boardTitle">상품주문</h3>
		<label id="description">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</label>
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
		<button type="button" class="btn btn-default">선택상품삭제</button>
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
		<br> <br> <label style="font-size: 18px">배송지정보 </label>
		<table class="table table-bordered" id="orderTable">
			<colgroup>
				<col width="20%" />
				<col width="80%" />

			</colgroup>
			<tr>
				<td class="active">배송지 선택</td>
				<td id="radioText"><label class="radio-inline"> <input
						type="radio" name="inlineRadioOptions" id="inlineRadio1"
						value="option1"> 주문자 정보와 동일
				</label> <label class="radio-inline"> <input type="radio"
						name="inlineRadioOptions" id="inlineRadio2" value="option2">
						새로운 배송지
				</label></td>
			</tr>
			<tr>
				<td class="active">받으시는분<label style="color: red">*</label></td>
				<td><input class="form-control" id="disabledInput" type="text"
					placeholder=""></td>
			</tr>
			<tr>
				<td class="active">주소<label style="color: red">*</label></td>
				<td>
					<div class="row">
						<div class="col-xs-2" id="addressInput1">
							<input type="text" class="form-control" placeholder="">
						</div>
						<div class="col-xs-1" id="addressHyphen">
							<label>ㅡ</label>
						</div>
						<div class="col-xs-2" id="addressInput2">
							<input type="text" class="form-control" placeholder="">
						</div>
						<button type="button" class="btn btn-default" id="mailAddress">우편번호</button>
						<div class="col-xs-8" id="addressInput3">
							<input type="text" class="form-control" placeholder="">
						</div>
						<div class="col-xs-4" id="addressLabel3">
							<label>기본주소</label>
						</div>
						<div class="col-xs-8" id="addressInput4">
							<input type="text" class="form-control" placeholder="">
						</div>
						<div class="col-xs-4" id="addressLabel4">
							<label>나머지주소</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td class="active">일반전화<label style="color: red">*</label></td>
				<td><div class="col-xs-2" id="phoneInput1">
						<input type="text" class="form-control" placeholder="">
					</div>
					<div class="col-xs-1" id="phoneHyphen1">
						<label> ㅡ </label>
					</div>
					<div class="col-xs-2" id="phoneInput2">
						<input type="text" class="form-control" placeholder="">
					</div>
					<div class="col-xs-1" id="phoneHyphen2">
						<label> ㅡ </label>
					</div>
					<div class="col-xs-2" id="phoneInput3">
						<input type="text" class="form-control" placeholder="">
					</div></td>
			</tr>
			<tr>
				<td class="active">휴대전화</td>
				<td><div class="col-xs-2" id="phoneInput1">
						<input type="text" class="form-control">
					</div>
					<div class="col-xs-1" id="phoneHyphen1">
						<label> ㅡ </label>
					</div>
					<div class="col-xs-2" id="phoneInput2">
						<input type="text" class="form-control" placeholder="">
					</div>
					<div class="col-xs-1" id="phoneHyphen2">
						<label> ㅡ </label>
					</div>
					<div class="col-xs-2" id="phoneInput3">
						<input type="text" class="form-control" placeholder="">
					</div></td>
			</tr>
			<tr>
				<td class="active">배송메시지</td>
				<td><textarea class="form-control" rows="2"></textarea></td>
			</tr>
		</table>
		<br> <br> <label style="font-size: 18px">&nbsp; 결제
			예정 금액 : </label><label style="font-size: 24px"> &nbsp;18,000 </label><label
			style="font-size: 24px"> 원 </label> <br> <br> <br> <br>
		<label style="font-size: 18px">결제수단 </label> <br> <label
			class="radio-inline" id="payRadio"> <input type="radio"
			name="inlineRadioOptions" id="inlineRadio1" value="option1">
			<img src="/Project_MDS/assets/image/SPF_ico_bank.gif" alt="상품 이미지"
			class="img-thumbnail" id="payImage">
		</label> &nbsp; <label class="radio-inline" id="payRadio"> <input
			type="radio" name="inlineRadioOptions" id="inlineRadio2"
			value="option2"> <img
			src="/Project_MDS/assets/image/SPF_ico_card_disabled.gif"
			alt="상품 이미지" class="img-thumbnail" id="payImage">
		</label> &nbsp; <label class="radio-inline" id="payRadio"> <input
			type="radio" name="inlineRadioOptions" id="inlineRadio3"
			value="option3"> <img
			src="/Project_MDS/assets/image/SPF_ico_mobile_disabled.gif"
			alt="상품 이미지" class="img-thumbnail" id="payImage">
		</label> &nbsp; <label class="radio-inline" id="payRadio"> <input
			type="radio" name="inlineRadioOptions" id="inlineRadio3"
			value="option3"> <img
			src="/Project_MDS/assets/image/SPF_ico_paynow_disabled.gif"
			alt="상품 이미지" class="img-thumbnail" id="payImage">
		</label> &nbsp; <label class="radio-inline" id="payRadio"> <input
			type="radio" name="inlineRadioOptions" id="inlineRadio3"
			value="option3"> <img
			src="/Project_MDS/assets/image/SPF_ico_realtime_disabled.gif"
			alt="상품 이미지" class="img-thumbnail" id="payImage">
		</label> <br> <br> <br> <br> <br> <br>
		<button type="button" class="btn btn-primary btn-lg" id="payButton">결제하기</button>
		<br> <br> <br> <br>
	</div>
</body>
</html>