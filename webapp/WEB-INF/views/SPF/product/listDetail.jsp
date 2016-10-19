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
						<option value="0">- [필수] 색상을 선택해주세요. -</option>
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
						<option>- [필수] 사이즈를 선택해주세요. -</option>
					</select>
				</h4>
				<br>
				<h5 style="color: gray">&nbsp; ※위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</h5>
				<hr id="hr1">
				<br>
				<div id="optionResult">
				
				</div>
				
				<br>
				<label id="productPriceText1">&nbsp; 총 상품금액(수량) : <label
					id="productPriceText2"> </label> <label id="productPriceText3">
				</label>
				</label>
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group btn-group-lg" role="group">
						<button type="submit" class="btn btn-default" id="basket">장바구니</button>
					</div>

					<div class="btn-group btn-group-lg" role="group">
						<button type="submit" class="btn btn-primary" id="order">주문하기</button>
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
	var tdBoolean = "true";
	var totalCount = 1;
	var totalPrice = 0;
	var count = -1;
	var price = 0;
	
	$('#form-control2').attr('disabled', 'true');
	
	$("#form-control1").on( "change", function() {
		var tdString = "<option value='0'>- [필수] 사이즈를 선택해주세요. -</option><option value='0'>------------------------</option>";
				if ($(this).val() == 0) {
					$('#form-control2').attr('disabled', 'true');
				} else {
					$('#form-control2').removeAttr('disabled');
				}
				var product_no = ${ map.productVo.product_no};
				var productoption_color = $(this).val();
				var productOptionVo = {
					"product_no" : product_no,
					"productoption_color" : productoption_color
				}

				$.ajax({
					url : "productOption",
					type : "POST",
					data : JSON.stringify(productOptionVo),
					contentType : "application/json",
					success : function(sizeList) {
						console.log(sizeList);
						 $.each(sizeList, function(index ,productOptionVo) {
							 tdString += "<option value='" + productOptionVo.productoption_no +"'>";
							 tdString += productOptionVo.productoption_size;
							 tdString += "</option>";
							 
						 }); 
						$('#form-control2').html(tdString);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"
								+ request.responseText + "\n" + "error:"
								+ error);
					}
				});
			});
	
	$('#form-control2').on('change', function(){
		var colorValue = $("#form-control1 option:selected").val();
		var sizeValue = $("#form-control2 option:selected").val();
		var sizeText = $("#form-control2 option:selected").text();
		var optionResultString = "";
		
		if(sizeValue==0){
		alert("선택할 수 없는 옵션입니다.");
		return;
		}
	
		$("#optionResult .form-inline").each(function(i) {
			if(sizeValue == $(this).data("size")){
				tdBoolean = "false";
				alert("이미 선택되어 있는 옵션입니다.");
				return;
			}
			
		});
		
		price= ${map.productVo.product_price};
		totalPrice = (totalCount * parseInt(price));
		
		count = ++count;
		$("#productPriceText2").html(totalPrice+"원");
		$("#productPriceText3").html("(" + totalCount + ")개"); 
		//count = $("#exampleInputName2").val();
		totalCount += parseInt(count);
		
		if(tdBoolean == "true"){
		optionResultString += "<div class='form-inline' data-color='"+ colorValue +"' data-size='" + sizeValue + "'>";
		optionResultString += "<div class='form-group'>";
		optionResultString += "<label id='optionText' >";
		optionResultString += "&nbsp;&nbsp;&nbsp;&nbsp;";
		optionResultString += colorValue;
		optionResultString += ", ";
		optionResultString += sizeText;
		optionResultString += "</label> &nbsp;&nbsp;&nbsp;&nbsp;"; 
		optionResultString += "<input type='text' class='form-control' id='exampleInputName2' value='1'>";
		optionResultString += "&nbsp;";
		optionResultString += "<input type='button' value='X' id='deleteButton'>";
		optionResultString += "</div>";
		optionResultString += "</div>";
		optionResultString += "<br id='deletebr'>";
		$('#optionResult').append(optionResultString);
		}
		tdBoolean = "true";

		
		
		
		$(".form-inline #deleteButton").on("click", function(){
			$("#deleteButton").parents(".form-inline").remove();
			$("#deletebr").remove();
		});

	});

	$("exampleInputName2").on("keyup", function(){
		/* console.log($(this).val()); */
	});
	
	var buyInfo = new Object();
	var buyInfoArray = [];
	$("#basket").on("click", function(){
		$("#optionResult .form-inline").each(function(i) {
			
			buyInfo.productoption_no = $(this).data("size");
			buyInfo.productoption_stock = totalCount-1;
			buyInfoArray[i] = buyInfo;
			console.log(i);
			});
		var finalJsonData = JSON.stringify(buyInfoArray);
		console.log(finalJsonData);
	});
	
	  

</script>
</html>