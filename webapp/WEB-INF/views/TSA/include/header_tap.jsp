<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
 <script type="text/javascript" src="/Project_MDS/assets/js/bootstrap.js"></script>
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li id="menu1"><c:forEach items="${GetBoardList }"
						var="GetBoardList">
						<a
							href="/Project_MDS/TSA/main/board/${GetBoardList.boardlist_no }">
					</c:forEach>공지사항</a></li>

				<li id="menu2"><a href="/Project_MDS/TSA/main/board/usermanage">회원관리</a></li>

				<li id="menu3"><a href="/Project_MDS/TSA/main/board/shopmanage">쇼핑몰관리</a></li>
				<li class="dropdown open">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true" id="menu4">고객센터
				<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li id="menu4"><a href="#">QNA</a></li>
						<li class="divider"></li>
						<li id="menu4"><a href="#">FAQ</a></li>
					</ul>
					</li>
		</div>
	</div>
	</nav>
</body>

</html>