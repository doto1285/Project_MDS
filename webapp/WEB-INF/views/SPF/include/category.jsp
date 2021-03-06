<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">

</head>
<body>

	<div class="container" id="category">
		<nav class="navbar navbar-default">
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav" id="categoryMenu1">
					<!-- class="active" -->

					<c:forEach items="${categoryList1st }" var="categoryList1st">
						<c:set value="${categoryList1st.categorylist_group}" var="msg" />
						<li id="categoryMenu2"><c:if
								test="${categoryList1st.categorylist_depth  == 1
									and not empty categoryList1st.categorylist_name }">
								<a style="cursor: pointer" id="category1st"> ${ categoryList1st.categorylist_name}
								</a>
							</c:if>
							<ul id="categoryMenu3">
								<c:forEach items="${categoryList2nd }" var="categoryList2nd">
									<li><h4><a
										href="list?categorylist_no=${categoryList2nd.categorylist_no }
										&categorylist_group=${categoryList2nd.categorylist_group }">
											<c:if
												test="${categoryList2nd.categorylist_depth  == 2 
									and categoryList2nd.categorylist_group == categoryList1st.categorylist_group}">
									${ categoryList2nd.categorylist_name}
											</c:if>
									</a></h4></li>
								</c:forEach>
							</ul></li>
					</c:forEach>


				</ul>
			</div>
		</nav>
	</div>

</body>
</html>