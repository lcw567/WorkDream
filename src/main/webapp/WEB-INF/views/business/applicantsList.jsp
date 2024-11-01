<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>워크드림 | 지원자 목록</title>
	
	<!-- 외부 css 연결 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicants.css">
</head>
<body>
	<!-- 메인 -->
	<main id="applicantsList-main">
		<!-- 지원자 현황 페이지로 돌아가기 -->
		<a class="returnStatus" href="./applicantsStatus.jsp">&lt; 지원자 현황</a>
		
		<!-- 지원자 대시보드 -->
		<section id="applicantsList-section-board">
			<article class="postionInfo">
				<h2>자바 웹개발자</h2>
				<div>
					<h4>서류전형 심사</h4>
					<p>2024.10.31 ~ 2024.11.11</p>
					<h5>D - 12</h5>
				</div>
			</article>
			
			<article class="positionStats">
				<div>
					<h6>총 지원수</h6>
					<h1>40</h1>
				</div>
				
				<div>
					<h6>평가 완료</h6>
					<h1>18</h1>
				</div>
				
				<div>
					<h6>최종 합격</h6>
					<h1>0</h1>
				</div>
			</article>
		</section>
		
		<!-- 지원자 목록 -->
		<section id="applicantsList-section-list">
			<!-- 탭, 상단 버튼 -->
			<aside>
				<!-- 탭 -->
				<ul class="list-tab">
					<li class="On">전체</li>
				</ul>
				
				<!-- 필터 -->
			</aside>
			
			<!-- 목록 테이블 -->
			<article>
				<table class="list-table">
					<!-- 상단 -->
					<thead>
						<tr>
							<th>버튼자리</th>
							<th>전형단계</th>
							<th>이름 / 나이</th>
							<th>경력</th>
							<th>최종학력</th>
							<th>희망연봉</th>
							<th>지원일</th>
							<th>평가</th>
							<th>합격 여부</th>
						</tr>
					</thead>
					
					<!-- 목록 -->
					<tbody>
						<tr>
							<td>버튼이두개</td>
							<td>서류전형</td>
							<td>사진, 이름, 나이, 성별</td>
							<td>3년</td>
							<td>대학교(4년제) 졸업</td>
							<td>nnn만원</td>
							<td>2024.10.02</td>
							<td>9.3 / 10</td>
							<td>미분류</td>
						</tr>
					</tbody>
					
					<!-- 페이징바 -->
					<tfoot>
						<tr>
							<th colspan="9">1</th>
						</tr>
					</tfoot>
				</table>
				
			</article>
		</section>
	</main>
	
	<c:import url="/WEB-INF//views/common/footer.jsp" />
</body>
</html>