<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<title>모두의 쇼핑몰</title>
</head>
<body>
	<div id="container">
		<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<h2>카테고리 관리</h2>
					<table>
						<tbody>
						<c:forEach var='vo' items='${categoryListVo }' varStatus='status'>
							<tr>
								<td>${vo.categorylist_name }</td>
							</tr>
						</c:forEach>
							<tr>
								<td>배송준비중</td>
								<td>배송중</td>
								<td>환불 전</td>
								<td>새게시글</td>
							</tr>
							<tr>
								<td>미구현</td>
								<td>미구현</td>
								<td>미구현</td>
								<td>미구현</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	</div>
</body>
</html>