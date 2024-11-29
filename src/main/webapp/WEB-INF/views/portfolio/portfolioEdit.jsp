<!-- WEB-INF/views/portfolio/portfolioEdit.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>포트폴리오 수정</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Summernote CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/portfolioPost.css">
</head>
<body data-page="edit">
    <!-- 헤더 포함 -->
    <c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="container mt-5">
        <h1 class="text-center tekhelet">포트폴리오 수정</h1>
        <form action="${pageContext.request.contextPath}/portfolio/update" method="post">
            <!-- Portfolio ID (숨김 필드) -->
            <input type="hidden" name="id" value="${portfolio.id}"/>

            <div class="form-group">
                <label for="title">제목</label>
                <input type="text" class="form-control tekhelet-border" id="title" name="title" value="${portfolio.title}" required>
            </div>
            <div class="form-group">
                <label for="summernote">내용</label>
                <textarea id="summernote" name="content">${portfolio.content}</textarea>
            </div>
            <button type="submit" class="btn btn-primary royal-purple">수정</button>
        </form>
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
    <script src="${pageContext.request.contextPath}/js/portfolioPost.js"></script>
</body>
</html>
