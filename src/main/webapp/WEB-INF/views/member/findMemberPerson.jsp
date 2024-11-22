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
		let ut = '<c:out value="${ut}" />' || "P";
	    let fd = '<c:out value="${fd}" />';
	    let fm = '<c:out value="${fm}" />';
	</script>
	<script src="${pageContext.request.contextPath}/js/member.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<!-- 메인 -->
	<main id="findMember-main" >
		<!-- 아이디 찾기 -->
		<section id="findMember-section-id">
			<h1>개인회원 아이디 찾기</h1>
			
			<!-- 탭 -->
			<ul id="findMember-article-tab">
				<li onclick="changeFindMethod('email')">이메일 주소로 찾기</li>
				<li onclick="changeFindMethod('phone')">휴대폰 번호로 찾기</li>
			</ul>
		
			<!-- 이메일 주소로 찾기 -->
			<article id="findMember-article-email">
				<form id="findMember-form" action="${pageContext.request.contextPath}/findId.me?fm=email" method="POST">
					<input type="hidden" name="userType" value="P">
					
					<table>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" maxlength="15" spellcheck="false"></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td>
								<input type="email" name="email" spellcheck="false" placeholder="example@workdream.co.kr">
								<button type="button" id="btnConfirm">인증번호 발송</button>
							</td>
						</tr>
						<tr>
							<th>인증번호</th>
							<td>
								<input type="text" id="inputConfirm" maxlength="6" placeholder="인증번호 입력(6자리)" disabled>
								<div id="confirm-check">미인증</div>
							</td>
							
						</tr>
					</table>
					
					<input type="button" id="btnFindMember" value="아이디 조회">
				</form>
			</article>
			
			<!-- 휴대폰 번호로 찾기 -->
			<article id="findMember-article-phone">
				<form id="findMember-form" action="${pageContext.request.contextPath}/findId.me?fm=phone" method="POST">
					<input type="hidden" name="userType" value="P">
					
					<table>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" maxlength="15" spellcheck="false"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>
								<input type="text" name="phone" maxlength="11" spellcheck="false" placeholder="하이픈(-)없이 숫자만 입력">
								<button type="button" id="btnConfirm">인증번호 발송</button>
							</td>
						</tr>
						<tr>
							<th>인증번호</th>
							<td>
								<input type="text" id="inputConfirm" maxlength="6" placeholder="인증번호 입력(6자리)" disabled>
								<div id="confirm-check">미인증</div>
							</td>
						</tr>
					</table>
					
					<input type="button" id="btnFindMember" value="아이디 조회">
				</form>
			</article>
			
			<aside id="findMember-aside">
				<span>
					<a href="${pageContext.request.contextPath}/login">로그인</a>
					<b>&nbsp;|&nbsp;</b>
					<a href="${pageContext.request.contextPath}/findUser?ut=P&fd=pwd&fm=email">비밀번호 찾기</a>
				</span>
			
				<p>기업 회원이신가요? <a href="${pageContext.request.contextPath}/findUser?ut=B&fd=id&fm=email">기업회원 아이디 찾기</a></p>
			</aside>
		</section>
		
		<!-- 비밀번호 찾기 -->
		<section id="findMember-section-pwd">
			<h1>개인회원 비밀번호 찾기</h1>
			
			<!-- 탭 -->
			<ul id="findMember-article-tab">
				<li onclick="changeFindMethod('email')">이메일 주소로 찾기</li>
				<li onclick="changeFindMethod('phone')">휴대폰 번호로 찾기</li>
			</ul>
			
			<!-- 이메일 주소로 찾기 -->
			<article id="findMember-article-email">
				<form id="findMember-form" action="${pageContext.request.contextPath}/findPwd.me?fm=email" method="POST">
					<input type="hidden" name="userType" value="P">
					
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userId" maxlength="20" spellcheck="false"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" maxlength="15" spellcheck="false"></td>
						</tr>
						<tr>
							<th>이메일 주소</th>
							<td>
								<input type="email" name="email" spellcheck="false" placeholder="example@workdream.co.kr">
								<button type="button" id="btnConfirm">인증번호 발송</button>
							</td>
						</tr>
						<tr>
							<th>인증번호</th>
							<td>
								<input type="text" id="inputConfirm" maxlength="6" placeholder="인증번호 입력(6자리)" disabled>
								<div id="confirm-check">미인증</div>
							</td>
						</tr>
					</table>
					
					<input type="button" id="btnFindMember" value="비밀번호 조회">
				</form>
			</article>
			
			<!-- 휴대폰 번호로 찾기 -->
			<article id="findMember-article-phone">
				<form id="findMember-form" action="${pageContext.request.contextPath}/findPwd.me?fm=phone" method="POST">
					<input type="hidden" name="userType" value="P">
					
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="userId" maxlength="20" spellcheck="false"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="userName" maxlength="15" spellcheck="false"></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td>
								<input type="text" name="phone" maxlength="11" spellcheck="false" placeholder="하이픈(-)없이 숫자만 입력">
								<button type="button" id="btnConfirm">인증번호 발송</button>
							</td>
						</tr>
						<tr>
							<th>인증번호</th>
							<td>
								<input type="text" id="inputConfirm" maxlength="6" placeholder="인증번호 입력(6자리)" disabled>
								<div id="confirm-check">미인증</div>
							</td>
						</tr>
					</table>
					
					<input type="button" id="btnFindMember" value="비밀번호 조회">
				</form>
			</article>
			
			<aside id="findMember-aside">
				<span>
					<a href="${pageContext.request.contextPath}/login">로그인</a> |&nbsp;
					<a href="${pageContext.request.contextPath}/findUser?ut=P&fd=id&fm=email">아이디 찾기</a>
				</span>
			
				<p>기업 회원이신가요? <a href="${pageContext.request.contextPath}/findUser?ut=B&fd=pwd&fm=email">기업회원 비밀번호 찾기</a></p>
			</aside>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>