<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 홈</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityHome.css">
    <script src="${pageContext.request.contextPath}/js/communityHome.js" defer></script>
</head>

<body>
<input type="hidden" id="contextPath" value="${pageContext.request.contextPath}"/>
<c:import url="/WEB-INF/views/common/header.jsp" />
    <div class="home-container"> 
    <div class="title">
        <h1>커뮤니티 홈</h1>
    </div>

    <!-- 공지사항  -->
    <section class="notice">
        <h2>📢커뮤니티 공지사항</h2>
        <div class="notice-content">
            <h5>
                커뮤니티는 다양한 주제로 여러 사용자가 소통할 수 있는 공간입니다. <br>
                사용자의 원활한 서비스 이용을 위해 아래의 커뮤니티 이용 기준을 제정하여 운영하고 있습니다. <br>
                <br>
                아래의 기준에 해당하면 운영자에 의해 게시물이 삭제될 수 있고,<br>
                해당 내용을 지속해서 반복하는 사용자에게는 일정한 제재가 이루어질 수 있습니다. <br>
                <br>
                : 타인의 명의를 도용한 게시물 및 댓글<br>
                : 내용 중 욕설, 음란성 내용이 포함된 게시물 및 댓글<br>
                : 상업적 광고의 성격이 포함된 게시물, 사이트 홍보나 구인·구직 게시물, 도배 의도성 게시물 및 댓글<br>
                : html, script 등을 사용한 게시물 중 서비스의 장애를 일으키는 게시물 및 댓글 <br>
                : 다른 사용자의 게시물에 대한 직접적인 욕설과 인신공격 등 타인의 권리를 침해하는 내용을 포함한 게시물 및 댓글 <br>
                : 전기통신 관계 법령 및 형사 관계 법령에 따른 국가기관 등의 삭제 등 요구가 있는 게시물 및 댓글 <br>
                : 그 외 기타 커뮤니티의 주제나 목적에 맞지 않는 게시물이라고 판단되는 경우 <br>
                <br>
                올바르고 재미있는 커뮤니티가 될 수 있도록 진심이도 노력하겠습니다! <br>
                많은 이용 부탁드립니다 <br>
                <br>
                <!-- 이하 공지사항 내용 그대로 유지 -->
            </h5>
        </div>
    </section>
    <br><br>

    <!-- 실시간 전체글 박스 -->
    <section class="realtime-posts-container">
        <div class="realtime-posts">
        	<div class = "postCountTitle">
        		<h2 id="postCount">실시간 전체글 99,999 개</h2> <!-- ID 추가 -->
        	</div>
            
            <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력하세요">
                    <button><img src="${pageContext.request.contextPath}/img/btn_search.png" alt="검색" class="search-icon"></button>
                </div>
            </div>

        <!-- 오늘의 인기글 -->
        <div class="popular-week">
            <h3>이번주 전체의 인기글 🔥 <a href="#">더보기 ></a></h3>
            <ul id="popularPostList"> <!-- 인기글 목록에 ID 추가 -->
                <!-- 여기서부터 JavaScript로 동적 생성 -->
            </ul>
        </div>
    </section>
    <br><br>

    <!-- 주제별 커뮤니티 -->
    <section class="community-categories">
        <h2>주제별 커뮤니티</h2>
        <br><br>
        <div class="category-tags">
            <!-- 각 버튼에 카테고리별 ID 추가 -->
            <button data-category="전체글">전체글</button> 
            <button data-category="인기글">인기글</button>
            <button data-category="신입">신입</button>
            <button data-category="채용공고">채용공고</button>
            <button data-category="취준">취준</button>
            <button data-category="자소서">자소서</button>
            <button data-category="자격증">자격증</button> 
            <button data-category="Q&A">Q&A</button>
            <button data-category="커리어">커리어</button>
            <button data-category="이직">이직</button>
            <button data-category="잡담">잡담</button>
            <button data-category="면접">면접</button>
        </div>
    </section>

    <!-- 게시글 리스트 -->
    <section class="post-list">
        <!-- 각각의 리스트에 카테고리 ID 추가 -->
        <div class="post-category">
            <h3>전체글 <a href="#" data-category="전체글">더보기 ></a></h3>
            <ul id="allPostsList"></ul>
        </div>
        <div class="post-category">
            <h3>신입 <a href="#" data-category="신입">더보기 ></a></h3>
            <ul id="newPostsList"></ul>
        </div>
        <div class="post-category">
            <h3>취준 <a href="#" data-category="취준">더보기 ></a></h3>
            <ul id="prepPostsList"></ul>
        </div>
        <div class="post-category">
            <h3>채용공고 <a href="#" data-category="채용공고">더보기 ></a></h3>
            <ul id="jobPostsList"></ul>
        </div>
        <div class="post-category">
            <h3>자소서 <a href="#" data-category="자소서">더보기 ></a></h3>
            <ul id="coverLetterPostsList"></ul>
        </div>
        <div class="post-category">
            <h3>면접 <a href="#" data-category="면접">더보기 ></a></h3>
            <ul id="interviewPostsList"></ul>
        </div>
    </section>
   
</div>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>  
