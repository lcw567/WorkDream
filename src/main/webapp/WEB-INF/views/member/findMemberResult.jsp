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
	<script>
		let ut = '<c:out value="${findUser.userType}" />';
		let fd = '<c:out value="${fd}" />';
	    let fm = '<c:out value="${fm}" />';
	</script>
	<script src="${pageContext.request.contextPath}/js/member.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<!-- 메인 -->
	<main id="findResult-main">
		<c:choose>
			<%-- 기업용 --%>
			<c:when test="${findUser.userType == 'B'}">
				<section>
					<%-- 아이디 조회 결과 --%>
					<article id="findResult-article-id">
						<h1>기업회원 아이디 조회 결과</h1>
						
						<!-- 탭 -->
						<ul id="findResult-article-tab">
							<li>이메일 주소로 찾기</li>
							<li>휴대폰 번호로 찾기</li>
							<li>사업자등록번호로 찾기</li>
						</ul>
						
						<div id="findResult-article-div">
							<span><input type="text" name="userName" value="${findUser.userName}" readonly> 님의 아이디 :</span>
							<input type="text" name="userId" value="${findUser.userId}" readonly>
						</div>
						
						<aside id="findResult-aside">
							<span>
								<a href="${pageContext.request.contextPath}/login?ut=B">로그인</a>
								<b>&nbsp;|&nbsp;</b>
								<a href="${pageContext.request.contextPath}/findUser?ut=B&fd=pwd&fm=email">비밀번호 찾기</a>
							</span>
						
							<p>개인 회원이신가요? <a href="${pageContext.request.contextPath}/findUser?ut=P&fd=id&fm=email">개인회원 아이디 찾기</a></p>
						</aside>
					</article>
				
					<%-- 비밀번호 조회 결과 --%>
					<article id="findResult-article-pwd">
						<h1>기업회원 비밀번호 조회 결과</h1>
						
						<!-- 탭 -->
						<ul id="findResult-article-tab">
							<li>이메일 주소로 찾기</li>
							<li>휴대폰 번호로 찾기</li>
							<li>사업자등록번호로 찾기</li>
						</ul>
						
						<div>
							<input type="text" name="userId" value="${findUser.userName}" /> 님의 비밀번호는 
							<input type="text" name="userId" value="${findUser.userPwd}" />입니다.
						</div>
					</article>
				</section>
			</c:when>
			
			<%-- 구직자용 --%>
			<c:when test="${findUser.userType == 'P'}">
			
			</c:when>
		</c:choose>
	</main>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>