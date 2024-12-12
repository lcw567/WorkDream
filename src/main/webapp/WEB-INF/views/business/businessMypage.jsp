<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 마이페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    
    <!-- css / js 연결  -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/businessMypage.css">
    <script>var activeBizNo = 1;</script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header_biz.jsp" />
    <div class="main-container">
        <div class="profile-section">

        
            <article class="login-box logged-in" aria-hidden="false">
                <h2 class="company-name">${business.companyName}</h2>
                <p class="company-description">${business.shortIntroduction}</p>
                <div class="contact-info">
                    <span>${business.industry}</span> |
                    <span>${business.companySite}</span> |
                    <span>${business.companyAddr}</span>
                </div>
                <div class="button-group">
                    <button class="btn btn-company-info" onclick="location.href='${pageContext.request.contextPath}/business/businessProfileView?businessNo=${business.businessNo}'">기업 정보</button>
                    <button class="btn btn-messenger"  onclick="location.href='${pageContext.request.contextPath}/chat'">메신저</button>
                </div>
            </article>
        </div>


        <!-- 지원현황 섹션 -->
        <section class="application-status">
            <div class="status-header">
                <h2>지원현황 전체보기</h2>
                <button class="add-status-button" aria-label="지원현황 추가" onclick="location.href='${pageContext.request.contextPath}/business/applicantsStatus'">+</button>
            </div>
            <div class="status-cards">
                <div class="status-card">
                    <span>총 지원자</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>열람완료</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>평가완료</span>
                    <p>0</p>
                </div>
                
                <div class="status-card">
                    <span>열람미완료</span>
                    <p>0</p>
                </div>
            </div>
        </section>

        <section class="banner-section">
            <div class="banner">
                <img src= "${pageContext.request.contextPath}/img/lineBanner.PNG" alt="Line Banner">
               
            </div>
        </section>

        <!-- 주요 액션 섹션 -->
        <section class="action-section">
            <div class="action-buttons">
                <div class="action-item" onclick="location.href='${pageContext.request.contextPath}/business/recruitmentRegister'">
                    <h3>채용 공고 등록</h3>
                    <p>이상적인 인재를 손쉽게 모집하세요</p>
                </div>
                <div class="action-item" onclick="location.href='${pageContext.request.contextPath}/business/recruitmentManager'">
                    <h3>채용 공고 현황</h3>
                    <p>등록된 공고를 한눈에 확인하세요</p>
                </div>
                <div class="action-item" onclick="location.href='${pageContext.request.contextPath}/business/applicantsStatus'">
                    <h3>지원자 현황</h3>
                    <p>지원자의 정보를 확인하고 검토하세요</p>
                </div>
                <div class="action-item" onclick="location.href='${pageContext.request.contextPath}/business/bookmark'">
                    <h3>관심 구직자</h3>
                    <p>관심있는 인재를 빠르게 찾으세요</p>
                </div>
            </div>
        </section>

        
        <section class="banner-section">
            <div class="banner">
                <img src="${pageContext.request.contextPath}/img/banner.PNG" alt="Main Banner">
            
            </div>
        </section>
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
