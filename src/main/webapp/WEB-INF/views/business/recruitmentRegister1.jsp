<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>채용공고 작성 | 워크드림</title>
	<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
	
	<!-- css / js -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/recruitmentRegister.css">
	<script>
		const contextPath = "${pageContext.request.contextPath}";
		var jobPosting = JSON.parse('${jobPostingJson}');
	</script>
	<script src="${pageContext.request.contextPath}/js/recruitmentRegister.js" defer></script>
</head>
<body>

	<!-- 메인 -->
	<main id="Job_Posting">
		<!-- 상단 -->
		<div id="Job_Posting_Registration">
			<h2>채용 공고 등록</h2>
		</div>
		
		<!-- 기업 정보 등록 -->
		<section id="Job_Posting_Registration_content">
		
			<!-- 진행 단계 -->
			<aside id="Job_Posting_Registration_Index">
				<img src="${pageContext.request.contextPath}/img/icon_number1.png">
				<p>기업 정보 입력</p>

				<hr>

				<img src="${pageContext.request.contextPath}/img/icon_number2(nonactivation).png">
				<p class="nonactivation">공고 정보 입력</p>
			</aside>
		
			<!-- 기업 정보 -->
			<article id="Job_Posting_Company_Information">
				<h2 class="Information_Title">기업 정보<font style="color: #FE0000">*</font></h2>
				
				<!-- 기업명 -->
				<div class="Information column">
					<h3>기업명</h3>
                    <input type="text" name="companyName" value="${jobPosting.companyName}" readonly>
                    <p>* 기업명 수정은 '기업 홈' > '기업 정보 관리'에서 가능합니다.</p>
				</div>
				
				<!-- 기업 로고 -->
				<div class="Information column">
					<h3>기업 로고</h3>
					<div class="Company_logo">
						<c:choose>
							<c:when test="${ !empty jobPosting.logo }">
								<img src="${pageContext.request.contextPath}${jobPosting.logo}">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/img/icon_noImg.png">
							</c:otherwise>
						</c:choose>
						
						<input type="hidden" name="logo" value="${jobPosting.logo}">
					</div>
					<p>* 최소 120 x 120px 이상, 1MB 이하의 정방형 이미지</p>
				</div>
				
				<!-- 홈페이지 주소 -->
				<div class="Information column">
					<h3>홈페이지 주소</h3>
					<span>
						<input type="text" name="site" value="${jobPosting.site}" placeholder="홈페이지 주소를 입력해주세요" readonly>
                    	<button type="button" id="editButton" onclick="enableWebsiteInput()">수정</button>
					</span>
					<p>* 채용 안내 사이트로만 변경 가능합니다.</p>
					<p>(변경된 정보는 기업 정보에 반영되지않습니다)</p>
				</div>
			</article>
		
			<!-- 담당자 정보 -->
			<article id="Job_Posting_Contact_Information">
				<h2 class="Information_Title">채용 담당자 정보<font style="color: #FE0000">*</font></h2>
				<p class="notice">공고에서 공개되지 않으며, 공고 내용을 검토 하면서 필요 시 관리자가 아래 연락처로 연락드릴 수 있습니다.</p>
			
				<!-- 정보 입력 -->
				<div class="Information">
					<h3>이름</h3>
                    <input type="text" name="managerName" value="${jobPosting.managerName}" placeholder="담당자 이름을 입력해주세요">
				</div>
				<div class="Information">
					<h3>부서</h3>
                    <input type="text" name="managerDept" value="${jobPosting.managerDept}" placeholder="담당 부서명을 입력해주세요">
				</div>
				<div class="Information">
					<h3>이메일</h3>
                    <input type="text" name="managerEmail" value="${jobPosting.managerEmail}" placeholder="이메일 주소를 입력해주세요">
				</div>
			</article>
			
		</section>
		
		<div id="Job_Posting_division_zones"></div>

		<div class="Next_Or_Back">
			<button class="Cancel_Push">취소</button>
			<button class="Next_Push" onclick="nextStep(1)">다음</button>
		</div>

	</main>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>