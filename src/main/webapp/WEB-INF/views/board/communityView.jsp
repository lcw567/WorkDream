<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 페이지</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityView.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="post-container">
    <!-- 게시글 상단 네비게이션 -->
    <div class="back-nav">
        <a href="#">← 전체 게시글</a>
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
                <button class="button">👍 <span>0</span></button>
                <button class="button">신고</button>
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
                <br>
                과정을 통해 준비된 실무 / 교육 전문가는<br>
                미래를 선도하는 주요 인재로 자리매김할 것입니다.<br>
                함께 미래에 도전하고 싶은 분들은 지금 바로 참여하세요! ✨<br>
                <br>
                - 신청 방법 및 자세한 사항은 해당 이미지와 유료로 참고<br>
                당신의 디지털 미래를 위한 첫걸음을 내딛어보세요! ✨
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
            <div class="comment">
                <div class="comment-info">
                    <img src="user-icon.png" alt="User Icon" class="comment-user-icon">
                    <span class="comment-user-name">홍길동</span>
                    <span class="comment-date">2024.06.28. 09:00</span>
                    <button class="comment-report-button">신고</button>
                </div>
                <p class="comment-text">임시 댓글입니다.</p>
                <div class="comment-actions">
                    <button class="comment-action reply-button">답글</button>
                    <button class="comment-action">👍 0</button>
                </div>
            </div>
        </div>

        <!-- 답글 입력 박스 -->
        <div class="reply-box">
            <span class="reply-icon">↳</span>
            <input type="text" placeholder="답변에 댓글을 입력해 보세요." class="reply-input">
            <button class="reply-submit-button">등록</button>
        </div>

        <!-- 목록 버튼 -->
        <div class="back-to-list">
            <button class="back-button">목록</button>
        </div>
    </div>
</div>

</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
