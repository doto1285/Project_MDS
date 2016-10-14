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
		<div class="col-md-12">
			<ul class="nav nav-pills" id="secondCategoryMenu1">
				<!-- class="active" -->
				
				<c:if test="${categoryListVoGroup.categorylist_depth } == 1">
				<li role="presentation" class="active"><strong>{categoryListVoGroup.categorylist_name }</strong></li>
				</c:if>
				<c:if test="${categoryListVoGroup.categorylist_depth } == 2">
				<li role="presentation"><a href="#">${categoryListVoGroup.categorylist_name }</a></li>
				</c:if>
			</ul>
			
			<hr>
			<br>
			<c:choose>
				<c:when test="${ empty categoryProductListVo }">
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<h5 style="text-align: center; font-size: 14px;">
			<strong>등록된 상품이 없습니다.</strong>
		</h5>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		</c:when>

		<c:otherwise>
			<ul class="nav nav-pills" id="priceArray">
				<li role="presentation"><a
					href="lowprice?categorylist_no= ${categoryListVo.categorylist_no }">
						낮은가격 &nbsp; </a></li>
				<li role="presentation"><a
					href="highprice?categorylist_no= ${categoryListVo.categorylist_no }">높은가격</a></li>
			</ul>
			<c:forEach items="${categoryProductListVo }"
				var="categoryProductListVo" varStatus="status">
				<c:if test="${status.index%4==0 }">
					<div class="row"></div>
				</c:if>
				<div class="col-lg-3" id="productDiv">
					<div class="thumbnail">
						<img src="${categoryProductListVo.productimg_image }" alt="상품이미지"
							id="productImage">
						<div class="caption" id="productContents">
							<h4>${categoryProductListVo.product_name }</h4>
							<h5>
								<strong>${categoryProductListVo.product_price }</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</c:forEach>

			<nav>
			<ul class="pagination" id="paging">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">&laquo;</span>
				</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
			</nav>
		</c:otherwise>
		</c:choose>
	</div>
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>