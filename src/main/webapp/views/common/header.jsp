<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    
    <!-- jQuery -->
    <script 
        src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
    <script
        src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js"
        integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM="
        crossorigin="anonymous"></script>
    
    <!-- 외부 css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script src="${pageContext.request.contextPath}/js/common.js"></script>
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
    			<input type="text" id="keyword" name="keyword" />
    			<button>
    				<img alt="검색" src="${pageContext.request.contextPath}/img/btn_search.png" />
    			</button>
    		</div>
    		<%-- 로그인 전 --%>
    		<div class="login-menu">
    			<a href="#">로그인</a>
    			<b>|</b>
    			<a href="#">회원가입</a>
    			<button id="btn-bizService">기업서비스 &#8744;</button>
    		</div>
    	</nav>
    	
        <!-- 대메뉴 -->
        <nav id="header-nav-bottom">
        	<%-- 로그인 전 --%>
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