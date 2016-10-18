<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<html>
<head>

</head>


<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<li id="menu1"><a href="/Project_MDS/TSA/main/board/1">공지사항</a></li>

				<li id="menu2"><a href="/Project_MDS/TSA/main/board/usermanage">회원관리</a></li>

				<li id="menu3"><a href="/Project_MDS/TSA/main/board/shopmanage">쇼핑몰관리</a></li>
				
				<!-- <li id="menu3"><a href="/Project_MDS/TSA/main/board/2">고객센터</a></li>
				 -->
				 
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" id="menu4">고객센터
				<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li id="menu4"><a href="/Project_MDS/TSA/main/board/2">QNA</a></li>
						<li class="divider"></li>
						<li id="menu4"><a href="/Project_MDS/TSA/main/board/3">FAQ</a></li>
					</ul>
					</li>
					
		</div>
	</div>
	</nav>
</body>

</html>