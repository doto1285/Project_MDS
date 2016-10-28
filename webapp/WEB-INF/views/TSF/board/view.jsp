<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->


<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">
<link href="/Project_MDS/assets/css/TSF_board.css" rel="stylesheet"
	type="text/css">

<title>Shop Item - Start Bootstrap Template</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<div>
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp' />
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp' />
	</div>


	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<div class="col-md-3" id="margin50px">
				<c:import url='/WEB-INF/views/TSF/include/main_left.jsp' />
			</div>

			<!-- 본문 시작-------------------------------------------- -->

			<div id="content">
				<div id="board" class="board-form" id="margin50px">
					<table class="tbl-ex" id="margin50px">
						<tr>
							<th colspan="2">글보기</th>
						</tr>
						<tr>
							<td>제목</td>
							<td>${GetBoardContent.board_title}</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<div class="view-content">${GetBoardContent.board_content}</div>
							</td>
						</tr>

					</table>



					<div class="bottom" data-board_no='${GetBoardContent.board_no}'>
						<a href="${GetBoardContent.boardlist_no }">목록</a>
						<c:if test='${not empty authUser }'>
							<a href="replyform/${GetBoardContent.board_no }">답글</a>
							<a data-toggle="modal" data-target="#check_pw" class="btn_modify">글수정</a>
							<a data-toggle="modal" data-target="#check_pw" class="btn_delete">삭제</a>
						</c:if>


					</div>
				</div>
			</div>

			<!-- 본문 끝-------------------------------------------- -->

		</div>

	</div>
	<!-- /.container -->



	<div class="container">

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<c:import url='/WEB-INF/views/TSF/include/footer.jsp' />
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>


<!-- 모달창 그리기 -->
<div class="modal fade" id="check_pw" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="exampleModalLabel">비밀번호 확인</h4>
			</div>
			<div class="modal-body">
				<form name="formmodal">
					<div class="form-group">
						<label for="recipient-name" class="control-label">비밀번호:</label> <input
							type="text" class="form-control" id="pw">
					</div>

				</form>
			</div>

			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn_check btn btn-default"
						data-dismiss="modal">확인</button>
				</div>
			</div>

			<input type="text" id='check_motion' value="">

		</div>
	</div>
</div>
<!-- 모달창 그리기 끝 -->


<script>
	//글 수정시 비밀번호 입력
	$(".btn_modify").on("click", function() {
		var formmodal = document.formmodal;
		board_no = $(this).parents("div").data("board_no");
		$('#check_motion').val("modify");

		console.log("상태: " + check_motion); //로그에 찍히는 부분
		console.log("버튼 클릭시: " + board_no); //로그에 찍히는 부분
	});
</script>


<script>
	//글 삭제시 비밀번호 입력
	$(".btn_delete").on("click", function() {
		var formmodal = document.formmodal;
		board_no = $(this).parents("div").data("board_no");

		$('#check_motion').val("delete");

		console.log("수정버튼 클릭시: " + board_no); //로그에 찍히는 부분
	});
</script>

<!--  modify?no=${GetBoardContent.board_no }  -->
<script>
<!-- 비밀번호 입력 시 -->
	$(".btn_check")
			.on(
					"click",
					function() {

						var pw = $("#pw").val();
						var check_motion = $("#check_motion").val();

						if (check_motion == 'modify') {
							console.log("글 수정");
							/////////////////
							$.ajax({
										url : "checkpw",
										type : "POST",
										data : {
											"board_no" : board_no,
											"pw" : pw
										},
										dataType : "text",

										success : function(boo) {
											//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.

											if (boo == 'true') {
												location.href = "/Project_MDS/main/board/modifyform?board_no="
														+ board_no;
											} else {
												alert("비밀번호가 틀렸습니다");
											}

										},
										error : function(jqXHR, status, error) {
											consloe.log("error: " + error);
										}
									});
							///////////////////
						}
						if ('delete' == check_motion) {
							//글 삭제 
							console.log("글 삭제");
							$
									.ajax({
										url : "checkpw",
										type : "POST",
										data : {
											"board_no" : board_no,
											"pw" : pw
										},
										dataType : "text",

										success : function(boo) {
											//ajax가 성공했을때, 컨트롤러에서 리턴받는 url로 페이지를 최신화 시킨다.

											if (boo == 'true') {
												location.href = "/Project_MDS/main/board/delete?board_no="
														+ board_no;
											} else {
												alert("비밀번호가 틀렸습니다");
											}

										},
										error : function(jqXHR, status, error) {
											consloe.log("error: " + error);
										}
									});
						}

					});
</script>