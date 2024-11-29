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
        <h1 class="text-center tekhelet">포트폴리오 관리</h1>
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
                <!-- 임시 데이터 시작 -->
                <tr>
                    <td>1</td>
                    <td>포트폴리오 첫 번째</td>
                    <td>2024-01-01</td>
                    <td>2024-01-02</td>
                    <td>
                        <a href="#" class="btn btn-sm grape">수정</a>
                        <button class="btn btn-sm btn-danger">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>포트폴리오 두 번째</td>
                    <td>2024-02-10</td>
                    <td>2024-02-12</td>
                    <td>
                        <a href="#" class="btn btn-sm grape">수정</a>
                        <button class="btn btn-sm btn-danger">삭제</button>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>포트폴리오 세 번째</td>
                    <td>2024-03-15</td>
                    <td>2024-03-16</td>
                    <td>
                        <a href="#" class="btn btn-sm grape">수정</a>
                        <button class="btn btn-sm btn-danger">삭제</button>
                    </td>
                </tr>
                <!-- 임시 데이터 끝 -->
            </tbody>
        </table>
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
