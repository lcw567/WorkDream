<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 로그인</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

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
					<li class="On">개인회원</li>
					<li>기업회원</li>
				</ul>
				
				<!-- 회원 로그인 -->
				<form id="login-article-form" action="#" method="post">
					<input type="text" name="userId" placeholder="아이디" />
					<input type="password" name="userPwd" placeholder="비밀번호" />
					
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
						<a href="">회원가입</a>
					</div>
				</form>
				
				<!-- 소셜 로그인 -->
				<aside id="login-aside-sns">
					<h1>────────── 소셜 계졍으로 간편 로그인 ──────────</h1>
					
					<ol class="sns-list">
						<li>
							<button><img src="${pageContext.request.contextPath}/img/icon_noImg.png" /></button>
						</li>
						<li>
							<button>카카오톡</button>
						</li>
						<li>
							<button>구글</button>
						</li>
						<li>
							<button>페이스북</button>
						</li>
						<li>
							<button>애플</button>
						</li>
					</ol>
					
					<!-- 배너 광고 -->
					<div class="banner"></div>
				</aside>
			</article>
		</section>
		
		<!-- 기업회원 로그인 -->
		<section id="login-section-busimess" style="display: none;">
			<!-- 광고 -->
			<article>
			
			</article>
			
			<!-- 로그인 -->
			<article>
			
			</article>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>