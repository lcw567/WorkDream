<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 마이페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/businessMypage.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header_biz.jsp" />
    <div class="main-container">
        <div class="profile-section">
            <!-- 로그인 시 -->
            <h5>로그인 했을 때</h5>
            <article class="login-box logged-in" aria-hidden="false">
                <h2 class="company-name">기업명</h2>
                <p class="company-description">포털 및 기타 인터넷 정보매개 서비스업</p>
                <div class="contact-info">
                    <span>010-0000-0000</span> |
                    <span><a href="http://www.aaaaaaa.com" target="_blank" rel="noopener noreferrer">www.aaaaaaa.com</a></span> |
                    <span>서울특별시 000로00길</span>
                </div>
                <div class="button-group">
                    <button class="btn btn-company-info">기업 정보</button>
                    <button class="btn btn-messenger">메신저</button>
                </div>
            </article>
        
            <!-- 로그인 안 했을 시 -->
            <h5>로그인 안 했을 때</h5>
            <article class="login-box not-logged-in" aria-hidden="true">
                <p class="login-message">로그인이 필요한 서비스입니다</p>
                <div class="button-group">
                    <button class="btn btn-company-info">기업 정보</button>
                    <button class="btn btn-messenger">메신저</button>
                </div>
            </article>
        </div>


        <!-- 지원현황 섹션 -->
        <section class="application-status">
            <div class="status-header">
                <h2>지원현황 전체보기</h2>
                <button class="add-status-button" aria-label="지원현황 추가">+</button>
            </div>
            <div class="status-cards">
                <div class="status-card">
                    <span>진행중 공고</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>지원자</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>즐겨찾기 지원자</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>합격</span>
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
                <div class="action-item">
                    <h3>채용 공고 등록</h3>
                    <p>이상적인 인재를 손쉽게 모집하세요</p>
                </div>
                <div class="action-item">
                    <h3>채용 공고 현황</h3>
                    <p>등록된 공고를 한눈에 확인하세요</p>
                </div>
                <div class="action-item">
                    <h3>지원자 현황</h3>
                    <p>지원자의 정보를 확인하고 검토하세요</p>
                </div>
                <div class="action-item">
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
