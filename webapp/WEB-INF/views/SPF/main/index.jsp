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
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="section">
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test='${empty mallimgVoLogo }'>
						<div class="col-lg-4">
							<img src="/Project_MDS/assets/image/SPF_index1.png" alt="대문이미지"
								id="indexImage">
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-lg-4">
							<img src="${mallimgVoGate.mallimg_image }" alt="대문이미지"
								id="indexImage">
						</div>
					</c:otherwise>
				</c:choose>

				<div class="col-lg-8">
					<br>
				</div>
			</div>
			<c:forEach items="${productListVo }" var="productListVo"
				varStatus="status">
				<c:if test="${status.index%4==0 }">
					<div class="row"></div>
				</c:if>
				<div class="col-lg-3" id="productDiv">
					<a
						href="/Project_MDS/${mall_domain }/listdetail?product_no=${productListVo.product_no }">
						<div class="thumbnail">
							<img src="${productListVo.productimg_image }" alt="상품이미지"
								id="productImage">
							<div class="caption" id="productContents">
								<h4>${productListVo.product_name }</h4>
								<h5>
									<strong>${productListVo.product_price }</strong><strong>원</strong>
								</h5>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>

		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>