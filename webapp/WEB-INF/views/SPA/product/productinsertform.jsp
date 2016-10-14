<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 쇼핑몰</title>
<!-- 공통 -->
<script type="text/javascript" src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet" type="text/css">
<!-- /공통 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>상품추가</h3>
		<div class="form-group" id="inputFormGroup">
			<img src="/Project_MDS/assets/image/SPA_main.png" alt="대문이미지"
				id="productmainimg" class="img-thumbnail">
		</div>
		<div class="form-group" id="inputButton">
			<input class="btn btn-info" type="submit" value="첨부하기">
			<input class="btn btn-info" type="submit" value="파일삭제">
		</div>
	</div>
</body>
</html>