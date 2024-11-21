<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜 형식 지정용 태그 라이브러리 추가 -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이력서 관리</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selfIntroDashboard.css">
    <script src="${pageContext.request.contextPath}/js/selfIntroDashboard.js"></script>
    <!-- CSRF 토큰 메타 태그 추가 -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="dashboard-container">
        <div class="dashboard-header">
            <div class="page-name">
                <h1>자소서 관리</h1>
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
            <div class="total-count">총 ${selfIntroList.size()}건</div>
            <div class="intro-list">
                <c:forEach var="intro" items="${selfIntroList}">
                    <div class="intro-item" data-id="${intro.selfintroNo}">
                        <div class="intro-info">
                            <div class="intro-name">${intro.introTitle}</div>
                            <div class="intro-date">
                                <c:choose>
                                    <c:when test="${not empty intro.modifiedDate}">
                                        <fmt:formatDate value="${intro.modifiedDate}" pattern="yyyy-MM-dd"/> 수정
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${intro.createDate}" pattern="yyyy-MM-dd"/> 등록
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="more-options">
                            <button class="more-button" aria-label="더보기">⋮</button>
                            <div class="dropdown-menu">
                                <form action="${pageContext.request.contextPath}/resume/editIntro" method="get">
                                    <input type="hidden" name="id" value="${intro.selfintroNo}">
                                    <button type="submit" class="edit-button">수정</button>
                                </form>                                             
                                <form action="${pageContext.request.contextPath}/resume/deleteIntro" method="post">
                                    <input type="hidden" name="id" value="${intro.selfintroNo}">
                                    <button type="submit" class="delete-button">삭제</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
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

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
