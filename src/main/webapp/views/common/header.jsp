<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    
    <!-- 외부 css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
    <!-- 헤더 -->
    <header>
    	<!-- 로고, 검색창 등 -->
    	<nav id="header-nav-top">
    		<a class="logo-title" href="${pageContext.request.contextPath}">
    			<img alt="HOME" src="${pageContext.request.contextPath}/img/logo_title.png" />
    		</a>
    		<div class="searchBar">
    			<input type="text" name="keyword" />
    			<button>
    				<img alt="검색" src="${pageContext.request.contextPath}/img/btn_search.png" />
    			</button>
    		</div>
    		<div class="login-menu">
    			<a href="#">로그인</a>
    			<b>|</b>
    			<a href="#">회원가입</a>
    			<button id="btn-bizService">기업서비스 &#8744;</button>
    		</div>
    	</nav>
    	
        <!-- 대메뉴 -->
        <nav id="header-nav-bottom">
            <ul class="menu">
                <li><a href="#"><img src="${pageContext.request.contextPath}/img/btn_menu.png" /></a></li>
                <li><a href="#">공채정보</a></li>
                <li><a href="#">신입·인턴</a></li>
                <li><a href="#">기업·연봉</a></li>
                <li><a href="#">커리어</a></li>
                <li><a href="#">커뮤니티</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>