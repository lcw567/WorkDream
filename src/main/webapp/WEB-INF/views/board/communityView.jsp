<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 페이지</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityView.css">
    <script>
        window.contextPath = "${pageContext.request.contextPath}";
        const postLiked = ${userLikedPost ? 'true' : 'false'}; // 서버에서 전달한 값이 boolean 형태로 설정
    </script>
    <script src="${pageContext.request.contextPath}/js/communityView.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="post-container">
        <!-- 게시글 상단 네비게이션 -->
        <div class="back-nav">
            <a href="${pageContext.request.contextPath}/board/communityList" class="back-button">← 전체 게시글</a>
        </div>
        <br>
        <div class="post-view">
            <!-- 게시글 정보 -->
            <div class="post-header">
                <div class="post-user-info">
                    <img src="${pageContext.request.contextPath}/img/icon_user.png" alt="사용자 아이콘" class="user-icon">
                    <div class="user-details">
                        <span class="user-name"><c:out value="${post.author}" /></span>
                        <span class="post-date"><c:out value="${post.createdTime}" /> 작성</span>
                    </div>
                </div>
                <div class="post-buttons">
                    <c:if test="${not empty currentUser and currentUser.userNo eq post.userNo}">
                        <button class="button edit-button" aria-label="수정">수정</button>
                        <button class="button delete-button" aria-label="삭제">삭제</button>
                    </c:if>

                    <button class="button like-button" aria-label="공감">
                        <span role="img" aria-hidden="true">👍</span> 
                        <span class="like-count"><c:out value="${post.likeCount}" /></span>
                        <span class="sr-only">공감</span>
                    </button>
                    <button class="button report-button" aria-label="신고">신고</button>
                </div>
            </div>
            <hr>
            <div class="post-content">
                <div class="category-line">
                    <p class="post-category">카테고리: <span><c:out value="${post.category}" /></span></p>
                    <p class="job-category">직무:
                        <c:if test="${not empty post.jobCategories}">
                            <c:forEach var="job" items="${post.jobCategories}" varStatus="status">
                                <span><c:out value="${job}" /></span>
                                <c:if test="${!status.last}">, </c:if>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty post.jobCategories}">
                            <span>직무 카테고리가 없습니다.</span>
                        </c:if>
                    </p>
                </div>
                <h2 class="post-title"><c:out value="${post.title}" /></h2>          
                <c:if test="${not empty post.imagePath}">
                    <img src="${pageContext.request.contextPath}/board/uploads/${post.imagePath}" alt="게시글 이미지" class="post-image">
                </c:if>
                <p class="post-text">
                    <c:out value="${post.content}" escapeXml="true" />
                </p>
                <div class="hashtags">
                    <c:forEach var="hashtag" items="${post.hashtags}">
                        <span class="hashtag">#<c:out value="${hashtag}" /></span>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="comment-section">
            <h3>댓글 <span id="rcount">0</span></h3> <!-- 댓글 수 표시 -->
            <!-- 댓글 입력 박스 -->
            <c:if test="${not empty loginUser}">
                <div class="comment-box">
                    <div class="comment-header">
                        <img src="${pageContext.request.contextPath}/img/icon_user.png" alt="사용자 아이콘" class="comment-user-icon">
                        <span class="comment-user-name">
                            <c:out value="${loginUser.userId}" />
                        </span>
                        <button class="comment-submit-button" aria-label="댓글 등록">댓글 등록</button>
                    </div>
                    <textarea class="comment-input" placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!"></textarea>
                </div>
            </c:if>
            <c:if test="${empty loginUser}">
                <p>댓글을 작성하려면 <a href="${pageContext.request.contextPath}/login">로그인</a>하세요.</p>
            </c:if>
        
            <!-- 댓글 리스트 -->
            <div class="comment-list">
                <!-- 댓글은 자바스크립트로 동적으로 추가됨 -->
            </div>
        </div>
    </div>
    
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
