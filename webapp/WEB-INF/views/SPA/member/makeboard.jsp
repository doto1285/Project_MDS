<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모두의 쇼핑몰</title>
<!-- 공통 -->
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-3.1.1.js"></script>

<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="/Project_MDS/assets/dist/js/bootstrap.min.js"></script>
<link href="/Project_MDS/assets/css/SPA_main.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<!-- 개인 -->
<link href="/Project_MDS/assets/css/SPA_member.css" rel="stylesheet"
	type="text/css">
<!-- /개인 -->
</head>
<body>
	<c:import url='/WEB-INF/views/SPA/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPA/include/navigation.jsp' />
	<!-- 접속 url : http://localhost:8088/Project_MDS/SPA/12maket/makeboard -->

	<!-- 개인별 개발영역 시작 -->
	<div class="section" id="contents">
		<h3>게시판 관리</h3>
		<!-- --------------------------------------------- -->
		<div class="col-lg-10" id="margin50px">

			<table border="1" style="font-size: 20px">

				<%
					int count_order = 1;
				%>

				<!-- 게시판 목록 반복 -->
				<c:forEach items="${BoardListvo}" var="BoardListvo">
					<c:set var="cateno2" value="${BoardListvo.boardlist_no }" />
					<c:set var="cateName2" value=" ${BoardListvo.boardlist_name}" />
					<%
						count_order += 1;
					%>
					<tr data-boardlistno='${BoardListvo.boardlist_no}'
						data-boardlistname='${BoardListvo.boardlist_name}'
						data-writeaccessright='${BoardListvo.boardlist_write_accessright }'
						data-readaccessright='${BoardListvo.boardlist_read_accessright }'>

						<td width="300px"><label class="cateP">${BoardListvo.boardlist_name }</label></td>

						<td id="butd"><input type="button"
							class="btn_Up btn btn-primary btn-sm" value="위"> <input
							type="button" class="btn_Down btn btn-primary btn-sm" value="아래">

							<input type="button" class="btn_catePMod btn btn-warning btn-sm"
							data-toggle="modal" data-target="#modal_cateP" value="수정">

							<input type="button" class="btn_Delete btn btn-danger btn-sm"
							value="삭제"></td>
					</tr>
				</c:forEach>

				<!-- // 게시판 목록 반복 끝-->
				<!--  신규 카테고리 생성 -->
				<tr>
					<td colspan="4" width="600px" style="border: 4px solid red">

						<form id="join-form" name="modifyForm" method="GET"
							action="insertBoardList">
							<input type="hidden" id="count_order" name="count_order"
								value=<%=count_order%>>



							<div class="form-inline">

								<c:choose>
									<c:when test=' <%=count_order%> > 3'>

										<input id="newCategorie" name="newBoardList" type="text"
											placeholder="새 게시판 생성 (10자)" width="800px" value="">

										<SELECT name="write_accessright" class="form-control"
											id="select">
											<OPTION value="-1" selected>=쓰기권한=</OPTION>
											<OPTION value="2">관리자</OPTION>
											<OPTION value="1">회원</OPTION>
											<OPTION value="0">비회원</OPTION>
										</SELECT>
										<SELECT name="read_accessright" class="form-control"
											id="select">
											<OPTION value="-1" selected>=읽기권한=</OPTION>
											<OPTION value="2">관리자</OPTION>
											<OPTION value="1">회원</OPTION>
											<OPTION value="0">비회원</OPTION>
										</SELECT>
										<input type="submit" class="btn_catePMod btn btn-info btn-sm"
											value="삽입">

									</c:when>
									<c:otherwise>
										<center><p>게시판은 최대 3개까지만 등록 가능합니다.</p></center>
									</c:otherwise>
								</c:choose>


							</div>
						</form>
				</tr>
				<!--  // 신규 카테고리 생성 끝-->
			</table>
		</div>



		<!-- --------------------------------------------- -->
	</div>
	<c:import url='/WEB-INF/views/SPA/include/footer.jsp' />
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
				<h4 class="modal-title" id="exampleModalLabel">게시판 수정</h4>
			</div>
			<div class="modal-body">
				<form name="formmodal">
					<div class="form-group">
						<label for="recipient-name" class="control-label">변경할 게시판
							이름:</label> <input type="text" class="form-control" id="recipient_name">
					</div>

					<div class="col-lg-12 form-inline" id="modalacc">
						<label>쓰기 권환 :&nbsp; </label> <SELECT
							name="write_accessright_modify" class="form-control">
							<OPTION value="2">관리자</OPTION>
							<OPTION value="1">회원</OPTION>
							<OPTION value="0">비회원</OPTION>

						</SELECT>
					</div>
					<div class="col-lg-12 form-inline">
						<label> 읽기 권환 :&nbsp; </label> <SELECT
							name="read_accessright_modify" class="form-control">
							<OPTION value="2">관리자</OPTION>
							<OPTION value="1">회원</OPTION>
							<OPTION value="0">비회원</OPTION>
						</SELECT>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<div class="form-group" id="modalbtn">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn_catePModalSave btn btn-default"
						data-dismiss="modal">수정하기</button>
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
		var boardlistNo = $(this).parents("tr").data("boardlistno");
		console.log("처음" + boardlistNo);
	});

	$(".btn_catePMod")
			.on(
					"click",
					function() {
						var formmodal = document.formmodal;
						boardlistno = $(this).parents("tr").data("boardlistno");
						boardlistname = $(this).parents("tr").data(
								"boardlistname");
						writeaccessright = $(this).parents("tr").data(
								"writeaccessright");
						readaccessright = $(this).parents("tr").data(
								"readaccessright");

						$("#recipient_name").val(boardlistname);
						if (writeaccessright == 9) {
							formmodal.write_accessright_modify.selectedIndex = 0;
						} else if (writeaccessright == 1) {
							formmodal.write_accessright_modify.selectedIndex = 1;
						} else if (writeaccessright == 0) {
							formmodal.write_accessright_modify.selectedIndex = 2;
						}

						if (readaccessright == 9) {
							formmodal.read_accessright_modify.selectedIndex = 0;
						} else if (readaccessright == 1) {
							formmodal.read_accessright_modify.selectedIndex = 1;
						} else if (readaccessright == 0) {
							formmodal.read_accessright_modify.selectedIndex = 2;
						}

						console.log("수정버튼 클릭시: " + boardlistno + boardlistname
								+ writeaccessright + "" + readaccessright); //로그에 찍히는 부분

					});

	//모달창 저장 btn_catePModalSave
	$(".btn_catePModalSave").on(
			"click",
			function() {
				var formmodal = document.formmodal;
				boardlistname = $("#recipient_name").val();
				writeaccessright = formmodal.write_accessright_modify.value;
				readaccessright = formmodal.read_accessright_modify.value;
				console.log("변경할 번호 : " + boardlistno + boardlistname
						+ writeaccessright + readaccessright);

				if ((writeaccessright == -1) || (readaccessright == -1)) {
					alert("권한을 설정해주세요.");
					return;
				}

				//값 넘기기 ( 변경할 번호: boardlistno, 변경할 내용:boardlistname, 쓰기권한:writeaccessright.  읽기권한:readaccessright)
				$.ajax({
					url : "boardlistmodify",
					type : "POST",
					data : {
						"boardlistno" : boardlistno,
						"boardlistname" : boardlistname,
						"writeaccessright" : writeaccessright,
						"readaccessright" : readaccessright
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
		boardlistno = $(this).parents("tr").data("boardlistno");

		console.log("삭제 버튼 클릭시: " + boardlistno); //로그에 찍히는 부분
		$.ajax({
			//값 넘기기 ( 변경할 번호: boardlistno)
			url : "boardlistdelete",
			type : "POST",
			data : {
				"boardlistno" : boardlistno,
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
		boardlistno = $(this).parents("tr").data("boardlistno");

		console.log("up 버튼 클릭시: " + boardlistno); //로그에 찍히는 부분
		$.ajax({
			//값 넘기기 ( 변경할 번호: boardlistno)
			url : "boardlistUp",
			type : "POST",
			data : {
				"boardlistno" : boardlistno,
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
		boardlistno = $(this).parents("tr").data("boardlistno");

		console.log("up 버튼 클릭시: " + boardlistno); //로그에 찍히는 부분
		$.ajax({
			//값 넘기기 ( 변경할 번호: boardlistno)
			url : "boardlistDown",
			type : "POST",
			data : {
				"boardlistno" : boardlistno,
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




