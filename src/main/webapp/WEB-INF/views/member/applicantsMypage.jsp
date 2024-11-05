<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자소서 관리dsfdsf</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/applicantsMypage.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div class="main-container">
        <section class="applicants-name">
            <h2>구직자명</h2>
            <button class="messenger">메신저</button>
        </section>
        <section class="tag-container">
            <div class="tag-title">
                <h2>관심태그</h2>
                <button class="edit-tag">관심태그 수정</button>
            </div>
            <div class="tags">
                <div class="tag-group">
                    <button class="tag">건강검진</button>
                    <button class="tag">성과금</button>
                    <button class="tag">야근수당</button>
                    <button class="tag">퇴직연금</button>
                </div>
                <button class="tag all">관심태그 전체보기</button>
            </div>
        </section>

        <section class="application-status">
            <div class="header">
                <h2>지원현황 전체보기</h2>
                <button class="add-button">+</button>
            </div>
            <div class="status-cards">
                <div class="status-card">
                    <span>서류 통과</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>면접 대기</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>최종 결과</span>
                    <p>0</p>
                </div>
                <div class="status-card">
                    <span>합격</span>
                    <p>0</p>
                </div>
            </div>
        </section>

        <section class="actions">
            <div class="action-buttons">
                <div class="action">
                    <h3>이력서 등록</h3>
                    <p>이력서를 등록하고 검토하세요</p>
                </div>
                <div class="action">
                    <h3>자기소개서 등록</h3>
                    <p>자기소개서를 등록하고 검토하세요</p>
                </div>
                <div class="action">
                    <h3>포트폴리오 등록</h3>
                    <p>포트폴리오를 등록하고 검토하세요</p>
                </div>
                <div class="action">
                    <h3>즐겨찾기 공고/기업</h3>
                    <p>즐겨찾기 목록을 한눈에 확인하세요</p>
                </div>
            </div>
        </section>

        <section class="banner">
            <div class="plannerBanner">
                <a href="plannerPage.html">
                <img src="${pageContext.request.contextPath}/img/plannerBanner.PNG" />
                </a>
            </div>
            <div class="mainBanner">
                <img src="${pageContext.request.contextPath}/img/banner.PNG" />
            </div>
        </section>
    </div>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
