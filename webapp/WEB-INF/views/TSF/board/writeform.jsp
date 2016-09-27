<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link href="/Project_MDS/assets/css/board.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/styles.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
</head>
<body>
	<div id="header">
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>
	<div id="wrapper">
		<div id="content">
			<nav id="nav">
			<div id="extra">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>
			</nav>
			<div>
				<nav id="nav1"> <!-- -------------------------------- -->


				<div id="content">
					<div id="board">
						<form class="board-form" method="post" action="write"
							enctype="multipart/form-data">
							<table class="tbl-ex">
								<tr>
									<th colspan="2">글쓰기</th>
								</tr>
								<tr>
									<td class="label">제목</td>
									<td><input type="text" name="title" value=""></td>
								</tr>
								<tr>
									<td class="label">내용</td>
									<td><textarea id="content" name="content"></textarea></td>
								</tr>
								<tr>
									<td class="label">첨부파일</td>
									<td><input type="file" name="file" value=""></td>
								</tr>
							</table>
							<div class="bottom">
								<a href="list">취소</a> <input type="submit" value="등록">
							</div>
						</form>
					</div>
				</div>


				<!-- -------------------------------- --> </nav>
			</div>
			<nav id="nav2">
			<div id="navigation">
				<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />

			</div>
			</nav>
		</div>
	</div>


	<div id="footer">
		<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
	</div>
</body>
</html>
