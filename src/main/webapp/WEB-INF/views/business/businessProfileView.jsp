<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 프로필 보기</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/businessProfileView.css">
    <script src="${pageContext.request.contextPath}/js/businessProfileView.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header_biz.jsp" />
    <main class="profile-view-container">
        <div class="profile-header">
            <h2>기업 프로필</h2>
            <div class="action-buttons">
                
                <a href="${pageContext.request.contextPath}/business/businessProfilePost" class="btn btn-edit" aria-label="기업 정보 수정">
                    기업정보 수정
                </a>
            </div>
        </div>

        <div class="profile-details">
            <!-- 기본 정보 -->
            <div class="profile-info border-box">
                <!-- 기본 정보 제목 -->
                <h3 class="info-title">기본 정보</h3>
                <!-- 기본 정보 내용 -->
                <div class="basic-info">
                    <div class="basic-info-item">
                        <span class="label">기업로고:</span>
                        <img id="company-logo-view" src="${pageContext.request.contextPath}/img/logo_title.png" alt="기업 로고" class="company-logo">
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업명:</span>
                        <span class="value">ABC 주식회사</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 한줄 소개:</span>
                        <span class="value">혁신적인 기술로 미래를 선도하는 기업</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 홈페이지:</span>
                        <a id="company-website-view" href="https://www.abccompany.com" target="_blank" class="value">www.abccompany.com</a>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 형태:</span>
                        <span class="value">대기업</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">기업 직원수:</span>
                        <span class="value">500명</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">대표자명:</span>
                        <span class="value">홍길동</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">업종:</span>
                        <span class="value">정보통신서비스업</span>
                    </div>
                    <div class="basic-info-item">
                        <span class="label">브랜드명:</span>
                        <span class="value">ABC Tech</span>
                    </div>
                </div>
            </div>

            <!-- 기업소개 -->
            <div class="profile-description border-box">
                <h3>기업소개</h3>
                <p id="company-introduction-view" class="limited-text">
                    ABC 주식회사는 2000년에 설립되어 혁신적인 기술 개발을 통해 다양한 산업 분야에서 선도적인 역할을 하고 있습니다. 우리는 고객 중심의 서비스를 제공하며, 지속 가능한 성장을 추구합니다. ABC 주식회사는 최고의 인재를 발굴하고, 그들이 최대한의 역량을 발휘할 수 있도록 지원합니다. 또한, 사회적 책임을 다하며 지역사회와 함께 성장해 나가고 있습니다.
                    ABC 주식회사는 2000년에 설립되어 혁신적인 기술 개발을 통해 다양한 산업 분야에서 선도적인 역할을 하고 있습니다. 우리는 고객 중심의 서비스를 제공하며, 지속 가능한 성장을 추구합니다. ABC 주식회사는 최고의 인재를 발굴하고, 그들이 최대한의 역량을 발휘할 수 있도록 지원합니다. 또한, 사회적 책임을 다하며 지역사회와 함께 성장해 나가고 있습니다.
                </p>
                <button class="btn toggle-btn" data-target="company-introduction-view">전체보기</button>
            </div>

            <!-- 기업비전 -->
            <div class="profile-vision border-box">
                <h3>기업비전</h3>
                <p id="company-vision-view" class="limited-text">
                    미래 기술을 선도하며 전 세계적으로 인정받는 기업으로 성장하는 것이 우리의 비전입니다. 이를 위해 지속적인 연구개발과 인재 양성에 힘쓰고 있습니다. 우리는 혁신과 창의를 바탕으로 새로운 시장을 개척하고, 글로벌 경쟁에서 우위를 점하기 위해 노력하고 있습니다. ABC 주식회사는 지속 가능한 발전을 통해 모두가 행복한 미래를 만들어 나가고자 합니다.
                    미래 기술을 선도하며 전 세계적으로 인정받는 기업으로 성장하는 것이 우리의 비전입니다. 이를 위해 지속적인 연구개발과 인재 양성에 힘쓰고 있습니다. 우리는 혁신과 창의를 바탕으로 새로운 시장을 개척하고, 글로벌 경쟁에서 우위를 점하기 위해 노력하고 있습니다. ABC 주식회사는 지속 가능한 발전을 통해 모두가 행복한 미래를 만들어 나가고자 합니다.
                </p>
                <button class="btn toggle-btn" data-target="company-vision-view">전체보기</button>
            </div>

            <!-- 복리후생 -->
            <div class="profile-benefits border-box">
                <h3>복리후생</h3>
                <ul id="benefits-list-view" class="benefits-list">
                    <li>퇴직연금</li>
                    <li>상여금</li>
                    <li>건강검진</li>
                    <li>유연근무제</li>
                    <li>자녀 학자금 지원</li>
                    <li>사내 교육 프로그램</li>
                    <li>스포츠 시설 이용</li>
                    <li>사내 카페테리아</li>
                </ul>
                <button class="btn toggle-btn" data-target="benefits-list-view">전체보기</button>
            </div>

            <!-- 사내 근무 환경 이미지 갤러리 -->
            <div class="profile-work-environment border-box">
                <h3>사내 근무 환경</h3>
                <div class="gallery-container">
                    <button class="nav-btn left-btn" aria-label="왼쪽으로 스크롤">&#9664;</button>
                    <div id="work-environment-gallery" class="image-gallery">
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env1.png" alt="사내 이미지 1">
                            <p>사무실</p>
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env2.png" alt="사내 이미지 2">
                            <p>휴게실</p>
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env3.png" alt="사내 이미지 3">
                            <p>회의실</p>
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env4.png" alt="사내 이미지 4">
                            <p>카페테리아</p>
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env5.png" alt="사내 이미지 5">
                            <p>구내식당</p>
                        </div>
                        <div class="gallery-item">
                            <img src="${pageContext.request.contextPath}/img/work-env6.png" alt="사내 이미지 6">
                            <p>건물</p>
                        </div>
                  
                    </div>
                    <button class="nav-btn right-btn" aria-label="오른쪽으로 스크롤">&#9654;</button>
                </div>
            </div>
        </div>
    </main>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>  
