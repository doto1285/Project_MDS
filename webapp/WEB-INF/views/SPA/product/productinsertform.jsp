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
		<form class="board-form" method="post" action="mallmodify">
			<div class="form-inline" id="inputFormGroup">
				<label id="catelabel">카테고리 : </label><select class="form-control" id="form-cata1nd">
					<option data-categroupno='-1'>1차 카테고리</option>
					<c:forEach items="${categorylist}" var="categoryList">
						<c:if test='${categoryList.categorylist_depth == 1}'>
							<option data-categroupno='${categoryList.categorylist_group}'>${categoryList.categorylist_name }</option>
						</c:if>
					</c:forEach>
				</select> <select class="form-control" id="form-cata2nd">
					<option value="-1">2차 카테고리</option>
					<c:forEach items="${categorylist2nd}" var="categorylist2nd">
						<c:if test='${categorylist2nd.categorylist_depth == 2}'>
							<option data-categroupno2='${categorylist2nd.categorylist_group}'>${categorylist2nd.categorylist_name }</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="col-lg-12">
				<label for="inputEmail3" class="col-lg-5 control-label"
					id="inputhead">상품 상세정보 </label> <label for="inputEmail3"
					class="col-lg-6 control-label" id="inputhead">상품 옵션</label>
				<div class="col-lg-5">
					<div class="thumbnail">
						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">상품명 : </label> <input name="mall_name"
								type="text" class="form-control" id="inputBox" value="123">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">상품가격 : </label> <input name="mall_name"
								type="text" class="form-control" id="inputBox" value="123">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조자 : </label> <input name="mall_name"
								type="text" class="form-control" id="inputBox" value="123">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조일자 : </label> <input name="mall_name"
								type="text" class="form-control" id="inputBox" value="123">
						</div>
					</div>
				</div>

				<div class="col-lg-5">
					<div class="thumbnail">
						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">색상 : </label> <input name="mall_name" type="text"
								class="form-control" id="inputBox" value="123">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">사이즈 : </label> <input name="mall_name"
								type="text" class="form-control" id="inputBox" value="123">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">재고 : </label> <input name="mall_name" type="text"
								class="form-control" id="inputBox" value="123">
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<label for="inputEmail3" class="col-lg-5 control-label"
					id="inputhead">썸네일이미지 </label> <label for="inputEmail3"
					class="col-lg-6 control-label" id="inputhead">상품 메인이미지 </label>
				<div class="col-lg-4">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productDetailSample2.jpg"
							alt="상품 썸네일이미지"> <input class="btn btn-info" id="file"
							name="file" type="file" value="첨부하기">
					</div>
				</div>

				<div class="col-lg-2">
					<div class="thumbnail" id="productmainimg">
						<img src="/Project_MDS/assets/image/SPF_productDetailSample2.jpg"
							alt="상품 메인이미지"> <input class="btn btn-info" id="file"
							name="file" type="file" value="첨부하기">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<br> <label for="inputEmail3" class="col-lg-12 control-label"
					id="inputhead">상품 상세이미지 </label>
				<div class="col-lg-12">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productExplanSample8.png"
							alt="상품 상세이미지" class="img-rounded"> <input
							class="btn btn-info" id="file" name="file" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="form-group" id="inputFormGroup">
					<input type="hidden" name="wkkrnsl" value="aa"> <input
						class="btn btn-success" id="btnOk" type="submit" value="추가하기">
					<input class="btn btn-warning" id="btnCancle" type="submit"
						value="돌아가기">
				</div>
			</div>
		</form>
	</div>

	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>
<script>
	var categroupNo = "";
$("#form-cata1nd").on("change", function() {
	categroupNo = $(this).parents("option").data("categroupno");
	if(categroupNo==-1) {
		return;
	}
	categroupNo = 9;
	console.log("1차 카테고리 클릭시: " + categroupNo); //로그에 찍히는 부분

	$.ajax({
		url : "productcategorySelect",
		type : "POST",
		data : {
			"categroupNo" : categroupNo,
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
});
</script>