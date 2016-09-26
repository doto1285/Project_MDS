<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<script type="text/javascript"
	src="/Project_MDS/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function() {
	$(".outer_li").click(function() {
		if ($(this).children().css("display") == "block") {
			$(this).children().slideUp("500");
		} else {
			var showList = $(this).index();
			$(".inner_li").slideUp("500");
			$(".inner_li").eq(showList).slideDown("500");
		}
	});
})

</script>


</head>

<body>
	<div id="navigation">
	<h2><a href="main">메인으로</a></h2>
		<div class="accord_menu">
			<ul>
				<li class="outer_li">쇼핑몰관리
					<ul class="inner_li">
						<li><a href="mallinfo">쇼핑몰정보관리</a></li>
					</ul>
				</li>
				<li class="outer_li">카테고리관리
					<ul class="inner_li">
						<li><a href="category">카테고리정보관리</a></li>
					</ul>
				</li>
				<li class="outer_li">상품관리
					<ul class="inner_li">
						<li><a href="">상품 목록/검색</a></li>
					</ul>
				</li>
				<li class="outer_li">주문관리
					<ul class="inner_li">
						<li><a href="">주문목록/검색</a></li>
						<li><a href="">취소/교환/반품/환불</a></li>
					</ul>
				</li>
				<li class="outer_li">고객관리
					<ul class="inner_li">
						<li><a href="">고객목록/검색</a></li>
					</ul>
				</li>
				<li class="outer_li">고객센터
					<ul class="inner_li">
						<li><a href="">FAQ</a></li>
						<li><a href="">Q&A</a></li>
					</ul>
				</li>
			</ul>

		</div>

	</div>

</body>

</html>
