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
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">
	<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>

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
			<form id="login-form" name="loginform" method="post"
				action="/Project_MDS/main/Join">
				 <input type="hidden" value=1 name="member_distinction">
				 <h3>개인회원 가입</h3>
				<table>
					<tr>
						<td id="td-size">아이디</td>
						<td><input class="textbox1" id="textbox" name="member_id" type="text" value="">
						</td>
						<td style="padding-left: 15px">
							<button id="overlapButton">중복확인</button>
						</td>
					</tr>
					<tr>
						<td id="td-size">비밀번호</td>
						<td><input class="textbox2" id="textbox" type="password" value=""></td>
					</tr>
					<tr>
						<td id="td-size">비밀번호 확인</td>
						<td><input class="textbox3" id="textbox" name="member_password"
							type="password" value=""></td>
					</tr>
					<tr>
						<td id="td-size">이름</td>
						<td><input class="textbox4" id="textbox" name="member_name" type="text"
							value=""></td>
					</tr>
					<tr>
						<td id="td-size">주소</td>
						<td><input class="textbox5" id="textbox" name="member_address" type="text"
							placeholder=" 직접 입력해 주세요" value=""></td>
					</tr>
					<tr>
						<td id="td-size">이메일</td>
						<td><input class="textbox6" id="textbox" name="member_email" type="text"
							placeholder="형식에 맞게 입력해 주세요" value=""></td>
					</tr>
					<tr>
						<td id="td-size">핸드폰번호</td>
						<td><input class="textbox7" id="textbox" name="member_phone" type="text"
							placeholder=" - 없이 입력해 주세요" value=""></td>
					</tr>

					<tr>
						<td id="td-size">약관동의</td>
						<td><input type="checkbox" name="agreeProv1" value="y">
							<label>서비스 약관에 동의합니다.&nbsp&nbsp&nbsp&nbsp</label> <a type=href="/Project_MDS/main/#">
								내용확인</a></td>
					</tr>
					<tr>
						<td id="td-size">개인정보활용동의</td>
						<td><input type="checkbox" name="agreeProv2" value="y">
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







			<!-- 
			<div id="content">
				<div id="user">
					<p class="lead">개인 회원</p>

					<form id="join-form" name="joinForm" method="post"
						action="/mysite5/user/join">
						<label class="block-label" for="name">이름</label><input id="name"
							name="name" type="text" value=""> <br> <label
							class="block-label" for="email">이메일</label> <input id="email"
							name="email" type="text" value=""> <img
							id="image-checked" style="width: 16px; display: none"
							src="/mysite5/assets/images/check.png" /> <input type="button"
							id="btn-checkemail" value="id 중복체크"> <br> <label
							class="block-label">패스워드</label> <input name="password"
							type="password" value="">

						<fieldset>
							<legend>성별</legend>
							<label>여</label> <input type="radio" name="gender" value="FEMALE"
								checked="checked"> <label>남</label> <input type="radio"
								name="gender" value="MALE">
						</fieldset>

						<fieldset>
							<legend>약관동의</legend>
							<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
							<label>서비스 약관에 동의합니다.</label>
						</fieldset>

						<input type="submit" value="가입하기">
					</form>
				</div>
			</div>

 -->


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


</body>

<script>
	$('#overlapButton').on('click', function(){
		alert("가입 가능한 아이디입니다.");
	});
	
	$(function() {
		$("#login-form").submit(
				function() {
					//텍스트박스 체크
					if ($(".textbox1").val() == "") {
						alert("아이디를 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox2").val() == "") {
						alert("비밀번호를 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox3").val() == "") {
						alert("비밀번호 확인을 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox4").val() == "") {
						alert("이름을 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox5").val() == "") {
						alert("주소를 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox6").val() == "") {
						alert("이메일을 입력해주세요");
						return false;
					}
					//텍스트박스 체크
					if ($(".textbox7").val() == "") {
						alert("핸드폰번호를 입력해주세요");
						return false;
					}

					//체크박스 체크
					if ($("input:checkbox[name='agreeProv1']").is(":checked") == false ||
							$("input:checkbox[name='agreeProv2']").is(":checked") == false ) {
						alert("약관을 모두 동의해주세요.");
						return false;
					} 

				});
		});
	
</script>

</html>



