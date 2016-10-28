<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<link href="/Project_MDS/assets/dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="/Project_MDS/assets/css/TSF_main.css" rel="stylesheet"
	type="text/css">

</head>


<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top"  id = "margin50px"  role="navigation">
<div class="container">
	<!-- Brand and toggle get grouped for better mobile display -->

    
      <ul class="nav navbar-nav">
        <li class="active"><a href="/Project_MDS/main">홈 <span class="sr-only">(current)</span></a></li>
        
        <li><a href="/Project_MDS/main/choose_mall?mall_type=남성의류">남성의류</a></li>
        <li><a href="/Project_MDS/main/choose_mall?mall_type=여성의류">여성의류</a></li>
        <li><a href="/Project_MDS/main/choose_mall?mall_type=아동의류">아동의류</a></li>
        <li><a href="/Project_MDS/main/choose_mall?mall_type=빅사이즈">빅사이즈</a></li>
        
        <li class="dropdown">
    
        </li>
      </ul>
      
      <form class="navbar-form navbar-left" style = "padding-left_150px" role="search"   method="post"
				action="/Project_MDS/main/search_mall">
        <div class="form-group">
        
          <input type="text" name = "keyword" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    
	
	
	
	<!-- /.navbar-collapse -->
</div>
<!-- /.container --> </nav>