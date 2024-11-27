<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구직자 마이페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicantsMypage.css">
    
    <!-- 컨텍스트 패스를 JavaScript로 전달 -->
    <script>
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/js/applicantsMypage.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div class="main-container">
        <section class="applicants-name">
            <c:if test="${not empty loginUser}">
                <h2>${loginUser.userId}</h2>
            </c:if>
            <c:if test="${empty loginUser}">
                <h2>로그인이 필요합니다</h2>
            </c:if>
            <button class="messenger">메신저</button>
        </section>

        <section class="tag-container">
            <div class="tag-title">
                <h2>관심태그</h2>
                <button class="edit-tag">관심태그 수정</button>
            </div>
            <div class="tags">
                <div class="tag-group">
                    <!-- 서버에서 현재 사용자의 관심태그를 불러와 표시 -->
                    <c:forEach var="tag" items="${userTags}">
                        <button class="tag">${tag.tagName}</button>
                    </c:forEach>
                </div>
                <button class="tag all">관심태그 전체보기</button>
            </div>
        </section>

        <section class="application-status">
            <div class="header">
                <h2>지원현황 전체보기</h2>
                <button class="add-button" onclick="location.href='${pageContext.request.contextPath}/person/applicationmanage'">+</button>
            </div>
            <div class="status-cards">
                <div class="status-card"><span>서류 통과</span><p>0</p></div>
                <div class="status-card"><span>면접 대기</span><p>0</p></div>
                <div class="status-card"><span>최종 결과</span><p>0</p></div>
                <div class="status-card"><span>합격</span><p>0</p></div>
            </div>
        </section>
        
        <section class="banner-section">
            <div class="banner">
                <img src="${pageContext.request.contextPath}/img/lineBanner.PNG" alt="Line Banner">             
            </div>
        </section>

        <section class="actions">
            <div class="action-buttons">
                <form action="resumeDashboard">
                    <div class="action" onclick="location.href='${pageContext.request.contextPath}/resume/resumeDashboard'">
                        <h3>이력서 등록</h3>
                        <p>이력서를 등록하고 검토하세요</p>
                    </div>
                </form>
                <div class="action" onclick="location.href='${pageContext.request.contextPath}/resume/selfIntroDashboard'">
                    <h3>자기소개서 등록</h3>
                    <p>자기소개서를 등록하고 검토하세요</p>
                </div>
                <div class="action" onclick="location.href='#'">
                    <h3>포트폴리오 등록</h3>
                    <p>포트폴리오를 등록하고 검토하세요</p>
                </div>
                <div class="action" onclick="location.href='${pageContext.request.contextPath}/person/clippingcompany'">
                    <h3>즐겨찾기 공고/기업</h3>
                    <p>즐겨찾기 목록을 한눈에 확인하세요</p>
                </div>
            </div>
        </section>

        <section class="banner">
            <div class="plannerBanner">
                <img src="${pageContext.request.contextPath}/img/plannerBanner.PNG" onclick="location.href='${pageContext.request.contextPath}/planner/planner'" />
            </div>
            <div class="mainBanner">
                <img src="${pageContext.request.contextPath}/img/banner.PNG" />
            </div>
        </section>
    </div>
    
    <!-- 관심태그 수정 팝업 -->
    <div class="tag-edit-popup" style="display: none;">
        <div class="title-popup">
            <h2>관심태그 수정</h2>
            <button class="close-button">&times;</button>
        </div>
        <div class="modal-content">
            <div class="tag-input-container">
                <input type="text" placeholder="관심태그를 입력하세요..." class="tag-input">
                <button class="add-tag-button">관심태그 추가</button>
            </div>
            <div class="tag-list">
                <!-- 현재 수정 중인 태그 목록 -->
                <!-- 태그 아이템은 JavaScript로 추가 -->
                <c:forEach var="tag" items="${userTags}">
                    <div class="tag-item">
                        ${tag.tagName} <span class="remove-tag">&times;</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="save-tag">
            <button class="save-button">관심태그 저장하기</button>
        </div>
    </div>

    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>   
