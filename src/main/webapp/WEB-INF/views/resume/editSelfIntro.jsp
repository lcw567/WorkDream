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
            <form action="${pageContext.request.contextPath}/updateIntro" method="post">
                <!-- 자기소개서 ID를 전달하기 위한 hidden input -->
                <input type="hidden" name="selfintroNo" value="${intro.selfintroNo}">
                <div class="intro-title">
                    <input type="text" class="input-name" placeholder="자소서 이름을 입력하세요" name="introTitle" value="${intro.introTitle}">
                    <!-- 기타 요소들 -->
                </div>
                <div class="content">
                    <textarea id="content-input" placeholder="내용을 입력하세요" maxlength="500" name="introContent">${intro.introContent}</textarea>
                    <!-- 기타 요소들 -->
                </div>
                <button type="submit" class="complete-btn">수정 완료</button>
            </form>
        </div>
    
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
