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
		<h3 id="boardTitle">장바구니</h3>
		<c:choose>
		<c:when test="${not empty basketList}">
		<table class="table" id="orderTable">
			<colgroup>
				<col width="10%" />
				<col width="18%" />
				<col width="18%" />
				<col width="18%" />
				<col width="18%" />
				<col width="18%" />
			</colgroup>
			<tr class="active">
				<td><label id="tdFirst">선택</label></td>
				<td><label id="tdFirst">이미지</label></td>
				<td><string>상품명 <br>(상품상세)</string></td>
				<td><label id="tdFirst">판매가</label></td>
				<td><label id="tdFirst">수량</label></td>
				<td><label id="tdFirst">합계</label></td>
			</tr>
			
			<c:forEach items="${basketList }" var="basketVO">
			<tr id="basketContent">
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" class="tr_check" id="tableContents" value="${basketVO }">
							</label>
						</div>
					</div></td>
				<td><img
					src="${basketVO.productimg_image }"
					alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
				<td id="tableContents">${basketVO.product_name }<br>(${basketVO.productoption_color }, ${basketVO.productoption_size })</td>
				<td id="tableContents">${basketVO.product_price }원</td>
				<td id="tableContents">${basketVO.basket_count }개</td>
				<td id="tableContents">${basketVO.total }원</td>
			</tr>
			</c:forEach>
		</table>
		</c:when>
		<c:otherwise>
		<br> <br> <br> <br> <br> <br>
			<div style="text-align: center;">
				<label style="font-size: 14px;">장바구니가 비어있습니다.</label> <br>
			</div>
		</c:otherwise>
		
		</c:choose>
		<button type="button" class="btn btn-default" id="deleteButton">선택상품삭제</button>
		<button type="button" class="btn btn-default" id="orderButton">선택상품주문</button>
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
<script>
var basketArray = new Array();
$("#deleteButton").click(function() {
	$("#basketContent .tr_check:checked" ).each( function(idx, row) {
	/* var record = $(row).parents("tr");
	console.log(record[0].innerText); */
	var basketInfo = new Object();
	basketInfo = $(this).val();
	basketArray.push(basketInfo);
	});
	var c = JSON.stringify(basketArray);
	console.log("제이슨스트링!" + c);
	jQuery.ajaxSettings.traditional = true;
	 $.ajax({
		url : "shoppingbasketdelete",
		type : "POST",
		data : JSON.stringify(basketArray),
		contentType : "application/json",
		success : function(url) {
			console.log("동작성공");
			//location.href = url;
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		}
	});   
	});
	
/* $("#orderButton").click(function() {
	$(".tr_check:checked").each(function(idx, row) {
	/* var record = $(row).parents("tr");
	console.log(record[0].innerText); 
	var a = $(this).val();
	basketno[idx] = a;
	});
	console.log(basketno);
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		url : "orderinsert",
		type : "POST",
		data : JSON.stringify(buyInfoArray),
		contentType : "application/json",
		success : function(url) {
			console.log("동작성공");
			location.href = url;
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		}
	});  
	}); */
	
	

</script>
</html>