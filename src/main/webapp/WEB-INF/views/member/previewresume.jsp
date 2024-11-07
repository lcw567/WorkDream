<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워크드림</title>
<link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/previewresume.css">
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="resume-preview">
        <div class="header">
            <div class="name-info">홍길동 <span class="meta-info">신입</span></div>
            <div class="meta-info">2000 (24세)  |  기업이 이력서 열람/제안 시 개인정보는 정상 노출됩니다.</div>
            <div class="profile">
                <img src="${pageContext.request.contextPath}/img/test.jpg" alt="프로필 사진">
                <div class="basic-info">
                    <p>이메일: 홍길동@naver.com</p>
                    <p>휴대폰: 010-1111-1111</p>
                    <p>주소:서울 강남구 테헤란로</p>
                </div>
            </div>
        </div>
        
        <div class="info-cards">
            <div class="info-card">
                <h3>학력</h3>
                <p>서울대학교</p>
                <p>대학교(4년제) 졸업</p>
            </div>
            <div class="info-card">
                <h3>전공</h3>
                <p>지능정보통신공학과</p>
            </div>
            <div class="info-card">
                <h3>경력</h3>
                <p>-</p>
            </div>
            <div class="info-card">
                <h3>희망연봉</h3>
                <p>회사내규에 따름</p>
            </div>
            <div class="info-card">
                <h3>포트폴리오</h3>
                <p>-</p>
            </div>
        </div>

        <div class="skills">
            <h3>나의 스킬</h3>
            <div class="skills-list">
                <div class="skill-badge">Linux</div>
                <div class="skill-badge">C#</div>
                <div class="skill-badge">Android</div>
                <div class="skill-badge">C++</div>
                <div class="skill-badge">영상처리</div>
            </div>
        </div>

        <h2>학력</h2>
        <div class="section">
            <p>2019.03 ~ 2025.02 졸업</p>
            <p><strong>서울대학교(4년제)</strong> 지능정보통신공학과</p>
            <p>지역: 서울 | 학점: 4.5/4.5 | 주야간: 주간</p>
        </div>
    </div>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>