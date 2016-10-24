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
		<h3 id="boardTitle">주문배송조회</h3>
		<c:choose>
		<c:when test="${not empty orderInfoSplit}">
		<table class="table" id="orderTable">
			<colgroup>
				<col width="13%" />
				<col width="13%" />
				<col width="13%" />
				<col width="12%" />
				<col width="13%" />
				<col width="13%" />
				<col width="13%" />
			</colgroup>
			<tr class="active">
				<td>주문일자 <br>[주문번호]
				</td>
				<td><label id="tdFirst">이미지</label></td>
				<td><string>상품명 <br>
					[상품상세]</string></td>
				<td><label id="tdFirst">수량</label></td>
				<td><label id="tdFirst">상품구매금액</label></td>
				<td><label id="tdFirst">주문처리상태</label>
				<td><label id="tdFirst">주문취소</label></td>
			</tr>
			<c:forEach items="${orderInfoSplit }" var="orderInfoVO">
			<tr class="contenttr">
				<td id="tableContents">${orderInfoVO.orderinfo_date } <br> [${orderInfoVO.orderinfo_no }]
				</td>
				<td><img
					src="${orderInfoVO.productimg_image }"
					alt="상품 이미지" class="img-thumbnail" id="orderProductImage"></td>
				<td id="tableContents">${orderInfoVO.product_name } <br> [색상:${orderInfoVO.productoption_color }, <br>
					사이즈:${orderInfoVO.productoption_size }]
				</td>
				<td id="tableContents">${orderInfoVO.orderinfo_count }개</td>
				<td id="tableContents">${orderInfoVO.orderinfo_price }원</td>
				<c:choose>
					<c:when test="${orderInfoVO.orderinfo_state == 2 }">
				<td id="tableContents">배송 준비 중</td>
					</c:when> 
					<c:when test="${orderInfoVO.orderinfo_state == 3 }">
				<td id="tableContents">배송 중</td>
					</c:when>
					<c:when test="${orderInfoVO.orderinfo_state == 4 }">
				<td id="tableContents">배송 완료</td>
					</c:when>
					<c:otherwise>
				<td id="tableContents">오류 : 관리자에게 문의해주세요</td>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${orderInfoVO.orderinfo_state == 2 }">
						<td>
						<button type="button" class="btn btn-default" id="orderDeliveryButton" value="${orderInfoVO.orderinfo_no }">
						주문취소
						</button>
						</td>
					</c:when>
					<c:when test="${orderInfoVO.orderinfo_state == 3 }">
						<td id="tableContents">배송이 시작되어 취소가 불가능합니다.</td>
					</c:when>
					<c:when test="${orderInfoVO.orderinfo_state == 3 }">
						<td id="tableContents">배송이 완료되어 취소가 불가능합니다.</td>
					</c:when>
					<c:otherwise>
					<td id="tableContents">오류 : 관리자에게 문의해주세요</td>
					</c:otherwise>
				</c:choose>
			</tr>
			</c:forEach>
		</table>
		</c:when>
		<c:otherwise>
		<br> <br> <br> <br> <br> <br>
		<div style="text-align: center;">
			<label style="font-size: 14px;">주문 내역이 없습니다.</label> <br>
		</div>
		</c:otherwise>
		</c:choose>
		<br>
		<div class="pager">
				<!-- class="pagination" id="paging" -->
				<ul>
					<c:if test="${beginPage>1 }">
						<li><a
							href="/Project_MDS/${mall_domain }/orderdelivery?pageNo=${beginPage-1 }">◀</a>
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
									href="/Project_MDS/${mall_domain }/orderdelivery?&pageNo=${i }">${i }</a>
									<input type="hidden" name="pageNo" value="${i}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test='${endPage<total }'>
						<li><a
							href="/Project_MDS/${mall_domain }/orderdelivery?&pageNo=${endPage+1 }">▶</a>
							<input type="hidden" name="pageNo" value="${endPage+1}"></li>
					</c:if>
				</ul>

			</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
<script>

$("#orderDeliveryButton").on("click", function(){
	$(this).parents(".contenttr").remove();
	var orderinfo_no = $(this).val();
	$.ajax({
		url : "orderdeliverydelete",
		type : "POST",
		data : orderinfo_no,
		contentType : "application/json",
		success : function(url) {
			alert("주문이 성공적으로 취소되었습니다.");
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