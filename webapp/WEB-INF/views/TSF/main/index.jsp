<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link href="/Project_MDS/assets/css/styles.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
</head>
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>
	<div id="wrapper">
		<div id="content">
			<nav id="nav">
			<div id="extra">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>
			</nav>
			<div>
				<nav id="nav1"> <!-- -------------------------------- --> <c:choose>
					<c:when test='${empty authUser }'>
						<!-- 비회원일경우 표시되는 화면  -->
						<center>
							<p>아직 모두의 쇼핑몰 회원이 아니시군요?</p>
							<p>쇼핑몰을 만드시거나 이용하시려면</p>
							<p>모두의 쇼핑몰 로그인이 필요합니다.</p>

						</center>
					</c:when>

					<c:when test='${authUser.member_distinction == 0}'>
						<!-- 개인 회원일경우 표시되는 화면  -->
						<center>
							<p>내가 가입한 쇼핑몰</p>
							<br>
							<p>==================</p>
							<c:forEach items="${auth_MallList }" var="auth_MallList">

								<br>
								<a href="${auth_MallList.mall_domain }">${auth_MallList.mall_name }</a>
								<br>
							</c:forEach>
						</center>
					</c:when>


					<c:when test='${authUser.member_distinction == 9 }'>
						<!-- 기업 회원일경우 표시되는 화면  -->
						<center>
							<center>
								<p>admin login</p>
							</center>
						</center>
					</c:when>
				</c:choose> <!-- -------------------------------- --> </nav>
			</div>
			<nav id="nav2">
			<div id="navigation">
				<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />

			</div>
			</nav>
		</div>
	</div>

	<div class="container">
		<div id="footer">
			<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
		</div>
		</div>
</body>
</html>