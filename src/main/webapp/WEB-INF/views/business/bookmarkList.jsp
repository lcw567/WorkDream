<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 구직자 즐겨찾기</title>
	
	<!-- 외부 css 연결 -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bookmark.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header_biz.jsp" />

	<!-- 메인 -->
	<main id="bookmark-main">
		<!-- 즐겨찾기 목록 -->
		<section>
			<!-- 그룹 탭 -->
			<ul id="bookmark-section-tab">
				<li class="On">전체 (48)</li>
				<li>보류 (25)</li>
				<li>스카웃 예정 (3)</li>
				<li>그룹3 (10)</li>
			</ul>
			
			<!-- 주의 문구 -->
			<aside id="bookmark-aside-caution">
				<img src="${pageContext.request.contextPath}/img/icon_caution.png" />
				<p>개인정보보호법에 따라 입사 지원자의 정보는 채용 이외의 용도로는 사용할 수 없습니다.</p>
				<a href="">가이드라인 &gt;</a>
			</aside>
			
			<!-- 목록 -->
			<article>
				<table>
					<tr>
						<td>버튼자리</td>
						<td>사진</td>
						<td>김아무개</td>
						<td>폴더 분류</td>
						<td>지원일 2024.11.05</td>
						<td>이력서 열람</td>
						<td>버튼들</td>
					</tr>
				</table>
			</article>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>