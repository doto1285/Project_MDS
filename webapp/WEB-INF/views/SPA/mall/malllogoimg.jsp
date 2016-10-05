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
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>로고 이미지 관리</h3>
		<div class="form-group" id="inputFormGroup">
			<img src="/Project_MDS/assets/image/SPA_logo.png" alt="로고이미지"
				id="logoimg" class="img-thumbnail">
		</div>
		<div class="form-group" id="inputButton">
			<input class="btn btn-info" type="submit" value="첨부하기">
			<input class="btn btn-info" type="submit" value="파일삭제">
		</div>
	</div>
</body>
</html>