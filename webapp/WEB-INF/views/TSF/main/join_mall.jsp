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
			<!-- 안넣은것 - mall_style,  -->
			<form id="login-form" name="loginform" method="post"
				action="/Project_MDS/main/insert_mall">
				
			<input type="hidden" value="${authUser.member_no}" name="member_no">
				<br> <br>
				<table>
					<tr>
						<td><p6><center> 쇼핑몰 개설하기</center> </p6></td>
					</tr>
					<tr>
						<td id="td-size">쇼핑몰 이름</td>
						<td><input class="textbox1" id="textbox" name="mall_name"
							type="text" value=""></td>

					</tr>
					<tr>
						<td id="td-size">도메인</td>
						<td><input class="textbox2" id="textbox" name="mall_domain"
							type="text" value=""></td>

						<td style="padding-left: 15px">
							<button id="overlapButton">중복확인</button>
						</td>
					</tr>
					<tr>
						<td id="td-size">쇼핑몰 종류</td>
						<td><SELECT name="mall_type" id="selectType">
								<OPTION value="-1" selected>=쇼핑몰 종류=</OPTION>
								<OPTION value="남성의류">남성의류</OPTION>
								<OPTION value="여성의류">여성의류</OPTION>
								<OPTION value="아동의류">아동의류</OPTION>
								<OPTION value="빅사이즈">빅사이즈</OPTION>
						</SELECT></td>


					</tr>
					<tr>
						<td id="td-size">사업자 등록번호</td>
						<td><input class="textbox3" id="textbox" name="mall_licensee"
							type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">법인 이름</td>
						<td><input class="textbox4" id="textbox"
							name="mall_companyname" type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">법인 대표자 이름</td>
						<td><input class="textbox5" id="textbox" name="mall_ceoname"
							type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">사업장 주소</td>
						<td><input class="textbox6" id="textbox" name="mall_address"
							type="text" placeholder="직접 입력해 주세요" value=""></td>
					</tr>
					<tr>
						<td id="td-size">쇼핑몰 연락처</td>
						<td><input class="textbox7" id="textbox" name="mall_phone"
							type="text" placeholder=" - 없이 입력해 주세요" value=""></td>
					</tr>
					<tr>
						<td id="td-size">쇼핑몰 이메일</td>
						<td><input class="textbox8" id="textbox" name="mall_email"
							type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">쇼핑몰 계좌번호</td>
						<td><input class="textbox9" id="textbox" name="mall_account"
							type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">통신판매신고번호</td>
						<td><input class="textbox10" id="textbox"
							name="mall_onlinemaketNo" type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">개인정보책임자</td>
						<td><input class="textbox11" id="textbox"
							name="mall_dataofficer" type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">고객센터 번호</td>
						<td><input class="textbox12" id="textbox"
							name="mall_customerNo" type="text" value=""></td>
					</tr>
					<tr>
						<td id="td-size">팩스 번호</td>
						<td><input class="textbox13" id="textbox" name="mall_faxNo"
							type="text" value=""></td>
					</tr>

					<tr>
						<td id="td-size">약관동의</td>
						<td><input type="checkbox" name="agreeProv1" value="y"
							onclick="check_input(); return false;"> <label>서비스
								약관에 동의합니다.&nbsp&nbsp&nbsp&nbsp</label> <a type=href="/Project_MDS/main/#">
								내용확인</a></td>
					</tr>
					<tr>
						<td id="td-size">개인정보활용동의</td>
						<td><input type="checkbox" name="agreeProv2" value="y"
							onclick="check_input(); return false;"> <label>개인정보
								활용에 동의합니다.&nbsp&nbsp&nbsp</label> <a type=href="/Project_MDS/main/#">
								내용확인 </td>
					</tr>

					<tr>
						<td><label style="padding-left: 50px"> <input
								type="submit" class="btn btn-success" id="btnSuccess"
								value="가입하기"></label></td>


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


</body>
<script>

$('#overlapButton').on('click', function(){
	alert("가입 가능한 도메인 주소입니다.");
});

$(function() {
	$("#login-form").submit(
			function() {
				//텍스트박스 체크
				if ($(".textbox1").val() == "") {
					alert("쇼핑몰 이름을 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox2").val() == "") {
					alert("쇼핑몰 도메인을 입력해주세요");
					return false;
				}
				
				//셀렉박스 체크
				if($("#selectType option:selected").val() == -1){
					alert("쇼핑몰 종류를 선택해주세요.");
					return false;
				}
				
				//텍스트박스 체크
				if ($(".textbox3").val() == "") {
					alert("사업자등록번호를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox4").val() == "") {
					alert("법인 이름을 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox5").val() == "") {
					alert("법인 대표자 이름을 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox6").val() == "") {
					alert("사업장 주소를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox7").val() == "") {
					alert("쇼핑몰 연락처를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox8").val() == "") {
					alert("쇼핑몰 이메일을 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox9").val() == "") {
					alert("쇼핑몰 계좌번호를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox10").val() == "") {
					alert("통신판매신고번호를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox11").val() == "") {
					alert("개인정보책임자를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox12").val() == "") {
					alert("쇼핑몰 고객센터 번호를 입력해주세요");
					return false;
				}
				//텍스트박스 체크
				if ($(".textbox13").val() == "") {
					alert("팩스번호를 입력해주세요");
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
