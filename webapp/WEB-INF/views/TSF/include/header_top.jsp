<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  
  <head>
    <meta charset="UTF-8">
  </head>
  
  <body>
    <div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><span>Brand</span></a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
              <a href="#">Home</a>
            </li>
  
            
            <li>
              <a href="/Project_MDS/main/login">로그인</a>
            </li>
            <li>
              <a href="#">회원가입</a>
            </li>
            
            
            <li>
              <a href="#">회원정보수정</a>
            </li>
            <li>
              <a href="#">로그아웃</a>
            </li>
            
            <!-- 
				<c:choose>
					<c:when test='${empty authUser }'>
						<li><a href="/mysite5/user/loginform">로그인</a></li>
						<li><a href="/mysite5/user/joinform">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mysite5/user/modifyform">회원정보수정</a></li>
						<li><a href="/mysite5/user/logout">로그아웃</a></li>
						<li>${authUser.name }님 안녕하세요 ^^;</li>
					</c:otherwise>
				</c:choose>
             -->
            
          </ul>
        </div>
      </div>
    </div>
  </body>

</html>