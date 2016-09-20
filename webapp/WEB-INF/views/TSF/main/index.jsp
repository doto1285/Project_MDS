<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
    <meta charset="utf-8">
     
<link href="/Project_MDS/assets/css/bootstrap.css" rel="stylesheet"
	type="text/css">
	

<link href="/Project_MDS/assets/css/mycss.css" rel="stylesheet"
	type="text/css">
	 
	
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

</head>
<body data-spy="scroll">

<div id="header">
<div id="container">
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_search.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div></div>
<div id="wrapper">
<div id="content">
<p>로그인 안했을때</p>
</div>
</div>
<div id="navigation">
<p><strong>오른쪽</strong> </div>
<div id="extra">
<p>왼쪽</p>
</div>
<div id="footer"><c:import url='/WEB-INF/views/TSF/include/footer.jsp' /></div>



	


	<!-- ------------------------------------------------------------------------ -->



	<div class="row">
		<div class="col-md-2">
			<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
		</div>
		<div class="col-md-6">

			<!-- 본문 부분 ------------------------------------------------------------------------ -->

			

			<!-- 본문 부분 ------------------------------------------------------------------------ -->

		</div>
		<div class="col-md-2">
			<c:import url='/WEB-INF/views/TSF/include/main_right.jsp' />
		</div>
	</div>


	<!-- ------------------------------------------------------------------------ -->


	


</body>
</html>