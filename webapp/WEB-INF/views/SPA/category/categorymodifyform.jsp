<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<title>모두의 쇼핑몰</title>
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<div class="section" id="contents">
		<h3>카테고리 관리</h3>
		<form class="board-form" method="post" action="categorymodify">
			<div class="form-group" id="inputFormGroup">
				<label for="inputEmail3" class="col-lg-4 control-label"
					id="inputText">1차 카테고리</label> <label for="inputEmail3"
					class="col-lg-4 control-label" id="inputText">2차 카테고리</label> <br>
			</div>


			<c:forEach var='vo1' items='${map.group}' varStatus='status'>
				<div class="form-group" id="inputFormGroup">
					 <input name = "mall_name" type="text"
					class="form-control" id="inputBox" value="${vo1}">
				</div>
			</c:forEach>
			<div class="form-group" id="inputButton"> <input
					type="hidden" name="" value="" /> <input
					class="btn btn-info" type="submit" value="저장하기">
			</div>
		</form>
	</div>

</body>
</html>