<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 테스트용 (차후 서블릿 연결 후에 수정됩니다)
	int menuNo = 1;
%>
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
    
    <!-- 외부 css / js 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <script>const contextPath = "${pageContext.request.contextPath}";</script>
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</head>
<body onload="activeMenu(<%=menuNo%>)">
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
    		
    		<%-- 로그인 메뉴 --%>
    		<c:choose>
    			<%-- 로그인(구직자) --%>
    			<c:when test="${ !empty loginUser && loginUser.getType == 'P' }">
    				<a href="#">로그아웃</a>
	    			<b>|</b>
	    			<a href="#">마이페이지</a>
    			</c:when>
    			
    			<%--로그인(기업) --%>
    			<c:when test="${ !empty loginUser && loginUser.getType == 'B' }">
    				<a href="#">로그아웃</a>
	    			<b>|</b>
	    			<a href="#">기업 홈</a>
    			</c:when>
    			
    			<%-- 로그인 전 --%>
    			<c:otherwise>
    				<div class="login-menu">
		    			<a href="#">로그인</a>
		    			<b>|</b>
		    			<a href="#">회원가입</a>
		    			<button id="btn-bizService">기업서비스 &#8744;</button>
		    		</div>
    			</c:otherwise>
    		</c:choose>
    	</nav>
    	
        <!-- 대메뉴 -->
        <nav id="header-nav-bottom">
        	<%-- 로그인 전 --%>
            <ul class="menu">
                <li id="menuButton"><a><img src="${pageContext.request.contextPath}/img/btn_menu.png" /></a></li>
                <li><a href="#">채용정보</a></li>
                <li><a href="#">공채정보</a></li>
                <li><a href="#">신입·인턴</a></li>
                <li><a href="#">기업·연봉</a></li>
                <li><a href="#">커리어</a></li>
                <li><a href="#">커뮤니티</a></li>
                <%-- 포토폴리오 메뉴 (구직자 로그인 전용) --%>
                <c:if test="${ !empty loginUser && loginUser.getType == 'P' }">
                	<li><a href="#">포토폴리오</a></li>
                </c:if>
            </ul>
        </nav>
    </header>
    
    <!-- 하위 메뉴 -->
</body>
</html>