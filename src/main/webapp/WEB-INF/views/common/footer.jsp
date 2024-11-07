<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Footer</title>
	
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
</head>
<body>
	<!-- 푸터 -->
	<footer>
		<nav id="footer-nav">
			<ul>
				<li><a href="">회사소개</a></li>
	            <li><a href="">인재채용</a></li>
	            <li><a href="">회원약관</a></li>
	            <li><a href="">개인정보처리방침</a></li>
	            <li><a href="">이메일무단수정거부</a></li>
	            <li><a href="">고객센터</a></li>
			</ul>
		</nav>
		
		<address id="footer-address">
			<div class="logo-icon">
				<img src="${pageContext.request.contextPath}/img/logo_icon.png" alt="">
			</div>
			<div class="address-info">
				<ul>
					<li>워크드림 고객센터 02-0000-0000 (평일 09:00~19:00, 주말·공휴일 휴무)</li>
					<li>이메일 : help@workdream.co.kr, Fax : 02-0000-0000(대표), 02-0000-0000(세금계산서)</li>
					<li>(주)워크드림, 우 : 08378, 강남구 테헤란로 34길 43, 3층, 대표 : KH정보교육원</li>
					<li>사업자등록 : 000-00-00000, 직업정보제공사업 : 서울 관악 제 0000-0호, 통신판매업 : 제 0000-00000호</li>
					<li>Copyright (c) (주)워크드림. All rights reserved.</li>
				</ul>
			</div>
		</address>
	</footer>
</body>
</html>