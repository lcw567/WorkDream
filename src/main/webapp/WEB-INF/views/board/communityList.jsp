<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 리스트</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityList.css">
    <script src="${pageContext.request.contextPath}/js/communityList.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <input type="hidden" id="contextPath" value="${pageContext.request.contextPath}"/>
    
    <div class="list-container"> 

        <!-- 상단 제목 -->
        <%
            String category = request.getParameter("category");
            if (category == null || category.isEmpty()) {
                category = "인기글"; // 기본값 설정
            }
        %>
        <section class="title">
            <h1><%= category %></h1>
        </section>

        <!-- 카테고리 버튼 -->
        <section class="category-tags">
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
        </section>

        <br><br>


        <!-- 게시글 개수 -->
        <section class="count">
            <p class="total-count">전체 <strong style="font-size: 1.3rem;">0</strong>건</p>    
        </section>

        <!-- 필터 섹션 -->
        <section class="filter-section">
            <div class="filters">
                <select id="jobFilter">
                    <option value="">직무/직업 전체</option>
                    <option value="기획•전략">기획•전략</option>
                    <option value="마케팅•홍보•조사">마케팅•홍보•조사</option>
                    <option value="회계•세무•재무">회계•세무•재무</option>
                    <option value="인사•노무•HRD">인사•노무•HRD</option>
                    <option value="총무•법무•사무">총무•법무•사무</option>
                    <option value="IT개발•데이터">IT개발•데이터</option>
                    <option value="디자인">디자인</option>
                    <option value="영업•판매•무역">영업•판매•무역</option>
                    <option value="고객상담•TM">고객상담•TM</option>
                    <option value="구매•자재•물류">구매•자재•물류</option>
                    <option value="상품기획•MD">상품기획•MD</option>
                    <option value="운전•운송•배송">운전•운송•배송</option>
                    <option value="서비스">서비스</option>
                    <option value="생산">생산</option>
                    <option value="건설•건축">건설•건축</option>
                    <option value="의료">의료</option>
                    <option value="연구•R&D">연구•R&D</option>
                    <option value="교육">교육</option>
                    <option value="미디어•문화•스포츠">미디어•문화•스포츠</option>
                    <option value="금융•보험">금융•보험</option>
                    <option value="공공•복지">공공•복지</option>
                </select>
                <select id="sortFilter">
                    <option value="최신순">최신순</option>
                    <option value="조회순">조회순</option>
                    <option value="공감 많은 순">공감 많은 순</option>
                </select>
            </div>
        </section>

        <div class="header-search-bar">
            <h2>게시글 목록</h2>
            <div class="search-bar">
                <input type="text" placeholder="검색어를 입력하세요">
                <button><img src="${pageContext.request.contextPath}/img/btn_search.png" alt="검색" class="search-icon">  </button>
            </div>
        </div>
        <div class="post-create-button-container">
	        <button onclick="location.href='${pageContext.request.contextPath}/board/communityPost'">
	            게시글 등록
	        </button>
	    </div>

        <!-- 게시글 목록 테이블 -->
        <section class="post-list">
            <table>
                <thead>
                    <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>작성시간</th>
                        <th>조회수</th>
                        <th>공감</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- JavaScript로 동적 생성 -->
                </tbody>
            </table>
        </section>

        <br><br><br>

        <!-- 페이지네이션 컨트롤 -->
        <div class="pagination">
            <button id="prevPage" disabled>&#9664;</button>
            <span id="pageNumber">1</span>
            <button id="nextPage">&#9654;</button>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
