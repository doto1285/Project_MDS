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
		<h3>상품수정</h3>
		<form id="modifyfrm" class="board-form" method="post"
			enctype="multipart/form-data" action="productmodifycontent">
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
								value="${productVo.product_name}" placeholder="상품명을 입력해주세요.">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">상품가격 : </label> <input name="product_price"
								type="text" class="form-control" id="product_price"
								value="${productVo.product_price}" placeholder="상품가격을 입력해주세요.">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조자 : </label> <input name="product_maker"
								type="text" class="form-control" id="product_maker"
								value="${productVo.product_maker}" placeholder="제조사를 입력해주세요.">
						</div>

						<div class="form-group" id="inputFormGroup">
							<label for="inputEmail3" class="col-lg-4 control-label"
								id="inputText">제조일자 : </label> <input name="product_makedate"
								type="text" class="form-control" id="product_makedate"
								value="${productVo.product_makedate}"
								placeholder="입력형식 : 20160101">
						</div>
					</div>
				</div>

				<div class="col-lg-5">
					<div class="thumbnail">
						<table border="1" width="350px" style="font-size: 15px">
							<c:forEach items="${productOptionlist}" var="productOptionlist">
								<tr data-cateno='${productOptionlist.productoption_no}'
								data-cateco='${productOptionlist.productoption_color}'
								data-catesi='${productOptionlist.productoption_size}'
								data-catest='${productOptionlist.productoption_stock}'>
									<td><label class="cateP">색깔 :
											${productOptionlist.productoption_color } <br> 사이즈 :
											${productOptionlist.productoption_size } <br> 재고 :
											${productOptionlist.productoption_stock }개
									</label></td>
									<td>&nbsp;&nbsp;&nbsp;<input type="button"
										class="btn_catePMod btn btn-warning btn-sm"
										data-toggle="modal" data-target="#modal_cateP" value="수정">
										&nbsp;&nbsp; <input type="button"
										class="btn_Delete btn btn-danger btn-sm" value="삭제"></td>
								</tr>
							</c:forEach>
						</table>
						<br> <input type="button"
							class="btn_catePAod btn btn-info btn-sm" data-toggle="modal" data-target="#modal_cateA" value="추가">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<label for="inputEmail3" class="col-lg-5 control-label"
					id="inputhead">썸네일이미지 </label> <label for="inputEmail3"
					class="col-lg-6 control-label" id="inputhead">상품 메인이미지 </label>
				<div class="col-lg-4">
					<div class="thumbnail">
						<img src="${url1 }" alt="상품 썸네일이미지"> <input
							class="btn btn-info" id="file1" name="file1" type="file"
							value="첨부하기">
					</div>
				</div>

				<div class="col-lg-2">
					<div class="thumbnail" id="productmainimg">
						<img src="${url2 }" alt="상품 메인이미지"> <input
							class="btn btn-info" id="file2" name="file2" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<div class="col-lg-12">
				<br> <label for="inputEmail3" class="col-lg-12 control-label"
					id="inputhead">상품 상세이미지 </label>
				<div class="col-lg-12">
					<div class="thumbnail">
						<img src="${url3 }" alt="상품 상세이미지" class="img-rounded"> <input
							class="btn btn-info" id="file3" name="file3" type="file"
							value="첨부하기">
					</div>
				</div>
			</div>
			<input type="hidden" id = "productno" name="productno" value="${productVo.product_no}">
		</form>
		<div class="col-lg-12">
			
			<button class="btn btn-info btnok" name="btnOk" id="btnOk">저장하기</button>
			<a href="product" class="btn btn-warning" id="btnCancle"> 돌아가기 </a>
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>

<!-- 모달창 그리기 -->
<div class="modal fade" id="modal_cateP" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">상품옵션 수정</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">변경할 색상</label> <input
							type="text" class="form-control" id="recipient_color">
					</div>
				</form>
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">변경할 사이즈</label>
						<input type="text" class="form-control" id="recipient_size">
					</div>
				</form>
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">변경할 재고</label> <input
							type="text" class="form-control" id="recipient_stock">
					</div>
				</form>
			</div>


			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn_catePModalSave btn btn-default"
						data-dismiss="modal">수정하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 그리기 끝 -->

<!-- 모달창 그리기 -->
<div class="modal fade" id="modal_cateA" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">상품옵션 추가</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">추기할 색상</label> <input
							type="text" class="form-control" id="add_color">
					</div>
				</form>
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">추가할 사이즈</label>
						<input type="text" class="form-control" id="add_size">
					</div>
				</form>
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">추가할 재고</label> <input
							type="text" class="form-control" id="add_stock">
					</div>
				</form>
			</div>


			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn_catePModalAdd btn btn-default"
						data-dismiss="modal">추가하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 그리기 끝 -->

<script>
var cateno = "";
var cateno2 = "";
var cateco = "";
var catesi = "";
var catest = "";
$(".btn_catePMod").on("click", function() {
	cateno = $(this).parents("tr").data("cateno");
	cateco = $(this).parents("tr").data("cateco");
	catesi = $(this).parents("tr").data("catesi");
	catest = $(this).parents("tr").data("catest");
	$("#recipient_color").val(cateco);
	$("#recipient_size").val(catesi);
	$("#recipient_stock").val(catest);
});

//모달창 저장 btn_catePModalSave
$(".btn_catePModalSave").on("click", function() {
	cateno2 = $("#productno").val();
	cateco = $("#recipient_color").val();
	catesi = $("#recipient_size").val();
	catest = $("#recipient_stock").val();
	
	if(cateco == ""){
		alert("컬러를 설정해주세요.");
		return;
	}
	if(catesi == ""){
		alert("사이즈를 설정해주세요.");
		return;
	}
	if(catest == ""){
		alert("재고를 설정해주세요.");
		return;
	}

	$.ajax({
		url : "productoptionmodify",
		type : "POST",
		data : {
			"cateno" : cateno,
			"cateno2" : cateno2,
			"cateco" : cateco,
			"catesi" : catesi,
			"catest" : catest
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
	alert("수정 완료");
});
//모달창 추가 btn_catePModalAdd
$(".btn_catePModalAdd").on("click", function() {
	cateno2 = $("#productno").val();
	cateco = $("#add_color").val();
	catesi = $("#add_size").val();
	catest = $("#add_stock").val();
	
	if(cateco == ""){
		alert("컬러를 설정해주세요.");
		return;
	}
	if(catesi == ""){
		alert("사이즈를 설정해주세요.");
		return;
	}
	if(catest == ""){
		alert("재고를 설정해주세요.");
		return;
	}

	$.ajax({
		url : "productoptioninsert",
		type : "POST",
		data : {
			"cateno2" : cateno2,
			"cateco" : cateco,
			"catesi" : catesi,
			"catest" : catest
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
	alert("추가 완료");
});

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
		var product_no = $("#product_no").val();
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
		if (product_makedate == "") {
			alert("제조일자를 입력해주세요.");
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

		var productVo = {
			"product_no" : product_no,
			"product_name" : product_name,
			"product_price" : product_price,
			"product_maker" : product_maker,
			"product_makedate" : product_makedate,
			"categorylist_no" : categoryValue
		}
		$.ajax({
			url : "productmodify",
			type : "POST",
			data : JSON.stringify(productVo),
			contentType : "application/json",

			success : function() {
				$('#modifyfrm').submit();
			},
			error : function(jqXHR, status, error) {
				alert(status + " : " + error);
			}
		});
	});
</script>