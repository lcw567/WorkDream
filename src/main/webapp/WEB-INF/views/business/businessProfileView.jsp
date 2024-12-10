<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 프로필 보기</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/businessProfileView.css">
    <!-- window.contextPath 설정 -->
    <script type="text/javascript">
        window.contextPath = "${pageContext.request.contextPath}";
    </script>
    <script src="${pageContext.request.contextPath}/js/businessProfileView.js" defer></script>
    
</head>
<body>
    <c:choose>
	    <c:when test="${not empty sessionScope.loginUser && sessionScope.loginUser.userType == 'B'}">
	        <!-- 기업회원일 경우 -->
	        <c:import url="/WEB-INF/views/common/header_biz.jsp" />
	    </c:when>
	    <c:otherwise>
	        <!-- 일반회원 또는 비로그인일 경우 -->
	        <c:import url="/WEB-INF/views/common/header.jsp" />
	    </c:otherwise>
	</c:choose>

    
    <main class="profile-view-container">
        <div class="profile-header">
            <h2>기업 프로필</h2>
            <div class="action-buttons">
                <!-- 로그인 상태일 때만 '기업 정보 수정' 버튼 표시 -->
				<c:if test="${not empty sessionScope.loginUser
				    and sessionScope.loginUser.userType eq 'B'
				    and sessionScope.loginUser.businessNo eq business.businessNo}">
				    <a href="${pageContext.request.contextPath}/business/businessProfilePost?businessNo=${business.businessNo}" class="btn btn-edit" aria-label="기업 정보 수정">
				        기업정보 수정
				    </a>
				</c:if>

                
                <!-- 관심 기업 추가 버튼 
                <button id="add-favorite-btn" class="btn btn-add-favorite" data-business-no="${business.businessNo}">
                    관심 기업 추가
                </button>
                -->
            </div>
        </div>

        <div class="profile-details">
            <!-- 기본 정보 -->
            <div class="profile-info border-box">
                <h3 class="info-title">기본 정보</h3>
                <div class="basic-info">
                    <div class="basic-info-item">
                        <span class="label">기업로고:</span>
                        <img id="company-logo-view" src="${pageContext.request.contextPath}${business.logo}" alt="기업 로고" class="company-logo">
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업명:</span>
                        <span class="value">${business.companyName}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 한줄 소개:</span>
                        <span class="value">${business.shortIntroduction}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 홈페이지:</span>
                        <a id="company-website-view" href="${business.companySite}" target="_blank" class="value">${business.companySite}</a>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 형태:</span>
                        <span class="value">${business.companyType}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 직원수:</span>
                        <span class="value">${business.employeeCount}명</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">대표자명:</span>
                        <span class="value">${business.ownerName}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">업종:</span>
                        <span class="value">${business.industry}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">브랜드명:</span>
                        <span class="value">${business.brandName}</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">주소:</span>
                        <span class="value">${business.companyAddr}</span>
                    </div>
                </div>
            </div>

            <!-- 기업소개 -->
            <div class="profile-description border-box">
                <h3>기업소개</h3>
                <p id="company-introduction-view" class="limited-text">
                    ${business.introduction}
                </p>
                <button class="btn toggle-btn" data-target="company-introduction-view" aria-expanded="false">전체보기</button>
            </div>

            <!-- 기업비전 -->
            <div class="profile-vision border-box">
                <h3>기업비전</h3>
                <p id="company-vision-view" class="limited-text">
                    ${business.vision}
                </p>
                <button class="btn toggle-btn" data-target="company-vision-view" aria-expanded="false">전체보기</button>
            </div>

            <!-- 복리후생 -->
            <div class="profile-benefits border-box">
                <h3>복리후생</h3>
                <ul id="benefits-list-view" class="benefits-list">
                    <c:forEach var="benefit" items="${business.benefits}">
                        <li>${benefit.benefit}</li>
                    </c:forEach>
                </ul>
                <button class="btn toggle-btn" data-target="benefits-list-view" aria-expanded="false">전체보기</button>
            </div>

            <!-- 사내 근무 환경 이미지 갤러리 -->
            <div class="profile-work-environment border-box">
                <h3>사내 근무 환경</h3>
                <div class="gallery-container">
                    <button class="nav-btn left-btn" aria-label="왼쪽으로 스크롤">&#9664;</button>
                    <div id="work-environment-gallery" class="image-gallery">
                        <c:forEach var="image" items="${business.workEnvironmentImages}">
                            <div class="gallery-item">
                                <img src="${pageContext.request.contextPath}${image.imageUrl}" alt="${image.title}">
                                <p>${image.title}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="nav-btn right-btn" aria-label="오른쪽으로 스크롤">&#9654;</button>
                </div>
            </div>

        </div>
    </main>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
