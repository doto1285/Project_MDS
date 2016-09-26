<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/css/main.css" rel="stylesheet"
	type="text/css">
</head>
<body>
	<div id="container">
		<div id="content">
			<div id="user">

				
				<form id="login-form" name="loginform" method="post"
					action="/Project_MDS/main/login">
					
					
				<!-- ------------------------------------------ -->

				<input type="radio"  name="member_distinction" checked="" value="0">개인 회원<br>
				 <input	type="radio"  name="member_distinction" value="1">기업 회원<br>
				<!-- ------------------------------------------ -->
				
				
					<label class="block-label">아이디</label> <input id="id" name="id"
						type="text" value=""> <label class="block-label">패스워드</label>
					<input name="password" type="password" value="">

					<c:if test='${param.r == "fail" }'>
						<p>로그인이 실패 했습니다.</p>
					</c:if>
					<input type="submit" value="로그인">
					<div class="form-group">
                <a href="" class="btn btn-default btn-block m-t-md"> 회원가입</a>
            </div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>