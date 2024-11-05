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
                <a href="plannerPage 예정">
                <img src="${pageContext.request.contextPath}/img/plannerBanner.PNG" />
                </a>
            </div>
            <div class="mainBanner">
                <img src="${pageContext.request.contextPath}/img/banner.PNG" />
            </div>
        </section>
    </div>
    

    <div class="tag-edit-popup">
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
                <div class="tag-item">건강검진 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">성과금 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">야근수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">퇴직연금 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">특근수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">4대보험 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">직책수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">연차수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">건강검진 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">성과금 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">야근수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">퇴직연금 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">특근수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">4대보험 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">직책수당 <span class="remove-tag">&times;</span></div>
                <div class="tag-item">연차수당 <span class="remove-tag">&times;</span></div>   
            </div>
        </div>
        <div class="save-tag">
            <button class="save-button">관심태그 저장하기</button>
        </div>
    </div>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>