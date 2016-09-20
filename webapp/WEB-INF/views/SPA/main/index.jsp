<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>


<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="" rel="stylesheet" type="text/css">
<title>mysite</title>
</head>
<body>
	<div id="container">
		<c:import url='/WEB-INF/views/SPA/include/header.jsp'/>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<h2>메인</h2>
					<p>
						리스트
					</p>
				</div>
			</div>
		</div>
		<c:import url='/WEB-INF/views/SPA/include/navigation.jsp'/>
	</div>
</body>
</html>