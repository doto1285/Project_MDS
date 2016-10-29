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
<link href="/Project_MDS/assets/css/SPF_product.css" rel="stylesheet"
	type="text/css">
<!-- /공통 -->
<title>모두의 쇼핑몰</title>

</head>
<body>
	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="container">
		<div class="col-md-12">
			<ul class="nav nav-pills" id="secondCategoryMenu1">
				<c:forEach items="${categoryGroupList }" var="categoryGroupList">
					<c:if test="${categoryGroupList.categorylist_depth == 1 }">
						<li role="presentation" class="active"><a href="#"><strong>${categoryGroupList.categorylist_name }</strong></a></li>
					</c:if>
				</c:forEach>
				<c:forEach items="${categoryGroupList }" var="categoryGroupList">
					<c:if test="${categoryGroupList.categorylist_depth == 2 }">
						<li role="presentation" id="secondCategoryMenu2nd"><a
							href="/Project_MDS/${mall_domain }/list?categorylist_no=${categoryGroupList.categorylist_no }&categorylist_group=${category_groupNo }&pageNo=1">${categoryGroupList.categorylist_name }</a></li>
					</c:if>
				</c:forEach>
			</ul>

			<hr>
			<br>
			<c:choose>
				<c:when test="${ empty categoryProductListVo }">
		</div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<h5 style="text-align: center; font-size: 14px;">
			<strong>등록된 상품이 없습니다.</strong>
		</h5>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br>
		</c:when>

		<c:otherwise>
			<ul class="nav nav-pills" id="priceArray">
				<li role="presentation"><a
					href="/Project_MDS/${mall_domain }/list?categorylist_no=${categoryListVo.categorylist_no }&categorylist_group=${category_groupNo }&sorting=lowprice">
						낮은가격 &nbsp; </a></li>
				<li role="presentation"><a
					href="/Project_MDS/${mall_domain }/list?categorylist_no=${categoryListVo.categorylist_no }&categorylist_group=${category_groupNo }&sorting=highprice">높은가격 &nbsp;</a></li>
				<li role="presentation"><a href="/Project_MDS/${mall_domain }/list?categorylist_no=${categoryListVo.categorylist_no }&categorylist_group=${category_groupNo }">등록일순</a></li>
			</ul>
			<c:forEach items="${categoryProductListVo }"
				var="categoryProductListVo" varStatus="status">
				<c:if test="${status.index%4==0 }">
					<div class="row"></div>
				</c:if>
				<div class="col-lg-3" id="productDiv">
					<a href="/Project_MDS/${mall_domain }/listdetail?product_no=${categoryProductListVo.product_no }"><div class="thumbnail">
						<img src="${categoryProductListVo.productimg_image }" alt="상품이미지"
							id="productImage">
						<div class="caption" id="productContents">
							<h4>${categoryProductListVo.product_name }</h4>
							<h5>
								<strong>${categoryProductListVo.product_price }</strong><strong>원</strong>
							</h5>
						</div>
					</div></a>
				</div>
			</c:forEach>



		</c:otherwise>
		</c:choose>
	</div>
	
	
			<div class="pager">
				<!-- class="pagination" id="paging" -->
				<ul>
					<c:if test="${beginPage>1 }">
						<li><a
							href="/Project_MDS/${mall_domain }/list?categorylist_no=${category_No }&categorylist_group=${category_groupNo }&pageNo=${beginPage-1 }&sorting=${sorting}">◀</a>
							<input type="hidden" name="pageNo" value="${beginPage-1 }">
						</li>
					</c:if>
					<c:forEach begin='${beginPage }' end='${endPage }' step='1' var='i'>
						<c:choose>
							<c:when test='${currentPage == i }'>
										<li class="selected">${i }</li>
							</c:when>
							<c:otherwise>
								<li><a
									href="/Project_MDS/${mall_domain }/list?categorylist_no=${category_No }&categorylist_group=${category_groupNo }&pageNo=${i }&sorting=${sorting}">${i }</a>
									<input type="hidden" name="pageNo" value="${i}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test='${endPage<total }'>
						<li><a
							href="/Project_MDS/${mall_domain }/list?categorylist_no=${category_No }&categorylist_group=${category_groupNo }&pageNo=${endPage+1 }&sorting=${sorting}">▶</a>
							<input type="hidden" name="pageNo" value="${endPage+1}"></li>
					</c:if>
				</ul>

			</div>
	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
<script>
 $(function(){
  var sBtn = $("#secondCategoryMenu1 > #secondCategoryMenu2nd");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
  sBtn.find("#secondCategoryMenu2nd").MouseDown(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
	$(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
  })
  sBtn.find("#secondCategoryMenu2nd").MouseUp(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
  })
 })
</script>
</html>
