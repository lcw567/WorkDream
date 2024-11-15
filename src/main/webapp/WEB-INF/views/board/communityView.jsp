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
        // JavaScript에서 contextPath를 사용할 수 있도록 변수로 전달
        const contextPath = "${pageContext.request.contextPath}";
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
                        <span class="user-name">${post.author}</span>
                        <span class="post-date">${post.createdTime} 작성</span>
                    </div>
                </div>
                <div class="post-buttons">
                    <!-- 현재 로그인한 사용자가 게시글 작성자인 경우에만 수정 및 삭제 버튼 표시 -->
                    <c:if test="${currentUser.userNo == post.userNo}">
                        <button class="button edit-button" aria-label="수정">수정</button>
                        <button class="button delete-button" aria-label="삭제">삭제</button>
                    </c:if>
                    <button class="button like-button" aria-label="공감"><span>👍</span> <span class="like-count">${post.likeCount}</span></button>
                    <button class="button report-button" aria-label="신고">신고</button>
                </div>
            </div>
            <hr>
            <!-- 게시글 내용 -->
            <div class="post-content">
                <div class="category-line">
                    <!-- 카테고리 및 직무 카테고리 표시 -->
                    <p class="post-category">카테고리: <span>${post.category}</span></p>
                    <p class="job-category">직무: <span>${post.jobCategories}</span></p>
                </div>
                <h2 class="post-title">${post.title}</h2>          
                <c:if test="${not empty post.imagePath}">
                    <img src="${pageContext.request.contextPath}/${post.imagePath}" alt="게시글 이미지" class="post-image">
                </c:if>
                <p class="post-text">
                    ${post.content}
                </p>
                <!-- 해시태그 표시 -->
                <div class="hashtags">
                    <c:forEach var="hashtag" items="${hashtags}">
                        <span class="hashtag">#${hashtag}</span>
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="comment-section">
            <!-- 댓글 입력 박스 -->
            <div class="comment-box">
                <div class="comment-header">
                    <img src="${pageContext.request.contextPath}/img/icon_user.png" alt="사용자 아이콘" class="comment-user-icon">
                    <span class="comment-user-name">
                        <c:if test="${not empty currentUser}">
                            ${currentUser.userName}
                        </c:if>
                        <c:if test="${empty currentUser}">
                            익명
                        </c:if>
                    </span>
                    <button class="comment-submit-button" aria-label="댓글 등록">댓글 등록</button>
                </div>
                <textarea class="comment-input" placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!"></textarea>
            </div>
        
            <!-- 댓글 리스트 -->
            <div class="comment-list">
                <!-- 댓글은 자바스크립트로 동적으로 추가됨 -->
            </div>
        </div>
    </div>

    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
