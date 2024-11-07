<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 관리</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selfIntroDashboard.css">
	<script src="${pageContext.request.contextPath}/js/selfIntroDashboard.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="resumedashboard-container">
        <div class="resumedashboard-header">
        	<div class = "page-name">
        		<h1>이력서 관리</h1>
        	</div>
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력하세요">
                <button><img src="${pageContext.request.contextPath}/img/btn_search.png" alt="검색"></button>
            </div>
        </div>

        <div class="button-container">
            <button class="register-button">자소서 등록하기</button>
        </div>
        
        <main>
            <div class="total-count">총 3건</div>
            <div class="intro-list">
                <div class="intro-item" data-id="intro1">
                    <div class="intro-info">
                        <div class="intro-name">작성한 자소서 이름 1</div>
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
                        <div class="intro-name">작성한 자소서 이름 2</div>
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
                        <div class="intro-name">작성한 자소서 이름 3</div>
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
                    <li>자소서는 공백포함 500자 까지 작성 가능 합니다.</li>
                    <li>자소서는 총 100개까지 등록 가능합니다.</li>
                </ul>
            </div>
        </div>
        </div>
    </div>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
