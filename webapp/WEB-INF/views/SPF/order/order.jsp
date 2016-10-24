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
<link href="/Project_MDS/assets/css/SPF_order.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="container">
		<br>
		<h3 id="boardTitle">상품주문</h3>
		<label id="description">상품의 옵션 및 수량 변경은 상품상세에서 가능합니다.</label>
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
				<td>합계</td>
			</tr>
			<c:forEach items="${orderList }" var="orderVO">
			<tr class="baskettr" id="basketContent" >
				<input type="hidden" id="tableContents1" value="${orderVO.basket_no }">
				<input type="hidden" id="tableContents2" value="${orderVO.product_no }">
				<input type="hidden" id="tableContents3" value="${orderVO.productoption_no }">
				<input type="hidden" id="tableContents4" value="${orderVO.member_no }">
				<input type="hidden" id="tableContents5" value="${orderVO.mall_no }">
				<input type="hidden" id="tableContents6" value="${orderVO.basket_count }">
				<input type="hidden" id="tableContents7" value="${orderVO.product_name }">
				<input type="hidden" id="tableContents8" value="${orderVO.productoption_color }">
				<input type="hidden" id="tableContents9" value="${orderVO.productoption_size }">
				<input type="hidden" id="tableContents10" value="${orderVO.product_price }">
				<input type="hidden" id="tableContents11" value="${orderVO.productimg_image }">
				<input type="hidden" id="tableContents12" value="${orderVO.total }">
					<td><div class="form-group">
							<div class="checkbox">
								<label> <input type="checkbox" class="tr_check" id="tableContents">
								</label>
							</div>
						</div></td>
					<td><img
						src="${orderVO.productimg_image }"
						alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
					<td id="tableContents">${orderVO.product_name }<br>(${orderVO.productoption_color }, ${orderVO.productoption_size })</td>
					<td id="tableContents">${orderVO.product_price }</td>
					<td id="tableContents">${orderVO.basket_count }개</td>
					<td id="tableContents">${orderVO.total }원</td>
				</tr>
			</c:forEach>
		</table>
		<button type="button" class="btn btn-default" id="deleteButton">선택상품삭제</button>

		<br> <br> <br> <br> <label style="font-size: 18px">배송지정보 </label>
		<table class="table table-bordered" id="orderTable">
			<colgroup>
				<col width="20%" />
				<col width="80%" />

			</colgroup>
			<tr>
				<td class="active">받으시는분<label style="color: red">*</label></td>
				<td><input class="form-control" id="disabledInput" type="text"
					placeholder=""></td>
			</tr>
			<tr>
				<td class="active">주소<label style="color: red">*</label></td>
				<td>
					<div class="row">
						<div class="col-xs-8" id="addressInput3">
							<input type="text" class="form-control" id="basicAddress" placeholder="">
						</div>
						<div class="col-xs-4" id="addressLabel3">
							<label>기본주소</label>
						</div>
						<div class="col-xs-8" id="addressInput4">
							<input type="text" class="form-control" id="remainderAddress" placeholder="">
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
				<td class="active">배송메시지</td>
				<td><textarea class="form-control" rows="2"></textarea></td>
			</tr>
		</table>
		<br> <br> <label style="font-size: 18px">&nbsp; 배송비 : </label><label style="font-size: 18px"> &nbsp;2,500 </label><label
			style="font-size: 18px"> 원 </label>
		<br> <br> <label style="font-size: 18px">&nbsp; 결제
			예정 금액 : </label><label id="total" style="font-size: 24px"> &nbsp; </label><label
			style="font-size: 24px"> 원 </label> <br> <br> <br> <br>
		<label style="font-size: 18px">결제수단 </label> <br> <label
			class="radio-inline" id="payRadio"> <input type="radio"
			name="inlineRadioOptions" id="inlineRadio1" value="option1" checked>
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
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
<script>
var orderArray = new Array();
var total = 2500;
$("#deleteButton").click(function() {
	$(".tr_check:checked" ).parents("#basketContent").remove();
	var total = 2500;
	$(".baskettr").each(function(idx, row){
		total += parseInt($(this).find("#tableContents12").val());
		$("#total").text(total);
	});
	});
	
$(".baskettr").each(function(idx, row){
	total += parseInt($(this).find("#tableContents12").val());
	$("#total").text(total);
});
	
$("#payButton").click(function() {
	   if(!($(this).find("#tableContents1").val() == 0)){
		 var basketNoArray = new Array();
		 $(".baskettr").each(function(idx, row) {
		 var orderInfo = new Object();
		 orderInfo.basket_no = $(this).find("#tableContents1").val();
		 basketNoArray.push(orderInfo);
		 });
		 
		 console.log("제이슨스트링!" + JSON.stringify(basketNoArray));
		 $.ajax({
			url : "basketdeleteoforder",
			type : "POST",
			data : JSON.stringify(basketNoArray),
			contentType : "application/json",
			success : function(url) {
				console.log("동작완료");
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:"
						+ error);
			}
		});  
	 }  
	var address = $("#basicAddress").val() + " " +  $("#remainderAddress").val();
	$(".baskettr").each(function(idx, row) {
		var orderInfo = new Object();
		orderInfo.product_no = $(this).find("#tableContents2").val();
		orderInfo.productoption_no = $(this).find("#tableContents3").val();
		orderInfo.member_no = $(this).find("#tableContents4").val();
		orderInfo.mall_no = $(this).find("#tableContents5").val();
		orderInfo.basket_count = $(this).find("#tableContents6").val();
		orderInfo.product_name = $(this).find("#tableContents7").val();
		orderInfo.productoption_color = $(this).find("#tableContents8").val();
		orderInfo.productoption_size = $(this).find("#tableContents9").val();
		orderInfo.product_price = $(this).find("#tableContents10").val();
		orderInfo.productimg_image = $(this).find("#tableContents11").val();
		orderInfo.orderinfo_price = $(this).find("#tableContents12").val();
		orderInfo.address = address;
		orderArray.push(orderInfo);
	});
	console.log("제이슨스트링!" + JSON.stringify(orderArray));
	 $.ajax({
		url : "orderdeliveryinsert",
		type : "POST",
		data : JSON.stringify(orderArray),
		contentType : "application/json",
		success : function(url) {
			alert("성공적으로 결제되었습니다.");
			location.href = url;
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		}
	});  
	 
	 
	 
	}); 
</script>
</html>