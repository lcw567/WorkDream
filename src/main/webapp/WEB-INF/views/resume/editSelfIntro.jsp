<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자기소개서 수정</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selfIntro.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<div class="intro-container">
    <h1>자소서 수정</h1>
    <form action="${pageContext.request.contextPath}/resume/updateIntro" method="post">
        <input type="hidden" name="selfintroNo" value="${selfIntro.selfintroNo}">
        <div class="form-group">
            <label for="intro_name">제목:</label>
            <input type="text" id="intro_name" name="intro_name" value="${selfIntro.introTitle}" required>
        </div>
        <div class="form-group">
            <label for="intro_content">내용:</label>
            <textarea id="intro_content" name="intro_content" required>${selfIntro.introContent}</textarea>
        </div>
        <button type="submit">수정하기</button>
    </form>
</div>

<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
