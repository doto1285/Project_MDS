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
<link href="/Project_MDS/assets/css/SPA_order.css" rel="stylesheet"
	type="text/css">
<!-- /개인 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>주문 검색</h3>
		<!-- 검색 미구현 -->
		<form class="form-inline" method="get" action="">
			<div class="form-group" id="inputFormGroup">
				<input name="" type="text" class="form-control" id="inputBox"
					value=""> <input class="btn btn-info" type="submit"
					value="검색">
			</div>
		</form>
		<br>
		<h3>주문목록</h3>
		<div class="col-lg-11">
			<table class="table" id="orderTable">

				<tr class="active">
					<td>주문 번호</td>
					<td>상품명(옵션)</td>
					<td>수량</td>
					<td>총 가격</td>
					<td>상태</td>
					<td>배송관리</td>
				</tr>

				<c:forEach var='vo' items='${map.orderlist}' varStatus='status'>
					<tr data-orderinfono='${vo.orderinfo_no}'
						data-orderinfostate='${vo.orderinfo_state}'>
						<td id="tableContents">${vo.orderinfo_no }</td>
						<td id="tableContents">${vo.orderinfo_address }</td>
						<td id="tableContents">${vo.orderinfo_count }개</td>
						<td id="tableContents">${vo.orderinfo_price }원</td>
						<td id="tableContents"><c:choose>
								<c:when test="${vo.orderinfo_state == 1 }">
								결제 전
							</c:when>
								<c:when test="${vo.orderinfo_state == 2 }">
								결제완료
							</c:when>
								<c:when test="${vo.orderinfo_state == 3 }">
								배송중
							</c:when>
								<c:when test="${vo.orderinfo_state == 4 }">
								배송완료
							</c:when>
							</c:choose></td>
						<td id="tableContents"><c:choose>
								<c:when test="${vo.orderinfo_state == 2 }">
									<input type="button" class="btn_Modify btn btn-info btn-sm"
										value="배송시작">
								</c:when>
								<c:when test="${vo.orderinfo_state == 3 }">
									<input type="button" class="btn_Modify btn btn-primary btn-sm"
										value="배송완료">
								</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>

			</table>
		</div>
		<div class="col-lg-11">
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
		</div>
	</div>
	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>
</html>

<script>
	var orderinfoNo = "";
	var orderinfoState = "";
	$(".btn_Modify").on("click", function() {
		orderinfoNo = $(this).parents("tr").data("orderinfono");
		orderinfoState = $(this).parents("tr").data("orderinfostate");

		console.log("배송관리 버튼 클릭시: " + orderinfoNo + orderinfoState); //로그에 찍히는 부분

		$.ajax({
			//값 넘기기 ( 삭제할 번호: productNo)
			url : "orderinfoModify",
			type : "POST",
			data : {
				"orderinfoNo" : orderinfoNo,
				"orderinfoState" : orderinfoState,
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
</script>