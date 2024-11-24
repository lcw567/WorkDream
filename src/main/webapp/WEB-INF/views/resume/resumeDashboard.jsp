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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/resumeDashboard.css">
    <script src="${pageContext.request.contextPath}/js/resumeDashboard.js" defer></script>
    <!-- CSRF 토큰 메타 태그 추가 -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="resumedashboard-container">
        <div class="header">
            <div class="resumedashboard-header">
                <div class="page-name">
                    <h1>이력서 관리</h1>
                </div>
                <div class="search-bar_back">
                    <div class="tip">
                        좋은 제안, 놓치고 있나요? 주변 사람들은 이미 제안 받고 있어요.
                        <br>
                        이력서를 선택하고 내 커리어에 맞는 제안을 받아 보세요!
                    </div>
                    <div class="search-bar">
                        <input type="text" placeholder="검색어를 입력하세요" name="searchKeyword" id="searchKeyword">
                        <button type="button" onclick="searchResumes()">
                            <img src="${pageContext.request.contextPath}/img/btn_search.png" alt="검색">
                        </button>
                    </div>
                </div> 
            </div>
            <form action="${pageContext.request.contextPath}/resume/enrollresume" method="get">
                <div class="button-container">
                    <button type="submit" class="toenroll_page">이력서 등록하기</button>
                </div>
            </form>
        </div>
        <main>
            <!-- 총 이력서 개수 동적 표시 -->
            <div class="total-count">총 ${resumeList.size()}건</div>
            <div class="intro-list">
                <!-- 이력서 목록을 동적으로 반복 -->
                <c:forEach var="resume" items="${resumeList}">
                    <div class="intro-item" data-id="${resume.resumeNo}">
                        <div class="intro-info">
                            <div class="intro-name">${resume.resumeTitle}</div>
                            <div class="intro-date">
                                <c:choose>
                                    <c:when test="${not empty resume.modifiedDate}">
                                        <fmt:formatDate value="${resume.modifiedDate}" pattern="yyyy-MM-dd"/> 수정
                                    </c:when>
                                    <c:otherwise>
                                        <fmt:formatDate value="${resume.createDate}" pattern="yyyy-MM-dd"/> 등록
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="more-options">
                            <button class="more-button" aria-label="더보기">⋮</button>
                            <div class="dropdown-menu">
                                <!-- 수정 폼 -->
                                <form action="${pageContext.request.contextPath}/resume/editResume" method="get">
                                    <input type="hidden" name="id" value="${resume.resumeNo}">
                                    <button type="submit" class="edit-button">수정</button>
                                </form>                                             
                                <!-- 삭제 폼 -->
                                <form action="${pageContext.request.contextPath}/resume/deleteResume" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                    <input type="hidden" name="id" value="${resume.resumeNo}">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> <!-- CSRF 토큰 추가 -->
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
                    <li>이력서 공개 설정은 1개의 이력서만 가능합니다.</li>
                    <li>이력서는 최대 15개, 파일 이력서와 URL 이력서는 최대 10개까지 등록 가능합니다.</li>
                    <li>'기업이 보낸 요청', '입사지원 내역'건수는 최근 1년간의 내역에 대해 확인 가능합니다.</li>
                    <li>인쇄, MS워드로 저장, PDF로 저장, 삭제 기능은 이력서 우측 버튼을 누르면 확인하실 수 있습니다. (파일 이력서와 URL 이력서는 삭제 기능만 제공)</li>
                </ul>
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
