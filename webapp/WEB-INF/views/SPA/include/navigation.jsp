<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>


<script type="text/javascript">
	$(function() {
		$("#accordian h3").click(function() {
			$("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
		});
	})
</script>


	<div class="section" id="navi">
		<div class='accordion'>
			<ul>
				<li><a href='mall'>쇼핑몰관리</a>
					<ul>
						<li><a href='mall'>쇼핑몰정보관리</a></li>
						<li><a href='malllogo'>로고이미지관리</a></li>
						<li><a href='mallmain'>대문이미지관리</a></li>
					</ul></li>
			</ul>
			<ul>
				<li><a href='category'>카테고리관리</a></li>
			</ul>
			<ul>
				<li><a href='product'>상품관리</a></li>
			</ul>
			<ul>
				<li><a href='order'>주문관리</a>
					<ul>
						<li><a href='order'>주문목록/검색</a></li>
						<li><a href='ordermanagement'>취소/교환/반품/환불</a></li>
					</ul></li>
			</ul>
			<ul>
				<li><a href='member'>고객관리</a></li>
			</ul>
			<ul>
				<li><a href='faq'>고객센터</a>
					<ul>
						<li><a href='faq'>FAQ</a></li>
						<li><a href='qna'>Q&A</a></li>
					</ul></li>
			</ul>
		</div>
	</div>


