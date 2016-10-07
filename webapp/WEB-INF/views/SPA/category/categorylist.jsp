<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- 공통 -->
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>
<!-- /공통 -->

<!--  개인별 -->
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"	type="text/css">
<link href="/Project_MDS/assets/css/TSF_board.css" rel="stylesheet"	type="text/css">
<!--  /개인별 -->




<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>모두의 쇼핑몰</title>
</head>


<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />

	
	<!-- 개인별 개발영역 시작 -->
	<h3>카테고리 관리</h3>
	<!-- --------------------------------------------- -->
	<div class="col-md-4" id="margin50px">

		<table border="1" style="font-size: 20px">
			<tr>
				<td colspan="2" width="700px"><center>대분류</center></td>
			</tr>
			
			<!-- 반복 -->
			<tr data-cateno="1">
				<td><label  class="cateP">첫번째</label></td>
				<td><input type="button" class="up" value="위">
					<input type="button" class="down" value="아래">
					<input type="button" class="btn_catePMod btn btn-primary btn-sm" data-toggle="modal" data-target="#modal_cateP" value="수정">
					<input type="button" class="test" value="삭제">
				</td>
			</tr>
			
			<tr data-cateno="2">
				<td><label class="cateP" >두번째</label></td>
				<td><input type="button" class="up" value="위">
					<input type="button" class="down" value="아래">
					<input type="button" class="btn_catePMod" value="수정">
					<input type="button" class="test" value="삭제">
				</td>
			</tr>
			
			<tr data-cateno="3">
				<td><label class="cateP" >세번째</label></td>
				<td><input type="button" class="up" value="위">
					<input type="button" class="down" value="아래">
					<input type="button" class="btn_catePMod" value="수정">
					<input type="button" class="test" value="삭제">
				</td>
			</tr>
			
			<tr data-cateno="4">
			
				<td><label class="cateP" >네번째</label></td>
				<td><input type="button" class="up" value="위">
					<input type="button" class="down" value="아래">
					<input type="button" class="btn_catePMod" value="수정">
					<input type="button" class="test" value="삭제">
				</td>
			</tr>

			<!-- /반복 -->


		</table>

	</div>

	<div class="col-md-4" id="margin50px">


		<table border="1" style="font-size: 20px">
			<tr>
				<td colspan="2" width="700px"><center>소분류</center></td>
			</tr>
			<tr>
				<td>이름 들어감</td>
				<td>버튼 들어감</td>
			</tr>
		</table>

	</div>





	<!-- --------------------------------------------- -->



<!-- 부모카테고리 수정 모달창 -->
<div class="modal fade" id="modal_cateP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>






</body>


</html>







<script>
$(".cateP").on("click", function(){
	var cateNo = $(this).parents("tr").data("cateno");
	console.log(cateNo);
}); 	
	

$(".btn_catePMod").on("click", function(){
	var cateNo = $(this).parents("tr").data("cateno");
	console.log(cateNo);
}); 	
		
	
</script>
