<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="utf-8">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>Vertical jQuery Accordion Nav Menu</title>
<meta name="author" content="Jake Rocheleau">
<link rel="shortcut icon" href="http://vandelaydesign.com/favicon.ico">
<link rel="icon" href="http://vandelaydesign.com/favicon.ico">
<link rel="stylesheet" type="text/css"
	href="/Project_MDS/assets/css/styles.css">
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Merienda:400,700">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" language="javascript" charset="utf-8"
	src="/Project_MDS/assets/js/nav.js"></script>
<!--[if lt IE 9]>
  <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
</head>

<body>
	<div id="w">
		<nav>
		<center>
			<ul id="nav">
					<p><span class="label label-primary">쇼핑몰 추천</span></p>
				<c:forEach items="${Random_MallList }" var="Random_MallList">
					<p><a href="${Random_MallList.mall_domain }" class="btn btn-default"
						${Random_MallList.mall_name }></a></p>
				</c:forEach>
			</ul>
				</center>
		</nav>
	</div>
</body>
</html>