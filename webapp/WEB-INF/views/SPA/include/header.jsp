<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

	<div class="section" id="header">
				<a href="mall"><img src="/Project_MDS/assets/image/SPA_header_logo.png"
					id="logoImage"></a> <a href='logout'><button
						type="button" class="btn btn-default" id="headerButton">로그아웃</button></a><label
					id="headerText"> 환영합니다. ${authUser.member_name } 운영자님.</label>
	</div>
