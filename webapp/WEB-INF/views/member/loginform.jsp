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
<link href="/Project_MDS/assets/css/TSF_admin_loginform.css" rel="stylesheet"
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

		<div class="row" id="margin50px" >

			<div class="col-md-3" style=" width: 230px;">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>

			<!-- 본문 시작-------------------------------------------- -->

								
										
			<div id="container">
				<div id="content">
					<div id="user">			
						<div class="form" style = "margin-left: 300px;">


							<form class="login-form" id="login-form" name="loginform"	method="post" action="/Project_MDS/main/login">
								<!-- <div class="col-lg-4">	 -->
									
									<input type="radio" name="member_distinction" value="1" checked="">  개인회원
								
										<input type="radio" name="member_distinction" value="2">기업회원
									
								<!-- </div> -->
								
									<input id="id" name="id" value="" type="text" placeholder="ID" /> 
									<input name="password" type="password" value="" placeholder="password" />
								<c:if test='${param.r == "fail" }'>
									<p>로그인이 실패 했습니다.</p>
								</c:if>
								
								<input type="submit" id="button" value="로그인">
								<p class="message"></p>
								<a href="/Project_MDS/main/joinform_choose" class="btn btn-success"> 회원가입</a>
							</form>
							
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