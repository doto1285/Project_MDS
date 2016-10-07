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
<link href="/Project_MDS/assets/css/SPF_member.css" rel="stylesheet"
	type="text/css">

<SCRIPT TYPE="TEXT/JAVASCRIPT" src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js">
	//<![CDATA[
	function check_input() {
		if (document.joinForm.enable.checked) {
			location.href = './joinComplete';
		} else {
			alert("약관을 동의해주세요.");
		}
	}
	//]]>
</SCRIPT>
</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="container" style="text-align: center">
		<label id="joinText">모두의 쇼핑몰 회원이시군요</label> <br> <label
			id="joinText">개인정보 이용 동의 후 쇼핑몰 이용이 가능합니다!</label> <br> <br>
		<br> <br> <label id="joinText">개인정보 이용 동의</label> &nbsp;
		&nbsp;
		<form method="post" name="joinForm">
			<label><input type="checkbox" name="enable" id="joinCheckBox"></label>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<button type="button" class="btn btn-default btn-sm">약관보기</button>
			<br> <br> <br> <br> <input
				class="btn btn-default btn-lg" type="submit" value="가입하기"
				onclick="check_input(); return false;" />
		</form>
	</div>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>