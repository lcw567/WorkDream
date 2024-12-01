<!-- WEB-INF/views/portfolio/portfolioDashboard.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포트폴리오 관리</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/portfolioDashboard.css">
</head>
<body data-page="dashboard">
    <!-- 헤더 포함 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="container mt-5">
        <!-- 페이지 제목 -->
        <h1 class="text-center tekhelet styled-title">포트폴리오 관리</h1>
        
        <!-- 포트폴리오 작성 버튼 추가 -->
        <div class="text-right mb-3">
            <a href="${pageContext.request.contextPath}/portfolio/portfolioPost" class="btn btn-purple">포트폴리오 작성</a>
        </div>
        
        <!-- 포트폴리오 목록 테이블 -->
        <table class="table table-striped table-hover">
            <thead class="tekhelet-bg text-white">
                <tr>
                    <th>ID</th>
                    <th>제목</th>
                    <th>작성일</th>
                    <th>수정일</th>
                    <th>작업</th>
                </tr>
            </thead>
            <tbody>
                <!-- 포트폴리오 목록 반복 -->
                <c:forEach var="portfolio" items="${portfolios}">
                    <tr>
                        <td>${portfolio.portfolioId}</td>
                        <td>${portfolio.title}</td>
                        <td>${portfolio.createDate}</td>
                        <td>${portfolio.updateDate}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/portfolio/portfolioEdit?id=${portfolio.portfolioId}" class="btn btn-sm btn-edit">수정</a>
                            <a href="${pageContext.request.contextPath}/portfolio/portfolioView?id=${portfolio.portfolioId}" class="btn btn-sm btn-purple">열람</a>
                            <!-- 삭제 폼 -->
                            <form action="${pageContext.request.contextPath}/portfolio/delete" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="${portfolio.portfolioId}"/>
                                <button type="submit" class="btn btn-sm btn-danger delete-button">삭제</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <!-- 페이지네이션 컨트롤 -->
		<c:if test="${not empty pageInfo and pageInfo.maxPage > 0}">
		    <nav aria-label="Page navigation">
		        <ul class="pagination justify-content-center">
		            <c:if test="${pageInfo.currentPage > 1}">
		                <li class="page-item">
		                    <a class="page-link" href="?page=${pageInfo.currentPage - 1}" aria-label="Previous">
		                        <span aria-hidden="true">&laquo;</span>
		                    </a>
		                </li>
		            </c:if>
		            <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i">
		                <li class="page-item <c:if test='${i == pageInfo.currentPage}'>active</c:if>">
		                    <a class="page-link" href="?page=${i}">${i}</a>
		                </li>
		            </c:forEach>
		            <c:if test="${pageInfo.currentPage < pageInfo.maxPage}">
		                <li class="page-item">
		                    <a class="page-link" href="?page=${pageInfo.currentPage + 1}" aria-label="Next">
		                        <span aria-hidden="true">&raquo;</span>
		                    </a>
		                </li>
		            </c:if>
		        </ul>
		    </nav>
		</c:if>

        
        <!-- 사용설명 추가 -->
        <div class="alert alert-info custom-alert" role="alert">
            🖋️ 포트폴리오 작성 도구란?<br>
            쉽고 빠르게 나만의 멋진 포트폴리오를 만들 수 있는 도구예요!<br> 
            직관적인 편집기와 다양한 템플릿으로 누구나 전문가처럼 제작할 수 있어요.✨<br>
            <br>
            👨‍💼 권장 사용 대상<br>
            ✅ 취업 준비생: 프로젝트와 경력을 돋보이게 하고 싶은 분<br> 
            ✅ 프리랜서: 클라이언트에게 전문성을 어필하려는 분<br>
            ✅ 이직 준비자: 새 직장을 위해 경력을 정리하려는 분<br> 
            ✅ 학생: 연구 성과와 학업 활동을 정리하려는 분<br>
            <br>
            📣 지금 바로 나만의 매력적인 포트폴리오를 만들어 보세요! 🚀<br>
        </div>
    </div>
     
    <!-- 푸터 포함 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/portfolioDashboard.js"></script>
</body>
</html>
