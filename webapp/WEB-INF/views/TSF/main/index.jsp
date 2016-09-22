<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta charset="utf-8">
<link href="/Project_MDS/assets/css/ex.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/mycss.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/main.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">

<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

</head>
<body data-spy="scroll">
	<div id="container">
		<div id="header">
			<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		</div>
		<div id="wrapper">
			<div id="content">
				<center>
					<p>아직 모두의 쇼핑몰 회원이 아니시군요?</p>
					<p>쇼핑몰을 만드시거나 이용하시려면</p>
					<p>모두의 쇼핑몰 로그인이 필요합니다.</p>
					<p>
						<button>로그인</button>
						<button>회원가입</button>
					</p>
				</center>
			</div>
		</div>
		<div id="navigation">
			<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />

		</div>
		<div id="extra">
			<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
		</div>
		<div id="footer">
			<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
		</div>
	</div>

</body>
</html>
