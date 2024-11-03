<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityView.css">
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
                <img src="user-icon.png" alt="User Icon" class="user-icon">
                <div class="user-details">
                    <span class="user-name">홍길동</span>
                    <span class="post-date">2024.06.28 작성</span>
                </div>
            </div>
            <div class="post-buttons">
                <button class="button like-button">👍 <span>0</span></button>
                <button class="button report-button">신고</button>
            </div>
        </div>
        <hr>
        <!-- 게시글 내용 -->
        <div class="post-content">
            <h2 class="post-title">제목 들어가는 곳</h2>
            <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDEwMDRfMjk2%2FMDAxNzI4MDI4MjgxMzkw.e7edVOHLYWREj3EBGLewxjBAlTwTjJerIZY16Ra_Ih0g.hOxHSUOJ-pnVlXEB8cgtqlVpxNpZkX0ucT2TlavSAyog.JPEG%2FIMG_2540.JPG&type=l340_165"
            alt="게시글 이미지" class="post-image">
            <p class="post-text">
                4차 산업 시대를 대비하여 청년들의 디지털 역량을 강화하고자 합니다. 🌐<br>
                교육 프로그램은 디지털 트렌드 실무 기초 과정을 제공하며,<br>
                취업 준비를 목표로 하는 청년들에게 딱 맞는 교육 기회입니다! 🎓<br>
            </p>
        </div>
    </div>

    <div class="comment-section">
        <!-- 댓글 입력 박스 -->
        <div class="comment-box">
            <div class="comment-header">
                <img src="user-icon.png" alt="User Icon" class="comment-user-icon">
                <span class="comment-user-name">홍길동</span>
                <button class="comment-submit-button">댓글 등록</button>
            </div>
            <textarea class="comment-input" placeholder="위 고민과 같은 경험이 있거나, 알고 계신 정보가 있다면 조언 부탁드려요!"></textarea>
        </div>
    
        <!-- 댓글 리스트 -->
        <div class="comment-list">
            <!-- 댓글은 자바스크립트로 동적으로 추가됨 -->
        </div>

        <!-- 답글 입력 박스 (기본 숨김) -->
        <div class="reply-box" style="display: none;">
            <span class="reply-icon">↳</span>
            <input type="text" placeholder="답변에 댓글을 입력해 보세요." class="reply-input">
            <button class="reply-submit-button">등록</button>
        </div>

    </div>
</div>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
