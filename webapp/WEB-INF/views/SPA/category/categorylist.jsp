<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->


<!--  개인별 -->
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/TSF_board.css" rel="stylesheet"
	type="text/css">
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
				<td colspan="2" width="600px"><center>대분류</center></td>
			</tr>

			<%
				int count_order = 1;
			%>

			<!-- 1차 카테고리 반복 -->
			<c:forEach items="${categoryList}" var="categoryList">
				<c:if test='${categoryList.categorylist_depth == 1}'>
					<c:set var="cateno2" value="${categoryList.categorylist_no }" />
					<c:set var="cateName2" value=" ${categoryList.categorylist_name}" />
					<%
						count_order += 1;
					%>
					<tr data-cateno='${categoryList.categorylist_no}'
						data-catename='${categoryList.categorylist_name}'>
						<td><label class="cateP"><a
								href="${categoryList.categorylist_group}">${categoryList.categorylist_name }</a></label></td>
						<td><input type="button"
							class="btn_Up btn btn-primary btn-sm" value="위"> <input
							type="button" class="btn_Down btn btn-primary btn-sm" value="아래">
							<input type="button" class="btn_catePMod btn btn-primary btn-sm"
							data-toggle="modal" data-target="#modal_cateP" value="수정">

							<input type="button" class="btn_Delete btn btn-primary btn-sm"
							value="삭제"></td>
					</tr>
				</c:if>
			</c:forEach>

			<!-- // 1차 카테고리 반복 끝-->
			<!--  신규 카테고리 생성 -->
			<tr>
				<td colspan="2" width="600px" style="border: 4px solid red">

					<form id="join-form" name="modifyForm" method="GET"
						action="insertCategory">
								<input type="hidden" name="count_order" value=<%=count_order%>>
						<input id="newCategorie" name="newCategorie" type="text"
							placeholder="새 카테고리 생성" width="800px" value=""> <input
							type="submit" class="btn_catePMod btn btn-primary btn-sm"
							value="삽입">
					</form>
			</tr>
			<!--  // 신규 카테고리 생성 끝-->
		</table>


	</div>

	<div class="col-md-4" id="margin50px">


		<table border="1" style="font-size: 20px">
			<tr>
				<td colspan="2" width="700px"><center>소분류</center></td>
			</tr>

			<%
				count_order = 1;
			%>
			<!-- 2차 카테고리 반복 -->
			<c:forEach items="${categoryList}" var="categoryList">
				<c:if
					test='${categoryList.categorylist_depth ==2  && group_no == categoryList.categorylist_group  }'>
					<c:set var="cateno2" value="${categoryList.categorylist_no }" />
					<c:set var="cateName2" value=" ${categoryList.categorylist_name}" />
					<%
						count_order += 1;
					%>
					<tr data-cateno='${categoryList.categorylist_no}'
						data-catename='${categoryList.categorylist_name}'>
						<td><label class="cateP"><a
								href="${categoryList.categorylist_no}">${categoryList.categorylist_name }</a></label></td>
						<td><input type="button"
							class="btn_Up btn btn-primary btn-sm" value="위"> <input
							type="button" class="btn_Down btn btn-primary btn-sm" value="아래">
							<input type="button" class="btn_catePMod btn btn-primary btn-sm"
							data-toggle="modal" data-target="#modal_cateP" value="수정">

							<input type="button" class="btn_Delete btn btn-primary btn-sm"
							value="삭제"></td>
					</tr>
				</c:if>
			</c:forEach>
			<!-- / 2차 카테고리 반복 -->

			<c:choose>
				<c:when test='${group_no != 0}'>

					<!--  신규 카테고리 생성 -->
					<tr>
						<td colspan="2" width="600px" style="border: 4px solid red">

							<form id="join-form2" name="modifyForm2" method="GET"
								action="insertCategoryV2">
								<input type="hidden" name="count_order" value=<%=count_order%>>
								<input type="hidden" name="group_no" value='${group_no }'>

								<input id="newCategorie" name="newCategorie" type="text"
									placeholder="새 카테고리 생성" width="800px" value=""> <input
									type="submit" class=" btn btn-primary btn-sm" value="삽입">
							</form>
					</tr>
					<!--  // 신규 카테고리 생성 끝-->
				</c:when>

				<c:otherwise>
					<tr>
						<td><p>← 대분류를 선택하세요</p></td>
					</tr>

				</c:otherwise>
			</c:choose>
		</table>

	</div>

	<!-- --------------------------------------------- -->

</body>
</html>



<!-- 모달창 그리기 -->
<div class="modal fade" id="modal_cateP" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">New message</h4>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<label for="recipient-name" class="control-label">Recipient:</label>
						<input type="text" class="form-control" id="recipient_name">
					</div>
				</form>
			</div>


			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn_catePModalSave"
						data-dismiss="modal">Send message</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달창 그리기 끝 -->


<script>
	var catgory2 = "";
	var cateNo = "";
	var changecateNo = "";
	var cateName = "";
	var msgchangecateNo = "";

	$('#exampleModal').on('show.bs.modal', function(event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
		var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)

	})

	$(".cateP").on("click", function() {
		var cateNo = $(this).parents("tr").data("cateno");
		console.log("처음" + cateNo);
	});

	$(".btn_catePMod").on("click", function() {
		msgchangecateNo = $(this).parents("tr").data("cateno");
		msgchangeName = $(this).parents("tr").data("catename");

		$("#recipient_name").val(msgchangeName);

		console.log("수정버튼 클릭시: " + msgchangecateNo + msgchangeName); //로그에 찍히는 부분

	});

	//모달창 저장 btn_catePModalSave
	$(".btn_catePModalSave").on("click", function() {
		msgchangeName = $("#recipient_name").val();

		console.log("변경할 번호 : " + msgchangecateNo);
		console.log("변경 후 이름: " + msgchangeName);

		//값 넘기기 ( 변경할 번호: msgchangecateNo, 변경할 내용:msgchangeName)
		$.ajax({
			url : "../categorymodify",
			type : "POST",
			data : {
				"msgchangecateNo" : msgchangecateNo,
				"msgchangeName" : msgchangeName
			},
			dataType : "text",

			success : function(url) {
				//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.
				location.href = url;

			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}

		});
		alert("수정 완료");
	});
</script>

<script>
	//삭제버튼
	$(".btn_Delete").on("click", function() {
		msgchangecateNo = $(this).parents("tr").data("cateno");

		console.log("삭제 버튼 클릭시: " + msgchangecateNo); //로그에 찍히는 부분

		$.ajax({
			//값 넘기기 ( 변경할 번호: msgchangecateNo)
			url : "../categorydelete",
			type : "POST",
			data : {
				"msgchangecateNo" : msgchangecateNo,
			},
			dataType : "text",

			success : function(url) {
				//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.
				location.href = url;

			},
			error : function(jqXHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		alert("삭제 완료");
	});

	//위로 이동
	$(".btn_Up").on("click", function() {
		msgchangecateNo = $(this).parents("tr").data("cateno");

		console.log("up 버튼 클릭시: " + msgchangecateNo); //로그에 찍히는 부분

		$.ajax({
			//값 넘기기 ( 변경할 번호: msgchangecateNo)
			url : "../categoryUp",
			type : "POST",
			data : {
				"msgchangecateNo" : msgchangecateNo,
			},
			dataType : "text",

			success : function(url) {
				//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.
				location.href = url;

			},
			error : function(jqXHR, status, error) {
				alert("최상위 카테고리입니다");
			}
		});
	});

	//아래로 이동
	$(".btn_Down").on("click", function() {
		msgchangecateNo = $(this).parents("tr").data("cateno");

		console.log("up 버튼 클릭시: " + msgchangecateNo); //로그에 찍히는 부분

		$.ajax({
			//값 넘기기 ( 변경할 번호: msgchangecateNo)
			url : "../categoryDown",
			type : "POST",
			data : {
				"msgchangecateNo" : msgchangecateNo,
			},
			dataType : "text",

			success : function(url) {
				//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.
				location.href = url;

			},
			error : function(jqXHR, status, error) {
				alert("최하위 카테고리입니다");
			}
		});
	});
</script>


