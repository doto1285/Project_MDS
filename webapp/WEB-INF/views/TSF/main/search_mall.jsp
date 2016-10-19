<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div>
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>


	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-2" id="margin50px">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>

			<!-- 본문 시작-------------------------------------------- -->
			<div class="col-md-6" id="margin50px">
				<div class="thumbnail">

						
							<p class="lead">검색된 쇼핑몰</p>
							<br>
							<p>============================</p>
							<c:forEach items="${Search_mall }" var="Search_mall">

								<br>
								<a href="http://localhost:8088/Project_MDS/${Search_mall.mall_domain }/main">${Search_mall.mall_name }</a>
								<br>
								
							</c:forEach>
							
				<c:if test="${empty Search_mall}">
				검색된 쇼핑몰이 없습니다!!!
				</c:if>

				</div>
			</div>
			<!-- 본문 끝-------------------------------------------- -->
			<div class="col-md-3" id="margin50px">
				<div class="well">
					<div class="row">

						<p class="lead">추천 쇼핑몰</p>
						<c:forEach items="${Random_MallList }" var="Random_MallList">
							<a href="http://localhost:8088/Project_MDS/${Random_MallList.mall_domain }/main" class="list-group-item">${Random_MallList.mall_name }</a>
						</c:forEach>
						
						
					</div>
				</div>
			</div>


		</div>
	</div>
	<!-- /.container -->


	<div class="container">
		<hr>
		<!-- Footer -->
		<footer>
		<div class="row">
			<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>
