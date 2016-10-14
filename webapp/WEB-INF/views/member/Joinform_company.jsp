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

		<div class="row" id="margin50px">

			<div class="col-md-3">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>

			<!-- 본문 시작-------------------------------------------- -->
			개인회원 가입 <input type="text" value=1 name="member_distinction">
			<form id="login-form" name="loginform" method="post"
				action="/Project_MDS/main/Join">
				<table>
					<tr>
						<td id="td-size">아이디</td>
						<td><input id="textbox" name="member_id" type="text" value="">
						</td>
						<td style="padding-left: 15px">
							<button>중복확인</button>
						</td>
					</tr>
					<tr>
						<td id="td-size">비밀번호</td>
						<td><input id="textbox" type="password" value=""></td>
					</tr>
					<tr>
						<td id="td-size">비밀번호 확인</td>
						<td><input id="textbox" name="member_password"
							type="password" value=""></td>
					</tr>
					<tr>
						<td id="td-size">이름</td>
						<td><input id="textbox" name="member_name" type="text"
							value=""></td>
					</tr>
					<tr>
						<td id="td-size">주소</td>
						<td><input id="textbox" name="member_address" type="text"
							placeholder=" 직접 입력 하세요 ㅋㅋ" value=""></td>
					</tr>
					<tr>
						<td id="td-size">이메일</td>
						<td><input id="textbox" name="member_email" type="text"
							placeholder="끝까지 똑바로 입력해라" value=""></td>
					</tr>
					<tr>
						<td id="td-size">핸드폰번호</td>
						<td><input id="textbox" name="member_phone" type="text"
							placeholder=" - 없이 입력해 주세요" value=""></td>
					</tr>
					<tr>
						<td id="td-size">사업자 등록 번호</td>
						<td><input id="textbox" name="member_licensee" type="text"
							placeholder=" - 없이 입력해 주세요" value=""></td>
					</tr>

					<tr>
						<td id="td-size">약관동의</td>
						<td><input type="checkbox" name="agreeProv" value="y">
							<label>서비스 약관에 동의합니다.&nbsp&nbsp&nbsp&nbsp</label> <a type=href="/Project_MDS/main/#">
								내용확인</a></td>
					</tr>
					<tr>
						<td id="td-size">개인정보활용동의</td>
						<td><input type="checkbox" name="agreeProv" value="y">
							<label>개인정보 활용에 동의합니다.&nbsp&nbsp&nbsp</label> <a type=href="/Project_MDS/main/#">
								내용확인 </td>
					</tr>

					<tr>
						<td><label style="padding-left: 50px"> <input
								type="submit" class="btn btn-success" value="가입하기"></label></td>


						<td><a class="btn btn-success"
							href="javascript:history.back(-1);">취소</a></td>
					</tr>




				</table>
			</form>
			
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