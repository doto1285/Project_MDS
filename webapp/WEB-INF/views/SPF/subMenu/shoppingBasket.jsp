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
		<c:when test="${not empty basketListSplit}">
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
			
			<c:forEach items="${basketListSplit }" var="basketVO">
			<tr id="basketContent" >
				<input type="hidden" id="tableContents1" value="${basketVO.basket_no }">
				<input type="hidden" id="tableContents2" value="${basketVO.product_no }">
				<input type="hidden" id="tableContents3" value="${basketVO.productoption_no }">
				<input type="hidden" id="tableContents4" value="${basketVO.member_no }">
				<input type="hidden" id="tableContents5" value="${basketVO.mall_no }">
				<input type="hidden" id="tableContents6" value="${basketVO.basket_count }">
				<input type="hidden" id="tableContents7" value="${basketVO.product_name }">
				<input type="hidden" id="tableContents8" value="${basketVO.productoption_color }">
				<input type="hidden" id="tableContents9" value="${basketVO.productoption_size }">
				<input type="hidden" id="tableContents10" value="${basketVO.product_price }">
				<input type="hidden" id="tableContents11" value="${basketVO.productimg_image }">
				<input type="hidden" id="tableContents12" value="${basketVO.total }">
				<td><div class="form-group">
						<div class="checkbox">
							<label> <input type="checkbox" class="tr_check" id="tableContents" >
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
		<div class="pager">
				<!-- class="pagination" id="paging" -->
				<ul>
					<c:if test="${beginPage>1 }">
						<li><a
							href="/Project_MDS/${mall_domain }/shoppingbasket?pageNo=${beginPage-1 }">◀</a>
							<input type="hidden" name="pageNo" value="${beginPage-1 }">
						</li>
					</c:if>
					<c:forEach begin='${beginPage }' end='${endPage }' step='1' var='i'>
						<c:choose>
							<c:when test='${currentPage == i }'>
								<li class="selected">${i }</li>
							</c:when>
							<c:otherwise>
								<li><a
									href="/Project_MDS/${mall_domain }/shoppingbasket?&pageNo=${i }">${i }</a>
									<input type="hidden" name="pageNo" value="${i}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test='${endPage<total }'>
						<li><a
							href="/Project_MDS/${mall_domain }/shoppingbasket?&pageNo=${endPage+1 }">▶</a>
							<input type="hidden" name="pageNo" value="${endPage+1}"></li>
					</c:if>
				</ul>

			</div>
	</div>
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
<script>
var basketArray = new Array();
$("#deleteButton").click(function() {
	$(".tr_check:checked" ).each( function(idx, row) {
	/* var record = $(row).parents("tr");
	console.log(record[0].innerText); */
		var basketInfo = new Object();
		basketInfo.basket_no = $(this).parents("#basketContent").find("#tableContents1").val();
		basketInfo.product_no = $(this).parents("#basketContent").find("#tableContents2").val();
		basketInfo.productoption_no = $(this).parents("#basketContent").find("#tableContents3").val();
		basketInfo.member_no = $(this).parents("#basketContent").find("#tableContents4").val();
		basketInfo.mall_no = $(this).parents("#basketContent").find("#tableContents5").val();
		basketInfo.basket_count = $(this).parents("#basketContent").find("#tableContents6").val();
		basketInfo.product_name = $(this).parents("#basketContent").find("#tableContents7").val();
		basketInfo.productoption_color = $(this).parents("#basketContent").find("#tableContents8").val();
		basketInfo.productoption_size = $(this).parents("#basketContent").find("#tableContents9").val();
		basketInfo.product_price = $(this).parents("#basketContent").find("#tableContents10").val();
		basketInfo.productimg_image = $(this).parents("#basketContent").find("#tableContents11").val();
		basketInfo.total = $(this).parents("#basketContent").find("#tableContents12").val();
		basketArray.push(basketInfo);
	});
	console.log("제이슨스트링!" + JSON.stringify(basketArray));
	 $.ajax({
		url : "shoppingbasketdelete",
		type : "POST",
		data : JSON.stringify(basketArray),
		contentType : "application/json",
		success : function(url) {
			alert("장바구니 상품이 삭제되었습니다.");
			location.href = url;
		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:"
					+ error);
		}
	});   
	});
	
 $("#orderButton").click(function() {
	$(".tr_check:checked").each(function(idx, row) {
		var basketInfo = new Object();
		basketInfo.basket_no = $(this).parents("#basketContent").find("#tableContents1").val();
		basketInfo.product_no = $(this).parents("#basketContent").find("#tableContents2").val();
		basketInfo.productoption_no = $(this).parents("#basketContent").find("#tableContents3").val();
		basketInfo.member_no = $(this).parents("#basketContent").find("#tableContents4").val();
		basketInfo.mall_no = $(this).parents("#basketContent").find("#tableContents5").val();
		basketInfo.basket_count = $(this).parents("#basketContent").find("#tableContents6").val();
		basketInfo.product_name = $(this).parents("#basketContent").find("#tableContents7").val();
		basketInfo.productoption_color = $(this).parents("#basketContent").find("#tableContents8").val();
		basketInfo.productoption_size = $(this).parents("#basketContent").find("#tableContents9").val();
		basketInfo.product_price = $(this).parents("#basketContent").find("#tableContents10").val();
		basketInfo.productimg_image = $(this).parents("#basketContent").find("#tableContents11").val();
		basketInfo.orderinfo_price = $(this).parents("#basketContent").find("#tableContents12").val();
		basketArray.push(basketInfo);
	});
	console.log("제이슨스트링!" + JSON.stringify(basketArray));
	 $.ajax({
		url : "orderinsertofbasket",
		type : "POST",
		data : JSON.stringify(basketArray),
		contentType : "application/json",
		success : function(url) {
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