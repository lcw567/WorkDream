<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자기소개서 작성</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/selfIntro.css">
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

    <div class="intro-container">
        <div class="intro-title">
            <input type="text" class="input-name" placeholder="자소서 이름을 입력하세요">
            <button class="confirm-btn">확인</button>
            <button class="help-btn">❕
                <div class="tooltip">
                    <p>
                        자기소개서 이름 관리 <br><br>
                        자기소개서 관리를 위한 이름을 설정해주세요. <br>
                        설정한 이름은 향후 자기소개서를 수정하거나 <br> 
                        조회할 때 필요합니다. <br>
                        자기소개서 이름은 본인만 확인할 수 있으며, <br>
                        자유롭게 설정하실 수 있습니다.</p>
                </div>
            </button>
        </div>
        <div class="content">
            <label for="content-input">내용</label>
            <textarea id="content-input" placeholder="내용을 입력하세요" maxlength="500"></textarea>
            <div class="notice">
                <span class="char-count">500자 공백 포함</span>
                <button class="complete-btn">작성 완료</button>
            </div>
        </div>
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
