<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->


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
			<form id="login-form" name="loginform" method="post"
				action="/Project_MDS/main/modify_member">
			<input type="hidden" value="${authUser.member_no }" name="member_no">
			<input type="hidden" value="${authUser.member_distinction }" name="member_distinction">
			
				<table>
					<tr>
						<td id="td-size">아이디</td>
						<td>${authUser.member_id }
						</td>
					</tr>
					<tr>
						<td id="td-size">비밀번호</td>
						<td><input id="member_password" name = "member_password" disabled
						type="password" value="${authUser.member_password }">
						<input type ="button" class ="change" data-target="#modal_changepw" data-toggle="modal"  value = "변경하기">
						</td>
					</tr>
					
					<tr>
						<td id="td-size">이름</td>
						<td><input id="member_name" name="member_name" type="text"
							value="${authUser.member_name }"></td>
					</tr>
					<tr>
						<td id="td-size">주소</td>
						<td><input id="textbox" name="member_address" type="text"
							placeholder=" 직접 입력 하세요 " value="${authUser.member_address }"></td>
					</tr>
					<tr>
						<td id="td-size">이메일</td>
						<td><input id="textbox" name="member_email" type="text"
							placeholder="형식에 맞게 입력해 주세요" value="${authUser.member_email }""></td>
					</tr>
					<tr>
						<td id="td-size">핸드폰번호</td>
						<td><input id="textbox" name="member_phone" type="text"
							placeholder=" - 없이 입력해 주세요" value="${authUser.member_phone }""></td>
					</tr>

					<tr>
						<td><label style="padding-left: 50px"> <input
								type="submit" class="btn btn-success" value="수정완료"></label></td>

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


<!-- 모달창 그리기 -->
<div class="modal fade" id="modal_changepw" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">비밀번호 변경</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">변경할 비밀번호
					</label> <input type="text" class="form-control" id="change_pw" values="">
					
					<div class="form-group">
						<label for="recipient-name" class="control-label">비밀번호 확인
					</label> <input type="text" class="form-control" id="check" values="">
					
					</div>
				</form>
			</div>


			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn_pwSave btn btn-default"
						data-dismiss="modal">적용</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 그리기 끝 -->

<script>
$(".change").on("click", function() {

	event.preventDefault();
	console.log("비밀번호 클릭 "); //로그에 찍히는 부분

});


$(".btn_pwSave").on("click", function() {

	change_pw = $("#change_pw").val();
	check = $("#check").val();
	
	if(change_pw == check){
		console.log("비밀번호 같음 " + change_pw +" " + check); //로그에 찍히는 부분
		$("#member_password").val(change_pw);
		
	}
	else{
		console.log("틀림");
		alert("비밀번호가 일치하지 않습니다");
	}
	
	$("#change_pw").val("");
	$("#check").val("");

});

</script>




