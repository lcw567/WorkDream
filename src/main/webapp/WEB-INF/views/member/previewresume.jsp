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
    <div class="pre_body">
        <div class="pre_header">
            <h1>이력서 미리보기</h1>
        </div>
        <div class="pre_inner">
            <fieldset class="basic_title">
                <legend>OOO님의 이력서</legend>
                <p>기본정보</p>
                <div class="pre_inner1">
                    <div class="pre_inner1-1">
                        <h2>홍길동</h2>
                        <h2>남, 2000(24세)</h2>
                    </div>
                    <h2>이메일 : aaa@gmail.com</h2>
                    <h2>휴대폰 : 010-0000-0000</h2>
                    <h2>주소 : (00000)서울시 강남구 테헤란로</h2>
                </div>
                <p>학력</p>
                <div class="pre_inner2">
                    <div class="pre_inner2-1">
                        <h2>2021.03~</h2>
                        <h2>재학중</h2>
                        <h2>OO대학교(4년제) OOOOO학과</h2>
                    </div>
                </div>
                <p>경력</p>
                <div class="pre_inner3">
                    <div class="pre_inner3-1">
                        <h2>20xx.xx~</h2>
                        <h2>20xx.xx</h2>
                        <h2>(주)회사이름</h2>
                        <h2>담당업무</h2>
                        <h2>00부서 인턴/수습 광고기획</h2>
                    </div>
                </div>
                <p>스킬</p>
                <div class="pre_inner4">
                    <div class="pre_inner4-1">
                        <h2>#java</h2>
                    </div>
                </div>
                <p>경험/활동/교육</p>
                <div class="pre_inner5">
                    <div class="pre_inner5-1">
                        <h2>20xx.xx~</h2>
                        <h2>20xx.xx</h2>
                        <h2>기관명</h2>
                        <h2>상세입력내용</h2>
                        <h2>(인턴)</h2>
                    </div>
                </div>
                <p>자격/어학/수상</p>
                <div class="pre_inner6">
                    <div class="pre_inner6-1">
                        <h2>자격증이름</h2>
                        <h2>발행처</h2>
                        <h2>합격구분</h2>
                        <h2>획득년도</h2>
                    </div>
                </div>
                <p>포트폴리오</p>
                <div class="pre_inner7">
                    <div class="pre_inner7-1">
                        <h2>포트폴리오</h2>
                        <h2>포트폴리오 링크</h2>
                    </div>
                </div>
                <p>자기소개서</p>
                <div class="pre_inner8">
                    <div class="pre_inner8-1">
                        <h2>자기소개서</h2>
                        <h2>자기소개서 내용</h2>
                    </div>
                </div>
                <p>취업우대사항</p>
                <div class="pre_inner9">
                    <div class="pre_inner9-1">
                        <h2>보훈대상</h2>
                        <h2>보훈 사유</h2>
                    </div>
                    <div class="pre_inner9-2">
                        <h2>병역: 군필</h2>
                        <h2>육군/병장 | 만기전역 | 2024.02 ~ 2024.05</h2>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>