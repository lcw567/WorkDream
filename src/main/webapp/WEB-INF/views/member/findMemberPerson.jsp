<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>아이디, 비밀번호 찾기 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- css / js 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css">
	<script src="${pageContext.request.contextPath}/js/member.js" defer></script>
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
					<h1>통합 로그인</h1>
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
	<main id="findMember-main" >
		<!-- 아이디 찾기 -->
		<section id="findMember-section-id">
			<h1>개인회원 아이디 찾기</h1>
			
			<!-- 탭 -->
			<ul id="findMember-article-tab">
				<li class="On">이메일 주소로 찾기</li>
				<li>휴대폰 번호로 찾기</li>
			</ul>
		
			<!-- 이메일 주소로 찾기 -->
			<article class="On">
				<form id="findMember-form" action="" method="POST">
					<input type="hidden" name="userType" value="P">
					
					<table>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" spellcheck="false"></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td><input type="email" name="email" spellcheck="false"></td>
						</tr>
					</table>
					
					<input type="button" id="btnFindMember" value="조회">
				</form>
			</article>
			
			<!-- 휴대폰 번호로 찾기 -->
			<article>
			
			</article>
		</section>
		
		<!-- 비밀번호 찾기 -->
		<section>
		
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>