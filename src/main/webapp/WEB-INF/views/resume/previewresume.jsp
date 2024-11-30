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
                <legend>${resume.userName}님의 이력서</legend>
                
                <!-- 기본정보 -->
                <p>기본정보</p>
                <div class="pre_inner1">
                    <div class="pre_inner1-1">
                        <h2>${resume.userName}</h2>
                        <h2>${resume.userGender}, ${fn:substring(resume.userBirth.toString(), 0, 4)}(${calculateAge(resume.userBirth)})세</h2>
                    </div>
                    <h2>이메일 : ${resume.userEmail}</h2>
                    <h2>휴대폰 : ${resume.userPhone}</h2>
                    <h2>주소 : (${resume.userAddress})${resume.userRoadAddress}</h2>
                </div>
                
                <!-- 학력 -->
                <p>학력</p>
                <div class="pre_inner2">
                    <c:forEach var="education" items="${resume.educations}">
                        <div class="pre_inner2-1">
                            <h2>${education.enterDate} ~ 
                                <c:choose>
                                    <c:when test="${education.graduationStatus == '졸업'}">
                                        ${education.graduationDate}
                                    </c:when>
                                    <c:otherwise>
                                        재학중
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                            <h2>${education.status}</h2>
                            <h2>${education.academicName}(${education.degree}) ${education.major}</h2>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 경력 -->
                <p>경력</p>
                <div class="pre_inner3">
                    <c:forEach var="career" items="${resume.careers}">
                        <div class="pre_inner3-1">
                            <h2>${career.startDate} ~ ${career.endDate}</h2>
                            <h2>${career.companyName}</h2>
                            <h2>${career.department}</h2>
                            <h2>${career.position}</h2>
                            <h2>${career.jobContent}</h2>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 스킬 -->
                <p>스킬</p>
                <div class="pre_inner4">
                    <div class="pre_inner4-1">
                        <c:forEach var="skill" items="${resume.skills}">
                            <h2>#${skill.skillName}</h2>
                        </c:forEach>
                    </div>
                </div>
                
                <!-- 경험/활동/교육 -->
                <p>경험/활동/교육</p>
                <div class="pre_inner5">
                    <c:forEach var="activity" items="${resume.activities}">
                        <div class="pre_inner5-1">
                            <h2>${activity.startDate} ~ ${activity.endDate}</h2>
                            <h2>${activity.organizationName}</h2>
                            <h2>${activity.description}</h2>
                            <h2>(${activity.role})</h2>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 자격/어학/수상 -->
                <p>자격/어학/수상</p>
                <div class="pre_inner6">
                    <c:forEach var="certificate" items="${resume.certificates}">
                        <div class="pre_inner6-1">
                            <h2>${certificate.qualificationName}</h2>
                            <h2>${certificate.issuingAgency}</h2>
                            <h2>${certificate.passStatus}</h2>
                            <h2>${certificate.testDateCer}</h2>
                        </div>
                    </c:forEach>
                    
                    <c:forEach var="languageTest" items="${resume.languageTests}">
                        <div class="pre_inner6-1">
                            <h2>${languageTest.languageName}</h2>
                            <h2>${languageTest.proficiencyLevel}</h2>
                            <h2>${languageTest.languageType}</h2>
                            <h2>${languageTest.issueDate}</h2>
                        </div>
                    </c:forEach>
                    
                    <c:forEach var="award" items="${resume.awards}">
                        <div class="pre_inner6-1">
                            <h2>${award.awardName}</h2>
                            <h2>${award.organizer}</h2>
                            <h2>${award.awardDate}</h2>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 포트폴리오 -->
                <p>포트폴리오</p>
                <div class="pre_inner7">
                    <div class="pre_inner7-1">
                        <h2>${resume.portfolioName}</h2>
                        <h2><a href="${resume.portfolioLink}" target="_blank">${resume.portfolioLink}</a></h2>
                    </div>
                </div>
                
                <!-- 자기소개서 -->
                <p>자기소개서</p>
                <div class="pre_inner8">
                    <div class="pre_inner8-1">
                        <h2>${resume.selfIntroductionTitle}</h2>
                        <h2>${resume.selfIntroductionContent}</h2>
                    </div>
                </div>
                
                <!-- 취업우대사항 -->
                <p>취업우대사항</p>
                <div class="pre_inner9">
                    <div class="pre_inner9-1">
                        <h2>보훈대상</h2>
                        <h2>보훈 사유</h2>
                    </div>
                    <c:if test="${not empty resume.veteranReason}">
                        <div class="pre_inner9-2">
                            <h2>보훈 사유: ${resume.veteranReason}</h2>
                        </div>
                    </c:if>
                    <div class="pre_inner9-1">
                        <h2>병역: ${resume.serviceStatus}</h2>
                        <c:if test="${resume.serviceStatus == '군필'}">
                            <h2>${resume.militaryBranchFul} | ${resume.rankFul} | ${resume.dischargeDateFul}</h2>
                        </c:if>
                        <c:if test="${resume.serviceStatus == '미필'}">
                            <h2>${resume.militaryBranchSer} | ${resume.rankSer} | ${resume.dischargeDateSer}</h2>
                        </c:if>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
