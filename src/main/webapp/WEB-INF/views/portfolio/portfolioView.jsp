<!-- WEB-INF/views/portfolio/portfolioView.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포트폴리오 열람</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Summernote CSS (읽기 전용) -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/portfolioView.css">
</head>
<body data-page="view">
    <!-- 헤더 포함 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />
    
    <div class="container mt-5">
        <h1 class="tekhelet">포트폴리오 열람</h1>
        <div class="card">
            <div class="card-header tekhelet-bg text-white">
                <h2>포트폴리오 제목 예시</h2>
            </div>
            <div class="card-body">
                <div id="summernote" data-content="포트폴리오 내용 예시입니다. 이 영역에 포트폴리오의 상세 내용이 표시됩니다."></div>
            </div>
            <div class="card-footer text-right">
                <a href="#" class="btn btn-secondary grape">관리 페이지로 돌아가기</a>
            </div>
        </div>
    </div>
    
    <!-- 푸터 포함 -->
    <c:import url="/WEB-INF/views/common/footer.jsp" />
    
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <!-- Summernote JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js"></script>
    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/js/portfolioView.js"></script>
</body>
</html>
