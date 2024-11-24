<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDream - 기업 정보 등록</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/businessProfilePost.css">
    
    <!-- window.contextPath 설정 -->
    <script type="text/javascript">
        window.contextPath = "${pageContext.request.contextPath}";
    </script>
    
    <script src="${pageContext.request.contextPath}/js/businessProfilePost.js" defer></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header_biz.jsp" />
    <div class="post-container">
        <div class="header">
            <h1>기업 정보 등록</h1>
            <button type="button" class="register-btn">등록하기</button>
        </div>
        <form action="#" id="business-form" method="post" enctype="multipart/form-data">
            <!-- 메인 프로필 테이블 -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>대표 기업 로고</th>
                        <td>
                            <input type="file" id="company-logo" name="companyLogo" class="input-text" accept="image/*">
                            <div id="logo-preview-container">
                                <c:choose>
                                    <c:when test="${not empty business.logo}">
                                        <img id="logo-preview" src="${business.logo}" alt="로고 미리보기" style="display: block; max-width: 200px; margin-top: 10px;">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="logo-preview" src="#" alt="로고 미리보기" style="display: none; max-width: 200px; margin-top: 10px;">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                    </tr>
                    <tr>
					    <th>기업명</th>
					    <td>
					        <input type="text" class="input-text" name="companyName" maxlength="100" placeholder="기업명을 입력하세요" value="${business.companyName}">
					    </td>
					</tr>
                    <tr>
                        <th>기업 한줄 소개</th>
                        <td>
                            <input type="text" class="input-text" name="shortIntroduction" maxlength="100" placeholder="기업 한줄소개를 입력하세요" value="${business.shortIntroduction}">
                        </td>
                    </tr>
                    <tr>
                        <th>기업 홈페이지</th>
                        <td>
                        	<input type="url" class="input-text" name="companySite" maxlength="100" placeholder="기업홈페이지 주소를 입력하세요" value="${business.companySite}">
                        </td>
                    </tr>
                    <tr>
                        <th>기업 형태</th>
                        <td>
                            <div class="radio-group">
					            <label><input type="radio" name="companyType" class="input-radio" value="대기업" <c:if test="${business.companyType == '대기업'}">checked</c:if>> 대기업</label>
					            <label><input type="radio" name="companyType" class="input-radio" value="중견기업" <c:if test="${business.companyType == '중견기업'}">checked</c:if>> 중견기업</label>
					            <label><input type="radio" name="companyType" class="input-radio" value="중소기업" <c:if test="${business.companyType == '중소기업'}">checked</c:if>> 중소기업</label>
					            <label><input type="radio" name="companyType" class="input-radio" value="기타" <c:if test="${business.companyType == '기타'}">checked</c:if>> 기타</label>
					        </div>
                        </td>
                    </tr>
                    <tr>
                        <th>기업 직원수</th>
                        <td>
                            <input type="number" class="input-text" name="employeeCount" min="0" placeholder="기업 직원수를 입력하세요" value="${business.employeeCount}">
                        </td>
                    </tr>
                    <tr>
                        <th>대표자명</th>
                        <td>
                        	<input type="text" class="input-text" name="ownerName" maxlength="100" placeholder="대표자명을 입력하세요" value="${business.ownerName}">
                        </td>
                    </tr>
                    <tr>
                        <th>업종</th>
                        <td>
                            <input type="text" class="input-text" name="industry" maxlength="100" placeholder="업종을 입력하세요" value="${business.industry}">
                        </td>
                    </tr>
                    <tr>
                        <th>브랜드명</th>
                        <td>
                        	<input type="text" class="input-text" name="brandName" maxlength="100" placeholder="브랜드명을 입력하세요" value="${business.brandName}">
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" class="input-text" name="companyAddr" maxlength="100" placeholder="주소를 입력하세요" value="${business.companyAddr}">
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 기업소개 테이블 -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>기업소개</th>
                        <td>
                            <textarea class="long-text" name="introduction" maxlength="1000" placeholder="기업소개를 입력하세요">${business.introduction}</textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 기업비전 테이블 -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>기업비전</th>
                        <td>
                            <textarea class="long-text" name="vision" maxlength="1000" placeholder="기업비전을 입력하세요">${business.vision}</textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 복리후생 테이블 -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th rowspan="2">복리후생</th>
                        <td colspan="2">
                            <input type="text" id="benefits-input" class="input-text" placeholder="입력 후 Enter 키를 누르세요">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="benefits-list">
                            <!-- 복리후생 항목이 추가될 곳 -->
                            <c:if test="${not empty business.benefits}">
                                <c:forEach var="benefit" items="${business.benefits}">
                                    <span class="benefit-item">
                                        ${benefit.benefit}
                                        <button class="remove-benefit">×</button>
                                    </span>
                                </c:forEach>
                            </c:if>
                        </td>
                    </tr>
                </table>
            </div>

            <!-- 사내 근무 환경 테이블 -->
            <div class="table-wrapper">
                <table class="main-profile">
                    <tr>
                        <th>사내 근무 환경</th>
                        <td>
                            <div class="image-grid">
                                <!-- 최대 8개의 이미지 -->
                                <c:forEach var="i" begin="0" end="7">
                                    <div class="image-item">
                                        <c:choose>
                                            <c:when test="${business.workEnvironmentImages != null && business.workEnvironmentImages.size() > i}">
                                                <img src="${business.workEnvironmentImages[i].imageUrl}" class="add-icon" alt="이미지">
                                                <input type="file" name="workEnvironmentImages" accept="image/*" class="hidden-file-input">
                                                <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요" value="${business.workEnvironmentImages[i].title}">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/img/add-image.png" class="add-icon" alt="이미지 추가 아이콘">
                                                <input type="file" name="workEnvironmentImages" accept="image/*" class="hidden-file-input">
                                                <input type="text" class="photo-title" placeholder="사진 제목을 입력해주세요">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>  
    </div>
</body>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</html>
