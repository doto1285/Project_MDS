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
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>쇼핑몰 정보관리</h3>
		<form class="board-form" method="post" action="mallmodify">

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">쇼핑몰 명</label> <input name="mall_name" type="text"
					class="form-control" id="inputBox" value="${mallVo.mall_name}">
			</div>

			<div id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">도메인 주소</label> <input type="text"
					class="form-control" id="inputBox" value="${mallVo.mall_domain}"
					disabled>
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">쇼핑몰 종류</label> <select name="mall_type"
					class="form-control" id="inputSelect">
					<option>남성의류</option>
					<option>여성의류</option>
					<option>아동의류</option>
				</select>
			</div>

			<br> <br>
			<h3>사업자 정보(쇼핑몰 Footer 내용)</h3>
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">사업자등록번호</label> <input name="mall_licensee"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_licensee}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">법인 명</label> <input name="mall_companyname"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_companyname}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">대표자 성명</label> <input name="mall_ceoname"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_ceoname}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">기본 사업장 주소</label> <input name="mall_address"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_address}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">연락처</label> <input name="mall_phone" type="text"
					class="form-control" id="inputBox" value="${mallVo.mall_phone}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">이메일</label> <input name="mall_email" type="text"
					class="form-control" id="inputBox" value="${mallVo.mall_email}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">쇼핑몰 계좌</label> <input name="mall_account"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_account}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">통신판매업 신고</label> <input name="mall_onlinemaketNo"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_onlinemaketNo}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">개인정보보호 책임자</label> <input name="mall_dataofficer"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_dataofficer}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">고객센터 번호</label> <input name="mall_customerNo"
					type="text" class="form-control" id="inputBox"
					value="${mallVo.mall_customerNo}">
			</div>

			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-2 control-label"
					id="inputText">팩스 번호</label> <input name="mall_faxNo" type="text"
					class="form-control" id="inputBox" value="${mallVo.mall_faxNo}">
			</div>
			<div class="form-group" id="inputButton">
				<input type="hidden" name="mall_no" value="${mallVo.mall_no }" /> <input
					class="btn btn-info" type="submit" value="수정하기">
			</div>
		</form>
	</div>
	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
</body>

</html>