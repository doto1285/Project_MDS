<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/SPF_main.css" rel="stylesheet"
	type="text/css">
</head>
<body>

	<c:import url='/WEB-INF/views/SPF/include/header.jsp' />
	<c:import url='/WEB-INF/views/SPF/include/category.jsp' />

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<img src="/Project_MDS/assets/image/SPF_index1.png" alt="대문이미지"
						id="indexImage">
				</div>
				<div class="col-lg-8">
					<br>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample1.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>심장폭격!! 후리스후드!!</h4>
							<h5>
								<strong>17,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample2.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>데일리보카시</h4>
							<h5>
								<strong>6,900</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample3.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>20수 7부 무지티</h4>
							<h5>
								<strong>6,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample4.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>엠보단가라</h4>
							<h5>
								<strong>13,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample1.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>심장폭격!! 후리스후드!!</h4>
							<h5>
								<strong>17,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample2.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>데일리보카시</h4>
							<h5>
								<strong>6,900</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample3.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>20수 7부 무지티</h4>
							<h5>
								<strong>6,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample4.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>엠보단가라</h4>
							<h5>
								<strong>13,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample1.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>심장폭격!! 후리스후드!!</h4>
							<h5>
								<strong>17,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample2.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>데일리보카시</h4>
							<h5>
								<strong>6,900</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample3.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>20수 7부 무지티</h4>
							<h5>
								<strong>6,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample4.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>엠보단가라</h4>
							<h5>
								<strong>13,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample1.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>심장폭격!! 후리스후드!!</h4>
							<h5>
								<strong>17,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample2.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>데일리보카시</h4>
							<h5>
								<strong>6,900</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample3.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>20수 7부 무지티</h4>
							<h5>
								<strong>6,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample4.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>엠보단가라</h4>
							<h5>
								<strong>13,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample1.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>심장폭격!! 후리스후드!!</h4>
							<h5>
								<strong>17,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample2.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>데일리보카시</h4>
							<h5>
								<strong>6,900</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample3.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>20수 7부 무지티</h4>
							<h5>
								<strong>6,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3">
					<div class="thumbnail">
						<img src="/Project_MDS/assets/image/SPF_productSample4.png"
							alt="상품이미지" id="productImage">
						<div class="caption" id="productContents">
							<h4>엠보단가라</h4>
							<h5>
								<strong>13,500</strong><strong>원</strong>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<c:import url='/WEB-INF/views/SPF/include/footer.jsp' />
</body>
</html>