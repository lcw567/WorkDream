<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 지원자 현황</title>
	
	<!-- 외부 css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicants.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
	<!-- 메인 -->
	<main id="applicantsStatus-main">
		<!-- 전체 현황 -->
		<section id="applicantsStatus-section-all">
			<table class="allStatus">
				<tr>
					<th>총 지원자</th>
					<th>열람완료</th>
					<th>평가완료</th>
					<th>합격</th>
					<th>열람미완료</th>
				</tr>
				<%-- 차후 DB 연결 후 수정 --%>
				<tr>
					<td>193</td>
					<td>100</td>
					<td>98</td>
					<td>0</td>
					<td>93</td>
				</tr>
			</table>
		</section>
		
		<!-- 포지션별 현황 -->
		<section id="applicantsStatus-section-position">
			<%-- DB 연결 후 수정, 진행 중인 공고가 없으면 진행 중인 공고가 없습니다 출력 --%>
			<article class="positionStatus">
				<h1>자바 웹개발자</h1>
				<table>
					<tr>
						<th>지원수</th>
						<th>열람완료</th>
						<th>평가완료</th>
						<th>합격자</th>
					</tr>
					<tr>
						<td>40</td>
						<td>20</td>
						<td>18</td>
						<td>0 / 1</td>
					</tr>
				</table>
				<a href="${pageContext.request.contextPath}/business/applicantsList">지원자 목록 &gt;</a>
			</article>
			<article class="positionStatus">
				<h1>DB 관리자</h1>
				<table>
					<tr>
						<th>지원수</th>
						<th>열람완료</th>
						<th>평가완료</th>
						<th>합격자</th>
					</tr>
					<tr>
						<td>30</td>
						<td>10</td>
						<td>10</td>
						<td>0 / 1</td>
					</tr>
				</table>
				<a href="${pageContext.request.contextPath}/business/applicantsList">지원자 목록 &gt;</a>
			</article><article class="positionStatus">
				<h1>그래픽 디자이너</h1>
				<table>
					<tr>
						<th>지원수</th>
						<th>열람완료</th>
						<th>평가완료</th>
						<th>합격자</th>
					</tr>
					<tr>
						<td>123</td>
						<td>70</td>
						<td>70</td>
						<td>0 / 1</td>
					</tr>
				</table>
				<a href="${pageContext.request.contextPath}/business/applicantsList">지원자 목록 &gt;</a>
			</article>
		</section>
	</main>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>