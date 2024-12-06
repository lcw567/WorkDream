<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>채용공고관리 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- css / js 연결 -->
	<script src="${pageContext.request.contextPath}/js/recruitmentManager.js" defer></script>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header_biz.jsp" />

	<!-- 메인 -->
	<main id="Recruitment_Manager">
		<section>
			<!-- 상단 탭 -->
			<aside id="Recruitment_StatusView">
				<!-- 진행상황 탭 -->
				<div class="status-link">
					<a href="#">진행중 ${statusMap['PROGRESS_COUNT']}</a>
					<a href="#">대기중 ${statusMap['STANDBY_COUNT']}</a>
					<a href="#">임시저장 ${statusMap['TEMP_COUNT']}</a>
					<a href="#">마감 ${statusMap['END_COUNT']}</a>
				</div>
				
				<!-- 상단 버튼 -->
				<button id="Registration_Button">공고 등록하기</button>
			</aside>
			
			<!-- 공고 목록 영역 -->
			<article id="Registration_containers">
				<%-- 아래 요소 반복 --%>
				<div class="Registration_First_Container">
					<div id="Registration_sava_bar">
						<h5>임시저장</h5>
						<div class="dropdown-container">
							<button class="dropdown-Button">
								<img src="${pageContext.request.contextPath}/img/kebab.png">
							</button>
							
							<ul class="dropdown-menu">
								<li><a href="#">공고 수정</a></li>
								<li><a href="#">공고 삭제</a></li>
								<li><a href="#">지원자 현황</a></li>
							</ul>
						</div>
					</div>
	
					<a id="Recruitment_Status_title" href="#">제목이 입력되지 않았습니다.</a>
					<div id="Recruitment_Status_Calender">
						<img src="${pageContext.request.contextPath}/img/calendar-blank.png">
						<h6>게시기간 입력 되지 않음</h6>
					</div>
				</div>
				
				<div class="Registration_First_Container">
					<div id="Registration_sava_bar">
						<h5>임시저장</h5>
						<div class="dropdown-container">
							<button class="dropdown-Button">
								<img src="${pageContext.request.contextPath}/img/kebab.png">
							</button>
							
							<ul class="dropdown-menu">
								<li><a href="#">공고 수정</a></li>
								<li><a href="#">공고 삭제</a></li>
								<li><a href="#">지원자 현황</a></li>
							</ul>
						</div>
					</div>
	
					<a id="Recruitment_Status_title" href="#">제목이 입력되지 않았습니다.</a>
					<div id="Recruitment_Status_Calender">
						<img src="${pageContext.request.contextPath}/img/calendar-blank.png">
						<h6>게시기간 입력 되지 않음</h6>
					</div>
				</div>
				
				<div class="Registration_First_Container">
					<div id="Registration_sava_bar">
						<h5>임시저장</h5>
						<div class="dropdown-container">
							<button class="dropdown-Button">
								<img src="${pageContext.request.contextPath}/img/kebab.png">
							</button>
							
							<ul class="dropdown-menu">
								<li><a href="#">공고 수정</a></li>
								<li><a href="#">공고 삭제</a></li>
								<li><a href="#">지원자 현황</a></li>
							</ul>
						</div>
					</div>
	
					<a id="Recruitment_Status_title" href="#">제목이 입력되지 않았습니다.</a>
					<div id="Recruitment_Status_Calender">
						<img src="${pageContext.request.contextPath}/img/calendar-blank.png">
						<h6>게시기간 입력 되지 않음</h6>
					</div>
				</div>

			</article>
		</section>
	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>