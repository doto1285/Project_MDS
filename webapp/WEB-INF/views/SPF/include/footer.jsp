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
	<footer class="section section-primary">
	<div class="container">
		<div class="row">
			<div class="col-lg-12" id="footer">
				<p>
					회사명 : ${mallVo.mall_companyname } &nbsp; 대표 : ${mallVo.mall_ceoname }
					&nbsp; 개인정보관리책임자 : ${mallVo.mall_dataofficer } &nbsp;&nbsp;사업자등록번호
					: ${mallVo.mall_licensee } &nbsp; 통신판매신고번호 : ${mallVo.mall_onlinemaketNo }
					&nbsp;&nbsp; <br> 사업장 주소&nbsp;: ${mallVo.mall_address } &nbsp;
					고객센터 : ${mallVo.mall_customerNo } &nbsp;&nbsp;팩스 :
					${mallVo.mall_faxNo }
				</p>
			</div>
		</div>
	</div>
	</footer>
</body>
</html>