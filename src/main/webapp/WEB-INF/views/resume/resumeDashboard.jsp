<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서 관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resumeDashboard.css">
<script src="${pageContext.request.contextPath}/js/resumeDashboard.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div class="resumedashboard-container">
        <div class="Header">
            <div class="resumedashboard-header">
                <div class = "page-name">
                    <h1>이력서 관리</h1>
                </div>
                <div class="search-bar_back">
                    <div class="tip">
                        좋은 제안, 놓치고 있나요? 주변 사람들은 이미 제안 받고 있어요.
                        <br>
                        이력서를 선택하고 내 커리어에 맞는 제안을 받아 보세요!
                    </div>
                    <div class="search-bar">
                        <input type="text" placeholder="검색어를 입력하세요">
                        <button><img src="${pageContext.request.contextPath}/img/btn_search.png" alt="검색"></button>
                    </div>
                </div> 
            </div>
            <form action="${pageContext.request.contextPath}/resume/enrollresume">
                <div class="button-container">
                    <button type="submit" class="toenroll_page">이력서 등록하기</button>
                </div>
            </form>
        </div>
        <main>
            <div class="total-count">총 3건</div>
            <div class="intro-list">
                <div class="intro-item" data-id="intro1">
                    <div class="intro-info">
                        <div class="intro-name">작성한 이력서 이름 1</div>
                        <div class="intro-date">2024.10.22 14:38:11 수정</div>
                    </div>
                    <div class="more-options">
                        <button class="more-button" aria-label="더보기">⋮</button>
                        <div class="dropdown-menu">
                            <button class="edit-button">수정</button>
                            <button class="delete-button">삭제</button>
                        </div>
                    </div>
                </div>
                <div class="intro-item" data-id="intro2">
                    <div class="intro-info">
                        <div class="intro-name">작성한 이력서 이름 2</div>
                        <div class="intro-date">2024.10.22 14:38:11 수정</div>
                    </div>
                    <div class="more-options">
                        <button class="more-button" aria-label="더보기">⋮</button>
                        <div class="dropdown-menu">
                            <button class="edit-button">수정</button>
                            <button class="delete-button">삭제</button>
                        </div>
                    </div>
                </div>
                <div class="intro-item" data-id="intro3">
                    <div class="intro-info">
                        <div class="intro-name">작성한 이력서 이름 3</div>
                        <div class="intro-date">2024.10.22 14:38:11 수정</div>
                    </div>
                    <div class="more-options">
                        <button class="more-button" aria-label="더보기">⋮</button>
                        <div class="dropdown-menu">
                            <button class="edit-button">수정</button>
                            <button class="delete-button">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="notice-container">
            <div class="notice">확인사항</div>
            <div class="notice2">
                <ul class="notice-list">
                    <li>이력서 공개 설정은 1개의 이력서만 가능합니다.</li>
                    <li>이력서는 최대 15개, 파일 이력서와 URL 이력서는 최대 10개까지 등록 가능합니다.</li>
                    <li>'기업이 보낸 요청', '입사지원 내역'건수는 최근 1년간의 내역에 대해 확인 가능합니다.</li>
                    <li>인쇄, MS워드로 저장, PDF로 저장, 삭제 기능은 이력서 우측 버튼을 누르면 확인하실 수 있습니다. (파일 이력서와 URL 이력서는 삭제 기능만 제공)</li>
                </ul>
            </div>
        </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>