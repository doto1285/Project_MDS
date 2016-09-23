<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="container">
		<div class="col-md-12">
			<ul class="nav nav-pills" id="secondCategoryMenu1">
				<!-- class="active" -->
				<li role="presentation" class="active"><a href="#"><strong>아우터</strong></a></li>
				<li role="presentation"><a href="#">자켓</a></li>
				<li role="presentation"><a href="#">가디건</a></li>
				<li role="presentation"><a href="#">집업</a></li>
				<li role="presentation"><a href="#">야상</a></li>
				<li role="presentation"><a href="#">코트</a></li>
				<li role="presentation"><a href="#">패딩</a></li>
				<li role="presentation"><a href="#">패딩조끼</a></li>
				<li role="presentation"><a href="#">점퍼&블루종</a></li>
				<li role="presentation"><a href="#">바람막이</a></li>
				<li role="presentation"><a href="#">무스탕</a></li>
			</ul>
			<hr>
			<ul class="nav nav-pills" id="priceArray">
					<li role="presentation"><a href="#">낮은가격 &nbsp; </a></li>
					<li role="presentation"><a href="#">높은가격</a></li>
				</ul>
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>