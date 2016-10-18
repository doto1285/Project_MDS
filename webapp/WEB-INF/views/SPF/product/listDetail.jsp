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
<link href="/Project_MDS/assets/css/SPF_product.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="container">
		<div class="col-lg-6">
			<div class="thumbnail">
				<img src="${map.productimgflag1.productimg_image }" alt="상품 이미지"
					id="productDetailSample1">
			</div>
		</div>

		<div class="col-lg-6">
			<div class="thumbnail">
				<h4>&nbsp;상품명
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${map.productVo.product_name }</h4>
				<br>
				<h4>&nbsp;상품가격
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${map.productVo.product_price }</h4>
				<br>
				<h4>&nbsp;제조사
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${map.productVo.product_maker }</h4>
				<br>
				<h4>&nbsp;제조일자
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${map.productVo.product_makedate }</h4>
				<br>
				<from>
				<h4>
					&nbsp;색상 <select class="form-control" id="form-control1"
						style="float: right">
						<option value="0">-
							[필수] 색상을 선택해주세요. -</option>
						<option value="0">-----------------------</option>
						<c:forEach items="${map.productOptionList }"
							var="productOptionList">
							<option id="colorValue"
								value="${productOptionList.productoption_color }">${productOptionList.productoption_color }</option>
						</c:forEach>
					</select>
				</h4>
				<br>
				<h4>
					&nbsp;사이즈 <select class="form-control" id="form-control2"
						style="float: right">
						<option >- [필수] 사이즈를 선택해주세요. -</option>
						<option>------------------------</option>
						<c:forEach items="${map.productOptionList }"
							var="productOptionList">
							<option value="${productOptionList.productoption_size }">${productOptionList.productoption_size }</option>
						</c:forEach>
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
				<br>
				<label id="productPriceText1">&nbsp; 총 상품금액(수량) : <label
					id="productPriceText2">0 </label> <label id="productPriceText3">(0개)
				</label>
				</label> <br>
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group btn-group-lg" role="group">
						<button type="submit" class="btn btn-default">장바구니</button>
					</div>

					<div class="btn-group btn-group-lg" role="group">
						<button type="submit" class="btn btn-primary">주문하기</button>
					</div>
				</div>
				</from>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-lg-12" id="productExplanImage">
			<img src="${map.productimgflag2.productimg_image }" alt="상품 설명 이미지"
				class="img-rounded">
		</div>

	</div>
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>

<script>
	$('#form-control2').attr('disabled', 'true');
       $("#form-control1").change(function (){
    	   if ($(this).val() == 0) {
    		   $('#form-control2').attr('disabled', 'true');
    		}
    	   else {
    		   $('#form-control2').removeAttr('disabled');
    	   }
    	   console.log( $(this).val() );
       });

</script>
</html>