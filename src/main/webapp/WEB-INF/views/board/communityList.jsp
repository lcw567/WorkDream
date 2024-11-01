<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>커뮤니티 리스트</title>
    < <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/communityList.css">
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />
	
    <div class="list-container"> 

    <!-- 상단 제목 -->
    <section class="title">
        <h1>인기글 </h1>
    </section>

    <!-- 카테고리 버튼 -->
    <section class="category-tags">
        <button>인기글</button>
        <button>신입</button>
        <button>채용공고</button>
        <button>취준</button>
        <button>자소서</button>
        <button>자격증</button>
        <button>Q&A</button>
        <button>커리어</button>
        <button>이직</button>
        <button>잡담</button>
        <button>면접</button>
    </section>

    <br><br>

    <section class="count">
    <p class="total-count">전체 <strong>10,000</strong>건</p>    
    </section>

    
    <!-- 필터 섹션 -->
    <section class="filter-section">
        
        <div class="filters">
            <select>
                <option value="">직무/직업 전체</option>
                <option value="">기획•전략</option>
                <option value="">마케팅•홍보•조사</option>
                <option value="">회계•세무•재무</option>
                <option value="">인사•노무•HRD</option>
                <option value="">총무•법무•사무</option>
                <option value="">IT개발•데이터</option>
                <option value="">디자인</option>
                <option value="">영업•판매•무역</option>
                <option value="">고객상담•TM</option>
                <option value="">구매•자재•물류</option>
                <option value="">상품기획•MD</option>
                <option value="">운전•운송•배송</option>
                <option value="">서비스</option>
                <option value="">생산</option>
                <option value="">건설•건축</option>
                <option value="">의료</option>
                <option value="">연구•R&D</option>
                <option value="">교육</option>
                <option value="">미디어•문화•스포츠</option>
                <option value="">금융•보험</option>
                <option value="">공공•복지</option>
            </select>
            <select>
                <option>인기순</option>
                <option>최신순</option>
                <option>조회순</option>
                <option>공감 많은 순</option>
            </select>
        
        </div>
    </section>

    <div class="header-search-bar">
        <h2>게시글 목록</h2>
        <div class="search-bar">
            <input type="text" placeholder="검색어를 입력하세요">
            <button>🔍</button>
        </div>
    </div>

    <!-- 게시글 목록 테이블 -->
        <section class="post-list">
            
            <table>
                <thead>
                    <tr>
                        <th>No</th>
                        <th>직무</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>작성시간</th>
                        <th>조회수</th>
                        <th>공감</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example rows -->
                    <tr>
                        <td>2</td>
                        <td>IT개발·데이터</td>
                        <td>스타트업, 창업</td>
                        <td>홍길동</td>
                        <td>3분전</td>
                        <td>38</td>
                        <td>38</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>교육</td>
                        <td>[현직자 상담] 미래 진로에 대한 고민...</td>
                        <td>이길동</td>
                        <td>4분전</td>
                        <td>38</td>
                        <td>38</td>
                    </tr>
                    
                </tbody>
            </table>
        </section>
    </section>

    <br><br><br>
    <!-- 페이지네이션 컨트롤 -->
    <div class="pagination">
        <button id="prevPage" disabled>&#9664;</button>
        <span id="pageNumber">1</span>
        <button id="nextPage">&#9654;</button>
    </div>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
