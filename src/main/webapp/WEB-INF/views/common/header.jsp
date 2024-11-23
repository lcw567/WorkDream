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
    <script>
	    <c:if test="${not empty sessionScope.alertMsg}">
	        alert("${sessionScope.alertMsg}");
	        <c:remove var="alertMsg" scope="session"/>
	    </c:if>
	</script>
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
    			<c:when test="${ !empty loginUser && loginUser.userType == 'P' }">
    				<div class="login-menu">
		    			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		    			<b>|</b>
		    			<a href="${pageContext.request.contextPath}/person/applicantsMypage">마이페이지</a>
		    		</div>
    			</c:when>
    			
    			<%--로그인(기업) --%>
    			<c:when test="${ !empty loginUser && loginUser.userType == 'B' }">
    				<div class="login-menu">
		    			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		    			<b>|</b>
		    			<a href="${pageContext.request.contextPath}/business/businessMypage">기업 홈</a>
		    		</div>
    			</c:when>
    			
    			<%-- 로그인 전 --%>
    			<c:otherwise>
    				<div class="login-menu">
		    			<a href="${pageContext.request.contextPath}/login">로그인</a>
		    			<b>|</b>
		    			<a href="${pageContext.request.contextPath}/registration">회원가입</a>
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
                <li><a href="${pageContext.request.contextPath}/board/communityHome">커뮤니티</a></li>
                <%-- 포토폴리오 메뉴 (구직자 로그인 전용) --%>
                <c:if test="${ !empty loginUser && loginUser.userType == 'P' }">
                	<li><a href="#">포토폴리오</a></li>
                </c:if>
            </ul>
        </nav>
    </header>
    
    <%-- 하위 메뉴 --%>
    <div id="header-dropdown">
    	<%-- 전체 메뉴 --%>
    	<table class="menu-table">
    		<tr>
    			<th>채용정보</th>
    			<td><a href="">지역별</a></td>
    			<td><a href="">직업별</a></td>
    			<td><a href="">역세권별</a></td>
    			<td><a href="">헤드헌팅</a></td>
    			<td><a href="">외국인 채용</a></td>
    		</tr>
    		<tr>
    			<th>공채정보</th>
    			<td><a href="">공채달력</a></td>
    			<td><a href="">공공기관 채용일정</a></td>
    		</tr>
    		<tr>
    			<th>신입·인턴</th>
    			<td><a href="">실시간 공고</a></td>
    			<td><a href="">채용달력</a></td>
    			<td><a href="">신입연봉</a></td>
    		</tr>
    		<tr>
    			<th>기업·연봉</th>
    			<td><a href="">기업리뷰</a></td>
    			<td><a href="">연봉정보</a></td>
    			<td><a href="">면접후기</a></td>
    		</tr>
    		<tr>
    			<th>커리어</th>
    			<td><a href="">합격자소서</a></td>
    			<td><a href="">인적성 면접후기</a></td>
    			<td><a href="">공기업 모의고사</a></td>
    			<td><a href="">문서 서식 자료</a></td>
    		</tr>
    		<tr>
    			<th>커뮤니티</th>
    		</tr>
    	</table>
    
    	<%-- 채용정보 --%>
    	<ul class="menu-list">
    		<li><a href="">지역별</a></li>
       		<li><a href="">직업별</a></li>
       		<li><a href="">역세권별</a></li>
       		<li><a href="">헤드헌팅</a></li>
       		<li><a href="">외국인채용</a></li>
    	</ul>
    	
    	<%-- 공채정보 --%>
    	<ul class="menu-list">
    		<li><a href="">공채달력</a></li>
       		<li><a href="">공공기관 채용일정</a></li>
    	</ul>
    	
    	<%-- 신입·인턴 --%>
    	<ul class="menu-list">
    		<li><a href="">실시간 공고</a></li>
       		<li><a href="">채용달력</a></li>
       		<li><a href="">신입연봉</a></li>
    	</ul>
    	
    	<%-- 기업·연봉 --%>
    	<ul class="menu-list">
    		<li><a href="">기업리뷰</a></li>
       		<li><a href="">연봉정보</a></li>
       		<li><a href="">면접후기</a></li>
    	</ul>
    	
    	<%-- 커리어 --%>
    	<ul class="menu-list">
    		<li><a href="">합격자소서</a></li>
       		<li><a href="">인적성 면접후기</a></li>
       		<li><a href="">공기업 모의고사</a></li>
       		<li><a href="">문서 서식 자료</a></li>
    	</ul>
    </div>
</body>
</html>