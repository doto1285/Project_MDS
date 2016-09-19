<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<link href="/Project_MDS/assets/css/main.css" rel="stylesheet" type="text/css">
 
</head>
<body>



	<div id="container">
		<c:import url='/WEB-INF/views/TSF/include/header_top.jsp'/>
		<c:import url='/WEB-INF/views/TSF/include/header_search.jsp'/>
		<c:import url='/WEB-INF/views/TSF/include/header_tap.jsp'/>
 	<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<img id="profile" src="">		
				</div>
			</div>
		</div>
	</div>


		<!-- ------------------------------------------------------------------------ -->			
					
					

    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-1">
		<c:import url='/WEB-INF/views/TSF/include/main_left.jsp'/></div>
          <div class="col-md-10">
		<c:import url='/WEB-INF/views/TSF/include/main_center.jsp'/></div>
          <div class="col-md-1">
		<c:import url='/WEB-INF/views/TSF/include/main_right.jsp'/></div>
        </div>
      </div>
    </div>				
					
					
		<!-- ------------------------------------------------------------------------ -->	


		<c:import url='/WEB-INF/views/TSF/include/footer.jsp'/>
		
		
</body>
</html>