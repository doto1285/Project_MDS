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
		<form id="insertfrm" class="board-form" method="post"
			enctype="multipart/form-data" action="productinsertcontent">
			<div class="form-inline" id="inputFormGroup">
				<label id="catelabel">카테고리 : </label><select class="form-control"
					id="form-cata1nd">
					<option value="-1">1차 카테고리</option>
					<c:forEach items="${categorylist}" var="categoryList">
						<c:if test='${categoryList.categorylist_depth == 1}'>
							<option value="${categoryList.categorylist_group }">${categoryList.categorylist_name }</option>
						</c:if>
					</c:forEach>
				</select> <select class="form-control" id="form-cata2nd">
					<option value="-1">2차 카테고리</option>
					<option id="sizeSelect"></option>
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
								id="inputText">상품명 : </label> <input name="product_name"
								type="text" class="form-control" id="product_name"
								placeholder="상품명을 입력해주세요.">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">상품가격 : </label> <input name="product_price"
								type="text" class="form-control" id="product_price" value=""
								placeholder="상품가격을 입력해주세요." >
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조자 : </label> <input name="product_maker"
								type="text" class="form-control" id="product_maker" value="개성공단"
								placeholder="제조사를 입력해주세요." >
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조일자 : </label> <input name="product_makedate"
								type="text" class="form-control" id="product_makedate" value="20161010"
								placeholder="입력형식 : 20160101" >
						</div>
					</div>
				</div>

				<div class="col-lg-5">
					<div class="thumbnail">
						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">색상 : </label> <input name="productoption_color"
								type="text" class="form-control" id="productoption_color"
								value="" placeholder="색상을 입력해주세요.">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">사이즈 : </label> <input name="productoption_size"
								type="text" class="form-control" id="productoption_size"
								value="100" placeholder="사이즈를 입력해주세요." >
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">재고 : </label> <input name="productoption_stock"
								type="text" class="form-control" id="productoption_stock"
								value="30" placeholder="재고를 입력해주세요." >
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<br> <label for="inputEmail3" class="col-lg-12 control-label"
					id="inputhead">상품 썸네일이미지 </label>
				<div class="col-lg-4">
					<div class="thumbnail">
					<input
							class="btn btn-info" id="file1" name="file1" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<br> <label for="inputEmail3" class="col-lg-12 control-label"
					id="inputhead">상품 메인이미지 </label>
				<div class="col-lg-4">
					<div class="thumbnail">
						<input class="btn btn-info" id="file2" name="file2" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<br> <label for="inputEmail3" class="col-lg-12 control-label"
					id="inputhead">상품 상세이미지 </label>
				<div class="col-lg-4">
					<div class="thumbnail">
						<input class="btn btn-info" id="file3" name="file3" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<input type="hidden" id="product_no" name="productno">
		</form>
		<div class="col-lg-12">
			<button class="btn btn-info btnok" name="btnOk" id="btnOk">추가하기</button>
			<a href="product" class="btn btn-warning" id="btnCancle"> 돌아가기 </a>
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />

</body>
</html>
<script>

	$('#form-cata2nd').attr('disabled', 'true');
	$("#form-cata1nd")
			.on(
					"change",
					function() {
						var tdString = "";
						var categorylist_group = $(this).val();
						if (categorylist_group == -1) {
							$('#form-cata2nd').attr('disabled', 'true');
						} else {
							$('#form-cata2nd').removeAttr('disabled');
						}
						console.log("1차 카테고리 클릭시: " + categorylist_group); //로그에 찍히는 부분
						var categoryListVo = {
							"categorylist_group" : categorylist_group
						}
						$
								.ajax({
									url : "productcategorySelect",
									type : "POST",
									data : JSON.stringify(categoryListVo),
									contentType : "application/json",

									success : function(sizeList) {
										console.log(sizeList);
										if (sizeList == "") {
											tdString += "<option value='-1'>";
											tdString += "카테고리가 없습니다.";
											tdString += "</option>";
											$('#form-cata2nd').attr('disabled',
													'true');
										}
										$
												.each(
														sizeList,
														function(index,
																categoryListVo) {
															tdString += "<option value=";
                      tdString += categoryListVo.categorylist_no;
                      tdString += ">";
															tdString += categoryListVo.categorylist_name;
															tdString += "</option>";
														});
										$('#form-cata2nd').html(tdString);
									},
									error : function(jqXHR, status, error) {
										console.error(status + " : " + error);
									}
								});
					});

	$("#btnOk").on("click", function() {
		var tdString = "";
		var categoryValue = $("#form-cata2nd option:selected").val();

		if (categoryValue == -1) {
			alert("2차 카테고리를 설정해주세요.");
			return;
		}

		var product_name = $("#product_name").val();
		if (product_name == "") {
			alert("상품명을 입력해주세요.");
			return;
		}
		var product_price = $("#product_price").val();
		if (product_price == "") {
			alert("상품가격을 입력해주세요.");
			return;
		}
		var product_maker = $("#product_maker").val();
		if (product_maker == "") {
			alert("제조사를 입력해주세요.");
			return;
		}
		var product_makedate = $("#product_makedate").val();
		if (product_makedate == "" || !(product_makedate.length == 8)) {
			alert("제조일자를 확인해주세요.");
			return;
		}
		var productoption_color = $("#productoption_color").val();
		if (productoption_color == "") {
			alert("색상을 입력해주세요.");
			return;
		}
		var productoption_size = $("#productoption_size").val();
		if (productoption_size == "") {
			alert("사이즈를 입력해주세요.");
			return;
		}
		var productoption_stock = $("#productoption_stock").val();
		if (productoption_stock == "") {
			alert("재고를 입력해주세요.");
			return;
		}
		var file1 = $("#file1").val();
		if (file1 == "") {
			alert("상품 썸네일을 설정하세요.");
			return;
		}
		var file2 = $("#file2").val();
		if (file2 == "") {
			alert("상품 메인이미지를 설정하세요.");
			return;
		}
		var file3 = $("#file3").val();
		if (file3 == "") {
			alert("상품 상세이미지를 설정하세요.");
			return;
		}

		var productVo = {
			"product_name" : product_name,
			"product_price" : product_price,
			"product_maker" : product_maker,
			"product_makedate" : product_makedate,
			"categorylist_no" : categoryValue
		}
			$.ajax({
				url : "productinsert",
				type : "POST",
				data : JSON.stringify(productVo),
				contentType : "application/json",

				success : function(productno) {
					if(productno == -1) {
						alert("상품명이 중복됩니다.");
						return;
					}
					$('#product_no').attr('value', productno);
					$('#insertfrm').submit();
				},
				error : function(jqXHR, status, error) {
					alert(status + " : " + error);
				}
			});
	});
</script>