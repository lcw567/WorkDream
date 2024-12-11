<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>지원자 현황 | 워크드림 - 기업서비스</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- 외부 css / js 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicants.css">
    <script>
    	var activeBizNo = 3;
    	var method = "${dashboard['METHOD']}";
    </script>
    <script src="${pageContext.request.contextPath}/js/applicants.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header_biz.jsp" />
	
	<!-- 메인 -->
	<main id="applicantsStatus-main">
		<!-- 전체 현황 -->
		<section id="applicantsStatus-section-all">
			<table class="allStatus">
				<tr>
					<th>총 지원자</th>
					<th>열람미완료</th>
					<th>열람완료</th>
					<th>평가완료</th>
					<th>합격</th>
				</tr>
				<%-- 차후 DB 연결 후 수정 --%>
				<tr>
					<td>${dashboard['TOTAL']}</td>
					<td>${dashboard['VIEW_NOT_FINISHED']}</td>
					<td>${dashboard['VIEW_COMPLETE']}</td>
					<td>${dashboard['EVALUATION_COMPLETE']}</td>
					<td>${dashboard['PASS_TOTAL']}</td>
				</tr>
			</table>
		</section>
		
		<!-- 포지션별 현황 -->
		<section id="applicantsStatus-section-position">
			<%-- 목록 수만큼 반복 출력 --%>
			<c:forEach var="position" items="${positionList}">
				<article class="positionStatus">
					<h1>${position.positionName}</h1>
					<table>
						<tr>
							<th>지원수</th>
							<th>열람완료</th>
							<th>평가완료</th>
							<th>합격자</th>
						</tr>
						<tr>
							<td>${position.totalPeople}</td>
							<td>${position.viewPeople}</td>
							<td>${position.evaluationPeople}</td>
							<td>${position.passPeople} / ${position.recruitedPeople}</td>
						</tr>
					</table>
					<a href="${pageContext.request.contextPath}/business/applicantsList?no=${position.recruitmentNo}&position=${position.positionNo}">지원자 목록 &gt;</a>
				</article>
			</c:forEach>
		</section>
	</main>
	
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>