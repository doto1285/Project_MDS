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
				<label id="catelabel">카테고리 : </label><select class="form-control"
					 id="form-cata1nd">
					<option value="-1">1차 카테고리</option>
					<c:forEach items="${categorylist}" var="categoryList">
						<c:if test='${categoryList.categorylist_depth == 1}'>
							<option value="${categoryList.categorylist_group }">${categoryList.categorylist_name }</option>
						</c:if>
					</c:forEach>
				</select> <select class="form-control" id="form-cata2nd">
					<option value="0">2차 카테고리</option>
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
						class="btn btn-info" id="btnOk" type="submit" value="추가하기">
					<a href="product" class="btn btn-warning" id="btnCancle"> 돌아가기 </a>
				</div>
			</div>
		</form>
	</div>

	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>
<script>
 
	$('#form-cata2nd').attr('disabled', 'true');
	$("#form-cata1nd").on("change", function() {
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
		$.ajax({
			url : "productcategorySelect",
			type : "POST",
			data : JSON.stringify(categoryListVo),
			contentType : "application/json",

			success : function(sizeList) {
                  console.log(sizeList);
                  if(sizeList == "") {
                      tdString += "<option value='-1'>";
                      tdString += "카테고리가 없습니다.";
                      tdString += "</option>";
                  	  $('#form-cata2nd').attr('disabled', 'true');
                  }
                   $.each(sizeList, function(index ,categoryListVo) {
                      tdString += "<option value='categoryListVo.categorylist_group'>";
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
</script>