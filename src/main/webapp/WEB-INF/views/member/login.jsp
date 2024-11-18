<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String userType = request.getParameter("ut");
	if(userType == null) {
		userType = "P";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- css / js 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member.css">
	<script>let ut = "<%=userType%>"</script>
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
	<main id="login-main">
		<!-- 개인회원 로그인 -->
		<section id="login-section-person">
			<!-- 광고 영역 -->
			<article id="login-article-ad">
				 대충 광고
			</article>
			
			<!-- 로그인 영역 -->
			<article>
				<!-- 탭 -->
				<ul id="login-article-tab">
					<li class="On" onclick="changeUserType('P')">개인회원</li>
					<li onclick="changeUserType('B')">기업회원</li>
				</ul>
				
				<!-- 회원 로그인 -->
				<form id="login-article-form" action="${pageContext.request.contextPath}/login.me" method="post">
					<input type="text" id="loginId" name="userId" inputmode="text" autocorrect="off" autocapitalize="none" placeholder="아이디" required />
					<input type="password" id="loginPwd" name="userPwd" inputmode="text" autocorrect="off" autocapitalize="none" placeholder="비밀번호" required />
					<input type="hidden" name="userType" value="P" />
					
					<div class="loginOption">
						<label for="loginChk1">
							<input type="checkbox" id="loginChk1" />
							<span></span>&nbsp;로그인 유지
						</label>
						<label for="loginChk2">
							<input type="checkbox" id="loginChk2" />
							<span></span>&nbsp;아이디 저장
						</label>
					</div>
					
					<input type="submit" value="로그인" />
					
					<div class="loginOther">
						<a href="">아이디 찾기</a> |&nbsp;
						<a href="">비밀번호 찾기</a> |&nbsp;
						<a href="${pageContext.request.contextPath}/registration">회원가입</a>
					</div>
				</form>
				
				<!-- 소셜 로그인 -->
				<aside id="login-aside-sns">
					<h1>────────── 소셜 계졍으로 간편 로그인 ──────────</h1>
					
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
					
					<!-- 배너 광고 -->
					<div class="banner"></div>
				</aside>
			</article>
		</section>
		
		<!-- 기업회원 로그인 -->
		<section id="login-section-business">
			<!-- 광고 -->
			<article>
				기업용 광고
			</article>
			
			<!-- 로그인 영역 -->
			<article>
				<!-- 탭 -->
				<ul id="login-article-tab">
					<li onclick="changeUserType('P')">개인회원</li>
					<li class="On" onclick="changeUserType('B')">기업회원</li>
				</ul>
				
				<!-- 기업 로그인 -->
				<form id="login-article-form" action="#" method="post">
					<input type="text" id="loginId" name="userId" inputmode="text" autocorrect="off" autocapitalize="none" placeholder="아이디" required />
					<input type="password" id="loginPwd" name="userPwd" inputmode="text" autocorrect="off" autocapitalize="none" placeholder="비밀번호" required />
					<input type="hidden" name="userType" value="B" />
					
					<div class="loginOption">
						<label for="loginChk3">
							<input type="checkbox" id="loginChk3" />
							<span></span>&nbsp;아이디 저장
						</label>
					</div>
					
					<input type="submit" value="로그인" />
					
					<div class="loginOther">
						<a href="">아이디 찾기</a> |&nbsp;
						<a href="">비밀번호 찾기</a> |&nbsp;
						<a href="${pageContext.request.contextPath}/registration?ut=B">회원가입</a>
					</div>
				</form>
				
				<!-- 소셜 로그인 -->
				<aside id="login-aside-sns">
					<h1>────────── 소셜 계졍으로 간편 로그인 ──────────</h1>
					
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
					
					<!-- 배너 광고 -->
					<div class="banner"></div>
				</aside>
			</article>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>