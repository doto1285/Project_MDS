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
		<h3>상품 검색</h3>
		<!-- 검색 미구현 -->
		<form class="form-inline" method="get" action="">
			<div class="form-group" id="inputFormGroup">
				<input name="" type="text" class="form-control" id="inputBox"
					value=""> <input class="btn btn-info" type="submit"
					value="검색">
			</div>
		</form>

		<br>
		<h3>상품목록</h3>
		<div class="col-lg-11">
			<table class="table" id="productTable">

				<tr class="active">
					<td>상품명</td>
					<td>상품 사진</td>
					<td>판매가</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
				<c:forEach var='vo' items='${list}' varStatus='status'>
					<tr data-productno='${vo.product_no}'>
						<td id="tableContents">${vo.product_name }</td>
						<td id="tableContents"><img
						src="${vo.productimg_image }"
						alt="상품 이미지" class="img-thumbnail" id="productTableImage"></td>
						<td id="tableContents">${vo.product_price }원</td>
						<td><a href="?group_no=${vo.product_no}" class="btn btn-warning btn-sm">수정</a></td>
						<td><input type="button"
							class="btn_Delete btn btn-danger btn-sm" value="삭제"></td>

					</tr>
				</c:forEach>
			</table>
		</div>
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
	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>
<script>
	var productNo = "";
$(".btn_Delete").on("click", function() {
	productNo = $(this).parents("tr").data("productno");

	console.log("삭제 버튼 클릭시: " + msgchangecateNo); //로그에 찍히는 부분

	$.ajax({
		//값 넘기기 ( 삭제할 번호: productNo)
		url : "productdelete",
		type : "POST",
		data : {
			"productNo" : productNo,
		},
		dataType : "text",

		success : function(url) {
			//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.
			location.href = url;

		},
		error : function(jqXHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	alert("삭제 완료");
});
</script>