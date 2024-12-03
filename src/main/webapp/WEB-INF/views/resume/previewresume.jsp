<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
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
        <div class="pre_inner">
            <fieldset class="basic_title">
                <legend>${resume.resumeTitle}</legend>
                
                <!-- 기본정보 -->
                <p>기본정보</p>
                <div class="pre_inner1">
                    <div class="pre_inner1-1">
                        <h2>이름 : ${resume.userName}</h2><br>
                        <h2>성별 : ${resume.userGender}</h2><br>
                        <h2>생년월일 : ${resume.userBirth}</h2>
                    </div>
                    <h2>이메일 : ${resume.userEmail}</h2>
                    <h2>휴대폰 : ${resume.userPhone}</h2>
                    <h2>주소 : (${resume.userAddress}) ${resume.userRoadAddress} ${resume.userDetailAddress}</h2>
                </div>
                
                <!-- 학력 -->
                <p>학력</p>
                <div class="pre_inner2">
                    <c:choose>
                        <c:when test="${resume.educationLevel == '초등학교'}">
                            <!-- 초등학교 학력 정보 -->
                            <div class="pre_inner2-1">
                                <h2>${resume.enterDate_el} ~ 
                                    <c:choose>
                                        <c:when test="${resume.graduationStatus_el == '졸업'}">
                                            ${resume.graduationDate_el}
                                        </c:when>
                                        <c:otherwise>
                                            재학중
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                                <h2>상태: ${resume.graduationStatus_el}</h2>
                                <h2>학교명: ${resume.academicName_el}</h2>
                                <h2>지역: ${resume.location_el}</h2>
                                <h2>검정고시 합격 여부: ${resume.examPassed_el}</h2>
                            </div>
                        </c:when>
                        
                        <c:when test="${resume.educationLevel == '중학교'}">
                            <!-- 중학교 학력 정보 -->
                            <div class="pre_inner2-1">
                                <h2>${resume.enterDate_mi} ~ 
                                    <c:choose>
                                        <c:when test="${resume.graduationStatus_mi == '졸업'}">
                                            ${resume.graduationDate_mi}
                                        </c:when>
                                        <c:otherwise>
                                            재학중
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                                <h2>상태: ${resume.graduationStatus_mi}</h2>
                                <h2>학교명: ${resume.academicName_mi}</h2>
                                <h2>지역: ${resume.location_mi}</h2>
                                <h2>검정고시 합격 여부: ${resume.examPassed_mi}</h2>
                            </div>
                        </c:when>
                        
                        <c:when test="${resume.educationLevel == '고등학교'}">
                            <!-- 고등학교 학력 정보 -->
                            <div class="pre_inner2-1">
                                <h2>${resume.enterDate_hi} ~ 
                                    <c:choose>
                                        <c:when test="${resume.graduationStatus_hi == '졸업'}">
                                            ${resume.graduationDate_hi}
                                        </c:when>
                                        <c:otherwise>
                                            재학중
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                                <h2>상태: ${resume.graduationStatus_hi}</h2>
                                <h2>학교명: ${resume.academicName_hi}</h2>
                                <h2>지역: ${resume.location_hi}</h2>
                                <h2>검정고시 합격 여부: ${resume.examPassed_hi}</h2>
                            </div>
                        </c:when>
                        
                        <c:when test="${resume.educationLevel == '대학교'}">
                            <!-- 대학교 학력 정보 -->
                            <div class="pre_inner2-1">
                                <h2>${resume.enterDate_col} ~ 
                                    <c:choose>
                                        <c:when test="${resume.graduationStatus_col == '졸업'}">
                                            ${resume.graduationDate_col}
                                        </c:when>
                                        <c:otherwise>
                                            재학중
                                        </c:otherwise>
                                    </c:choose>
                                </h2>
                                <h2>상태: ${resume.graduationStatus_col}</h2>
                                <h2>학교명: ${resume.academicName_col}</h2>
                                <h2>전공: ${resume.majorName_col}</h2>
                                <h2>학위: ${resume.degree_col}</h2>
                                <h2>지역: ${resume.location_col}</h2>
                                <h2>검정고시 합격 여부: ${resume.examPassed_col}</h2>
                            </div>
                        </c:when>
                        
                        <c:otherwise>
                            <div class="pre_inner2-1">
                                <h2>학력 정보가 등록되지 않았습니다.</h2>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- 경력 -->
                <p>경력</p>
                <div class="pre_inner3">
                    <c:if test="${not empty resume.companyTitle}">
                        <div class="pre_inner3-1">
                            <h2>${resume.startDateWork} ~ 
                                <c:choose>
                                    <c:when test="${resume.careerStatus == '재직중'}">
                                        재직중
                                    </c:when>
                                    <c:otherwise>
                                        ${resume.endDateWork}
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                            <h2>회사명: ${resume.companyTitle}</h2>
                            <h2>부서: ${resume.department}</h2>
                            <h2>직급: ${resume.position}</h2>
                            <h2>담당업무: ${resume.jobContent}</h2>
                        </div>
                    </c:if>
                    <c:if test="${empty resume.companyTitle}">
                        <div class="pre_inner3-1">
                            <h2>경력 정보가 등록되지 않았습니다.</h2>
                        </div>
                    </c:if>
                </div>
                
                <!-- 스킬 -->
                <p>스킬</p>
                <div class="pre_inner4">
                    <div class="pre_inner4-1">
                        <c:if test="${not empty resume.skillName}">
                            <h2>#${resume.skillName}</h2>
                        </c:if>
                        <c:if test="${empty resume.skillName}">
                            <h2>스킬 정보가 등록되지 않았습니다.</h2>
                        </c:if>
                    </div>
                </div>
                
                <!-- 경험/활동/교육 -->
                <p>경험/활동/교육</p>
                <div class="pre_inner5">
                    <c:if test="${not empty resume.activityType}">
                        <div class="pre_inner5-1">
                            <h2>${resume.startDateAct} ~ 
                                <c:choose>
                                    <c:when test="${resume.endDateAct != null}">
                                        ${resume.endDateAct}
                                    </c:when>
                                    <c:otherwise>
                                        활동중
                                    </c:otherwise>
                                </c:choose>
                            </h2>
                            <h2>기관명: ${resume.organizationName}</h2>
                            <h2>활동설명: ${resume.description}</h2>
                            <h2>활동구분: ${resume.activityType}</h2>
                        </div>
                    </c:if>
                    <c:if test="${empty resume.activityType}">
                        <div class="pre_inner5-1">
                            <h2>경험/활동/교육 정보가 등록되지 않았습니다.</h2>
                        </div>
                    </c:if>
                </div>
                
                <!-- 자격/어학/수상 -->
                <p>자격/어학/수상</p>
                <div class="pre_inner6">
                    <!-- 자격증 -->
                    <c:forEach var="certificate" items="${resume.certificates}">
                        <div class="pre_inner6-1">
                            <h2>자격증명: ${Certificate.qualificationName}</h2>
                            <h2>합격 구분: ${Certificate.passStatus}</h2>
                            <h2>발급 기관: ${Certificate.issuingAgency}</h2>
                            <h2>취득일: ${Certificate.testDate_cer}</h2>
                        </div>
                    </c:forEach>
                    
                    <!-- 어학시험 -->
                    <c:forEach var="languageTest" items="${resume.languageTests}">
                        <div class="pre_inner6-1">
                            <h2>어학시험명: ${languageTest.languageName}</h2>
                            <h2>급수: ${languageTest.proficiencyLevel}</h2>
                            <h2>취득 유형: ${languageTest.languageType}</h2>
                            <h2>취득일: ${languageTest.issueDate}</h2>
                        </div>
                    </c:forEach>
                    
                    <!-- 수상/공모전 -->
                    <c:forEach var="award" items="${resume.awards}">
                        <div class="pre_inner6-1">
                            <h2>수상/공모전명: ${award.awardName}</h2>
                            <h2>주최자: ${award.organizer}</h2>
                            <h2>취득일: ${award.awardDate}</h2>
                        </div>
                    </c:forEach>
                </div>
                
                <!-- 취업우대사항 -->
                <p>취업우대사항</p>
                <div class="pre_inner9">
                    <!-- 보훈대상 -->
                    <div class="pre_inner9-1">
                        <c:if test="${not empty resume.veteranReason}">
                            <h2>보훈 사유: ${resume.veteranReason}</h2>
                        </c:if>
                        <c:if test="${empty resume.veteranReason}">
                            <h2>보훈 사유: 없음</h2>
                        </c:if>
                    </div>
                    <br>
                    <br>
                    <br><br><br>
                    <!-- 병역 -->
                    <div class="pre_inner9-1">
                        <h2>병역: ${resume.serviceStatus}</h2>
                        <c:choose>
                            <c:when test="${resume.serviceStatus == '군필'}">
                                <h2>입대일: ${resume.enlistmentDate_ful} | 전역일: ${resume.dischargeDate_ful} | 군별: ${resume.militaryBranch_ful} | 계급: ${resume.rank_ful} | 전역사유: ${resume.dischargeReason_ful}</h2>
                            </c:when>
                            <c:when test="${resume.serviceStatus == '미필'}">
                                <h2>미필 사유: ${resume.unfulfilledReason}</h2>
                            </c:when>
                            <c:when test="${resume.serviceStatus == '면제'}">
                                <h2>면제 사유: ${resume.exemptionReason}</h2>
                            </c:when>
                            <c:otherwise>
                                <h2>병역 정보가 없습니다.</h2>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </fieldset>
        </div>
        <form action="resumeDashboard" method="get">
            <div class="btn_select">
                <button type="submit" class="final_check">확인 완료</button>
            </div>
        </form>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
