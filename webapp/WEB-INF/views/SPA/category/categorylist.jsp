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
	<div id="container">
		<h2>카테고리 관리</h2>
		<table>
			<tbody>
				<c:forEach var='vo1' items='${map.group}' varStatus='status'>
					<tr>
						<td>${vo1}</td>
						<c:set var="vo1" value='${vo1}' />
						<c:forEach var='vo2' items='${map.vo1}' varStatus='status'>
							<td>${vo2}</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="categorymodifyform">수정하기</a>
	</div>

</body>
</html>