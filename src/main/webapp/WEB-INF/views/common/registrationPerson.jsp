<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- 외부 css / js 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
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
					<h1>개인 회원가입</h1>
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
	<main id="registPerson-main">
		<h1>워크드림 통합 개인회원 가입</h1>
		
		<section>
			<form id="registPerson-form" action="#" method="post">
				<h2>개인회원</h2>
				<input type="hidden" name="userType" value="P" />
				
				<h6>아이디 (필수)</h6>
				<span>
					<input type="text" id="registId" name="userId" placeholder="4~20자리 / 영문 소문자, 숫자, 특수문자 '_'만 사용 가능" />
					<button type="button">중복확인</button>
				</span>
				<p><img src="${pageContext.request.contextPath}/img/icon_check.png" />사용가능한 아이디입니다.</p>
				<p class="error"><img src="${pageContext.request.contextPath}/img/icon_error.png" />중복된 아이디입니다.</p>
				
				<h6>비밀번호 (필수)</h6>
				<input type="password" id="registPwd" name="userPwd" placeholder="8~16자리 / 영문 대소문자, 숫자, 특수문자 조합" />
				
				<h6>비밀번호 확인 (필수)</h6>
				<input type="password" placeholder="비밀번호 재입력" />
				<p class="error"><img src="${pageContext.request.contextPath}/img/icon_error.png" />비밀번호가 틀립니다.</p>
				
				<h6>이메일 (필수)</h6>
				<input type="email" id="registEmail" name="email" placeholder="email@workdream.co.kr" />
				
				<h6>휴대전화</h6>
				<input type="text" name="phone" id="registPhone" placeholder="'-'없이 숫자로만 입력" />
				
				<input type="submit" id="btnRegist" value="회원가입" disabled />
			</form>
		</section>
	</main>
</body>
</html>