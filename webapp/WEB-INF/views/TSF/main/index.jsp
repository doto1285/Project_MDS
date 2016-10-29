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



					<c:choose>
						<c:when test='${empty authUser }'>
							<!-- 비회원일경우 표시되는 화면  -->
							<p class="lead">아직 모두의 쇼핑몰 회원이 아니시군요?</p>
							<p>쇼핑몰을 만드시거나 이용하시려면</p>
							<p>모두의 쇼핑몰 로그인이 필요합니다.</p>
							<br>
							
							<a class="btn btn-success" a href="/Project_MDS/main/loginfrom"> 로그인</a>
							<a class="btn btn-success" a href="/Project_MDS/main/joinform_choose"> 회원가입</a>
							

						</c:when>

						<c:when test='${authUser.member_distinction == 1}'>
							<!-- 개인 회원일경우 표시되는 화면  -->

							<center><h3>내가 가입한 쇼핑몰</h3></center>
							<p>&nbsp;====================================================================</p>
							<c:forEach items="${auth_MallList }" var="auth_MallList">

							
							<h4><p> &nbsp;&nbsp;<a href="/Project_MDS/${auth_MallList.mall_domain }/main">${auth_MallList.mall_name }</a></p> </h4>
							<h6><br></h6>
							</c:forEach>

						</c:when>


						<c:when test='${authUser.member_distinction == 2 }'>
							<!-- 기업 회원일경우 표시되는 화면  -->

							<h3>내가 개설한 쇼핑몰</h3>
							<p>&nbsp;====================================================================</p>
							<c:forEach items="${auth_MallList }" var="auth_MallList">

								<h4>&nbsp;&nbsp;<a href="/Project_MDS/SPA/${auth_MallList.mall_domain }/mall">${auth_MallList.mall_name }</a></h4>
								<h6><br></h6>
							</c:forEach>

						</c:when>


						<c:when test='${authUser.member_distinction == 9 }'>
							<!-- admin일경우 표시되는 화면  -->
							<h3>admin 로그인</h3>

						</c:when>
					</c:choose>

				</div>
			</div>


			<div class="col-md-3" id="margin50px">
				<div class="well">
					<div class="row">

						<p class="lead">추천 쇼핑몰</p>
						<c:forEach items="${Random_MallList }" var="Random_MallList">
							<a href="/Project_MDS/${Random_MallList.mall_domain }/main" class="list-group-item">${Random_MallList.mall_name }</a>
						</c:forEach>
						
						
					</div>
				</div>
			</div>


			<!-- 본문 끝-------------------------------------------- -->
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
