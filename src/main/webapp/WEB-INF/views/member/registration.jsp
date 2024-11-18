<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- 외부 css / js 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css">
    <script src="${pageContext.request.contextPath}/js/common.js" defer></script>
</head>
<body>
	<!-- 헤더 -->
	<header class="mini">
		<nav>
			<ul id="mini-menu-left">
				<li>
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/logo_title.png" /></a>
				</li>
				<li>
					<h1>회원가입</h1>
				</li>
			</ul>
			
			<ul id="mini-menu-right">
				<li>
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/icon_home.png" /> 워크드림 홈</a>
				</li>
				<li>|</li>
				<li>
					<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/img/icon_office.png" /> 기업 홈</a>
				</li>
			</ul>
		</nav>
	</header>
	
	<!-- 메인 -->
	<main id="regist-main">
		<section>
			<article id="regist-article">
				<!-- 탭 -->
				<ul id="regist-article-tab">
					<li class="On">개인회원</li>
					<li onclick="location.href='${pageContext.request.contextPath}/registration?ut=B'">기업회원</li>
				</ul>
				
				<!-- 소셜 로그인 -->
				<h1>────────── 소셜 계졍으로 간편 회원가입 ──────────</h1>
				<ol class="sns-list">
					<li>
						<button><img src="${pageContext.request.contextPath}/img/icon_naver.png" /></button>
					</li>
					<li>
						<button><img src="${pageContext.request.contextPath}/img/icon_kakaotalk.png" /></button>
					</li>
					<li>
						<button><img src="${pageContext.request.contextPath}/img/icon_google.png" /></button>
					</li>
					<li>
						<button><img src="${pageContext.request.contextPath}/img/icon_facebook.png" /></button>
					</li>
					<li>
						<button><img src="${pageContext.request.contextPath}/img/icon_apple.png" /></button>
					</li>
				</ol>
				
				<!-- 회원가입 이동 -->
				<button class="btnRegist" onclick="location.href='${pageContext.request.contextPath}/registration?ut=P'">워크드림 통합 아이디 만들기</button>
				
				<p>
					이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/login">로그인</a>
				</p>
			</article>
		</section>
	</main>
</body>
</html>