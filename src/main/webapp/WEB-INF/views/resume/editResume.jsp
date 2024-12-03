<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 날짜 형식 지정용 태그 라이브러리 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>워크드림 - 이력서 수정</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/editResume.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <!-- contextPath를 JavaScript 변수로 정의 -->
    <script type="text/javascript">
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/js/editResume.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/dynamicFields.js" defer></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="inner">
        <form id="resumeForm" action="update.re" method="post" enctype="multipart/form-data">
            <!-- CSRF 토큰 메타 태그 추가 -->
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <!-- 이력서 번호 -->
            <input type="hidden" name="resumeNo" value="${resume.resumeNo}"/>

            <div class="resume_title">
                <h1>이력서 제목  현재</h1> 
                <input type="text" name="resumeTitle" value="${resume.resumeTitle}" placeholder="이력서의 제목을 입력해주세요." required>
                <div class="resumeStatus">
                    <label class="resumeYorN">이력서 공개 여부</label>
                    <input type="hidden" name="resumeStatusHidden" value="N" />
                    <label for="resumeY">
                        <input type="checkbox" id="resumeY" name="resumeStatus" value="Y"
                            <c:if test="${resume.resumeStatus eq 'Y'}">checked="checked"</c:if> />
                        <span></span>&nbsp;
                </div>
            </div>
            <!-- 기본정보 -->
            <div class="Info">
                <fieldset class="basic_info">
                    <legend class="b_Info">기본정보</legend>
                    <div class="basic_inner">
                        <div id="basic1">
                            <fieldset class="name">
                                <legend class="username">이름*</legend>
                                <input type="text" name="userName" value="${resume.userName}" required>
                            </fieldset>
                            <fieldset class="gender">
                                <select name="userGender" id="selectgender" required>
                                    <option value="남자" <c:if test="${resume.userGender == '남자'}">selected</c:if>>남</option>
                                    <option value="여자" <c:if test="${resume.userGender == '여자'}">selected</c:if>>여</option>
                                </select>
                            </fieldset>
                            <fieldset class="birthday">
                                <legend class="userbirth">생년월일*</legend>
                                <input type="date" name="userBirth" value="<fmt:formatDate value='${resume.userBirth}' pattern='yyyy-MM-dd'/>" required>
                            </fieldset>
                        </div>
                        <div id="basic2">  
                            <fieldset class="email">
                                <legend class="useremail">이메일*</legend>
                                <input type="email" name="userEmail" value="${resume.userEmail}" required>
                            </fieldset>
                            <button type="button" class="email_check">인증</button>
                        </div>
                        <div id="basic3">  
                            <fieldset class="phone">
                                <legend class="userphone">전화번호*</legend>
                                <input type="text" name="userPhone" value="${resume.userPhone}" required>
                            </fieldset>
                            <button type="button" class="phone_check">인증</button>
                        </div>
                        <div id="basic4">
                            <fieldset class="address">
                                <legend class="useraddress">주소*</legend>
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="userAddress" value="${resume.userAddress}" required>
                            </fieldset>
                            <input type="button" class="addressNum" name="usernumberaddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                            <fieldset class="dtaddress1">
                                <legend class="roadAddress">도로명주소*</legend>
                                <input type="text" id="roadAddress" name="userRoadAddress" value="${resume.userRoadAddress}" placeholder="도로명주소" required>
                            </fieldset>
                            <fieldset class="dtaddress2">
                                <legend class="detailAddress">상세주소*</legend>
                                <input type="text" id="detailAddress" name="userDetailAddress" value="${resume.userDetailAddress}" placeholder="상세주소" required>
                            </fieldset>
                        </div>
                        <div id="basic5">
                            <img src="${resume.userPic != null ? resume.userPic : pageContext.request.contextPath}/img/file.png" class="profile_img" alt="프로필 이미지">
                            <input type="file" class="profile_upload" accept="image/*" name="userPicFile">
                        </div>
                    </div>
                </fieldset>
            </div>

            <!-- 최종 학력 -->
            <div class="education">
                <fieldset class="education_Lv">
                    <legend class="edu_Lv">최종 학력</legend>
                    <div id="edu1">
                        <div class="edu_inner1">
                            <fieldset class="final_edu">
                                <select name="educationLevel" id="selectedu" onchange="displayEducationFields()" >
                                    <option value="">학력 구분 선택*</option>
                                    <option value="초등학교" <c:if test="${resume.educationLevel == '초등학교'}">selected</c:if>>초등학교</option>
                                    <option value="중학교" <c:if test="${resume.educationLevel == '중학교'}">selected</c:if>>중학교</option>
                                    <option value="고등학교" <c:if test="${resume.educationLevel == '고등학교'}">selected</c:if>>고등학교</option>
                                    <option value="대학교/대학원 이상 졸업" <c:if test="${resume.educationLevel == '대학교/대학원 이상 졸업'}">selected</c:if>>대학교/대학원 이상 졸업</option>
                                </select>
                            </fieldset>
                        </div>

                        <!-- 초등학교 정보 -->
                        <div id="elementaryFields" style="display: ${resume.educationLevel == 'element' ? 'block' : 'none'};">    
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_el" class="element_name" value="${resume.academicName_el}">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_el" class="status">
                                        <option value="">졸업 여부</option>
                                        <option value="졸업" <c:if test="${resume.graduationStatus_el == '졸업'}">selected</c:if>>졸업</option>
                                        <option value="중퇴" <c:if test="${resume.graduationStatus_el == '중퇴'}">selected</c:if>>중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>중입 검정고시(초졸)</label>
                                    <input type="hidden" name="examPassed_el" value="N" id="examPassed_el_hidden" />
                                    <label for="middle_exam">
                                        <input type="checkbox" id="middle_exam" value="Y" <c:if test="${resume.examPassed_el == 'Y'}">checked</c:if>/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_el" class="enter_date" value="<fmt:formatDate value='${resume.enterDate_el}' pattern='yyyy-MM-dd'/>">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_el" class="graduation_date" value="<fmt:formatDate value='${resume.graduationDate_el}' pattern='yyyy-MM-dd'/>">
                                </fieldset>

                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_el" class="select_lo">
                                        <option value="" <c:if test="${resume.location_col == ''}">selected</c:if>>지역선택</option>
                                        <option value="서울" <c:if test="${resume.location_el == '서울'}">selected</c:if>>서울</option>
                                        <option value="부산" <c:if test="${resume.location_el == '부산'}">selected</c:if>>부산</option>
                                        <option value="대구" <c:if test="${resume.location_el == '대구'}">selected</c:if>>대구</option>
                                        <option value="인천" <c:if test="${resume.location_el == '인천'}">selected</c:if>>인천</option>
                                        <option value="광주" <c:if test="${resume.location_el == '광주'}">selected</c:if>>광주</option>
                                        <option value="대전" <c:if test="${resume.location_el == '대전'}">selected</c:if>>대전</option>
                                        <option value="울산" <c:if test="${resume.location_el == '울산'}">selected</c:if>>울산</option>
                                        <option value="세종" <c:if test="${resume.location_el == '세종'}">selected</c:if>>세종</option>
                                        <option value="제주" <c:if test="${resume.location_el == '제주'}">selected</c:if>>제주</option>
                                        <option value="강원" <c:if test="${resume.location_el == '강원'}">selected</c:if>>강원</option>
                                        <option value="경기" <c:if test="${resume.location_el == '경기'}">selected</c:if>>경기</option>
                                        <option value="충북" <c:if test="${resume.location_el == '충북'}">selected</c:if>>충북</option>
                                        <option value="충남" <c:if test="${resume.location_el == '충남'}">selected</c:if>>충남</option>
                                        <option value="전북" <c:if test="${resume.location_el == '전북'}">selected</c:if>>전북</option>
                                        <option value="전남" <c:if test="${resume.location_el == '전남'}">selected</c:if>>전남</option>
                                        <option value="경북" <c:if test="${resume.location_el == '경북'}">selected</c:if>>경북</option>
                                        <option value="경남" <c:if test="${resume.location_el == '경남'}">selected</c:if>>경남</option>
                                        <option value="해외" <c:if test="${resume.location_el == '해외'}">selected</c:if>>해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>

                        <!-- 중학교 정보 -->
                        <div id="middleSchoolFields" style="display: ${resume.educationLevel == 'middle' ? 'block' : 'none'};">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_mi" class="middle_name" value="${resume.academicName_mi}">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_mi" class="status">
                                        <option value="">졸업 여부</option>
                                        <option value="졸업" <c:if test="${resume.graduationStatus_mi == '졸업'}">selected</c:if>>졸업</option>
                                        <option value="중퇴" <c:if test="${resume.graduationStatus_mi == '중퇴'}">selected</c:if>>중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>고입 검정고시(중졸)</label>
                                    <input type="hidden" name="examPassed_mi" value="N" id="examPassed_mi_hidden" />
                                    <label for="high_exam">
                                        <input type="checkbox" id="high_exam" value="Y" <c:if test="${resume.examPassed_mi eq 'Y'}">checked</c:if>/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_mi" class="enter_date" value="<fmt:formatDate value='${resume.enterDate_mi}' pattern='yyyy-MM-dd'/>">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_mi" class="graduation_date" value="<fmt:formatDate value='${resume.graduationDate_mi}' pattern='yyyy-MM-dd'/>">
                                </fieldset>

                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_mi" class="select_lo">
                                        <option value="" <c:if test="${resume.location_col == ''}">selected</c:if>>지역선택</option>
                                        <option value="서울" <c:if test="${resume.location_mi == '서울'}">selected</c:if>>서울</option>
                                        <option value="부산" <c:if test="${resume.location_mi == '부산'}">selected</c:if>>부산</option>
                                        <option value="대구" <c:if test="${resume.location_mi == '대구'}">selected</c:if>>대구</option>
                                        <option value="인천" <c:if test="${resume.location_mi == '인천'}">selected</c:if>>인천</option>
                                        <option value="광주" <c:if test="${resume.location_mi == '광주'}">selected</c:if>>광주</option>
                                        <option value="대전" <c:if test="${resume.location_mi == '대전'}">selected</c:if>>대전</option>
                                        <option value="울산" <c:if test="${resume.location_mi == '울산'}">selected</c:if>>울산</option>
                                        <option value="세종" <c:if test="${resume.location_mi == '세종'}">selected</c:if>>세종</option>
                                        <option value="제주" <c:if test="${resume.location_mi == '제주'}">selected</c:if>>제주</option>
                                        <option value="강원" <c:if test="${resume.location_mi == '강원'}">selected</c:if>>강원</option>
                                        <option value="경기" <c:if test="${resume.location_mi == '경기'}">selected</c:if>>경기</option>
                                        <option value="충북" <c:if test="${resume.location_mi == '충북'}">selected</c:if>>충북</option>
                                        <option value="충남" <c:if test="${resume.location_mi == '충남'}">selected</c:if>>충남</option>
                                        <option value="전북" <c:if test="${resume.location_mi == '전북'}">selected</c:if>>전북</option>
                                        <option value="전남" <c:if test="${resume.location_mi == '전남'}">selected</c:if>>전남</option>
                                        <option value="경북" <c:if test="${resume.location_mi == '경북'}">selected</c:if>>경북</option>
                                        <option value="경남" <c:if test="${resume.location_mi == '경남'}">selected</c:if>>경남</option>
                                        <option value="해외" <c:if test="${resume.location_mi == '해외'}">selected</c:if>>해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>

                        <!-- 고등학교 정보 -->
                        <div id="highSchoolFields" style="display: ${resume.educationLevel == 'high' ? 'block' : 'none'};">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_hi" class="high_name" value="${resume.academicName_hi}">
                                </fieldset>
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_hi" class="status">
                                        <option value="">졸업 여부</option>
                                        <option value="졸업" <c:if test="${resume.graduationStatus_hi == '졸업'}">selected</c:if>>졸업</option>
                                        <option value="재학중" <c:if test="${resume.graduationStatus_hi == '재학중'}">selected</c:if>>재학중</option>
                                        <option value="중퇴" <c:if test="${resume.graduationStatus_hi == '중퇴'}">selected</c:if>>중퇴</option>
                                        <option value="졸업예정" <c:if test="${resume.graduationStatus_hi == '졸업예정'}">selected</c:if>>졸업예정</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>대입 검정고시</label>
                                    <input type="hidden" name="examPassed_hi" value="N" id="examPassed_hi_hidden" />
                                    <label for="college_exam">
                                        <input type="checkbox" id="college_exam" value="Y" <c:if test="${resume.examPassed_hi == 'Y'}">checked</c:if>/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>                                
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_hi" class="enter_date" value="<fmt:formatDate value='${resume.enterDate_hi}' pattern='yyyy-MM-dd'/>">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_hi" class="graduation_date" value="<fmt:formatDate value='${resume.graduationDate_hi}' pattern='yyyy-MM-dd'/>">
                                </fieldset>

                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_hi" class="select_lo">
                                        <option value="" <c:if test="${resume.location_col == ''}">selected</c:if>>지역선택</option>
                                        <option value="서울" <c:if test="${resume.location_hi == '서울'}">selected</c:if>>서울</option>
                                        <option value="부산" <c:if test="${resume.location_hi == '부산'}">selected</c:if>>부산</option>
                                        <option value="대구" <c:if test="${resume.location_hi == '대구'}">selected</c:if>>대구</option>
                                        <option value="인천" <c:if test="${resume.location_hi == '인천'}">selected</c:if>>인천</option>
                                        <option value="광주" <c:if test="${resume.location_hi == '광주'}">selected</c:if>>광주</option>
                                        <option value="대전" <c:if test="${resume.location_hi == '대전'}">selected</c:if>>대전</option>
                                        <option value="울산" <c:if test="${resume.location_hi == '울산'}">selected</c:if>>울산</option>
                                        <option value="세종" <c:if test="${resume.location_hi == '세종'}">selected</c:if>>세종</option>
                                        <option value="제주" <c:if test="${resume.location_hi == '제주'}">selected</c:if>>제주</option>
                                        <option value="강원" <c:if test="${resume.location_hi == '강원'}">selected</c:if>>강원</option>
                                        <option value="경기" <c:if test="${resume.location_hi == '경기'}">selected</c:if>>경기</option>
                                        <option value="충북" <c:if test="${resume.location_hi == '충북'}">selected</c:if>>충북</option>
                                        <option value="충남" <c:if test="${resume.location_hi == '충남'}">selected</c:if>>충남</option>
                                        <option value="전북" <c:if test="${resume.location_hi == '전북'}">selected</c:if>>전북</option>
                                        <option value="전남" <c:if test="${resume.location_hi == '전남'}">selected</c:if>>전남</option>
                                        <option value="경북" <c:if test="${resume.location_hi == '경북'}">selected</c:if>>경북</option>
                                        <option value="경남" <c:if test="${resume.location_hi == '경남'}">selected</c:if>>경남</option>
                                        <option value="해외" <c:if test="${resume.location_hi == '해외'}">selected</c:if>>해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>

                        <!-- 대학교 정보 -->
                        <div id="collegeFields" style="display: ${resume.educationLevel == 'college' ? 'block' : 'none'};">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_col" class="college_name" value="${resume.academicName_col}">
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>전공 *</legend>
                                    <input type="text" name="majorName_col" class="major_name" value="${resume.majorName_col}">
                                </fieldset>
                                    
                                <fieldset class="input-group">
                                    <legend>학제 *</legend>
                                    <select name="degree_col" class="degree">
                                        <option value="">학제</option>
                                        <option value="2년제" <c:if test="${resume.degree_col == '2년제'}">selected</c:if>>2년제</option>
                                        <option value="3년제" <c:if test="${resume.degree_col == '3년제'}">selected</c:if>>3년제</option>
                                        <option value="4년제" <c:if test="${resume.degree_col == '4년제'}">selected</c:if>>4년제</option>
                                        <option value="대학원(석사)" <c:if test="${resume.degree_col == '대학원(석사)'}">selected</c:if>>대학원(석사)</option>
                                        <option value="대학원(박사)" <c:if test="${resume.degree_col == '대학원(박사)'}">selected</c:if>>대학원(박사)</option>
                                    </select>
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_col" class="status">
                                        <option value="">졸업 여부</option>
                                        <option value="졸업" <c:if test="${resume.graduationStatus_col == '졸업'}">selected</c:if>>졸업</option>
                                        <option value="재학중" <c:if test="${resume.graduationStatus_col == '재학중'}">selected</c:if>>재학중</option>
                                        <option value="휴학중" <c:if test="${resume.graduationStatus_col == '휴학중'}">selected</c:if>>휴학중</option>
                                        <option value="중퇴" <c:if test="${resume.graduationStatus_col == '중퇴'}">selected</c:if>>중퇴</option>
                                        <option value="자퇴" <c:if test="${resume.graduationStatus_col == '자퇴'}">selected</c:if>>자퇴</option>
                                        <option value="졸업예정" <c:if test="${resume.graduationStatus_col == '졸업예정'}">selected</c:if>>졸업예정</option>
                                    </select>
                                </fieldset>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_col" class="enterDate_col" value="<fmt:formatDate value='${resume.enterDate_col}' pattern='yyyy-MM-dd'/>">
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_col" class="graduationDate_col" value="<fmt:formatDate value='${resume.graduationDate_col}' pattern='yyyy-MM-dd'/>">
                                </fieldset>

                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_col" class="select_lo">
                                        <option value="" <c:if test="${resume.location_col == ''}">selected</c:if>>지역선택</option>
                                        <option value="서울" <c:if test="${resume.location_col == '서울'}">selected</c:if>>서울</option>
                                        <option value="부산" <c:if test="${resume.location_col == '부산'}">selected</c:if>>부산</option>
                                        <option value="대구" <c:if test="${resume.location_col == '대구'}">selected</c:if>>대구</option>
                                        <option value="인천" <c:if test="${resume.location_col == '인천'}">selected</c:if>>인천</option>
                                        <option value="광주" <c:if test="${resume.location_col == '광주'}">selected</c:if>>광주</option>
                                        <option value="대전" <c:if test="${resume.location_col == '대전'}">selected</c:if>>대전</option>
                                        <option value="울산" <c:if test="${resume.location_col == '울산'}">selected</c:if>>울산</option>
                                        <option value="세종" <c:if test="${resume.location_col == '세종'}">selected</c:if>>세종</option>
                                        <option value="제주" <c:if test="${resume.location_col == '제주'}">selected</c:if>>제주</option>
                                        <option value="강원" <c:if test="${resume.location_col == '강원'}">selected</c:if>>강원</option>
                                        <option value="경기" <c:if test="${resume.location_col == '경기'}">selected</c:if>>경기</option>
                                        <option value="충북" <c:if test="${resume.location_col == '충북'}">selected</c:if>>충북</option>
                                        <option value="충남" <c:if test="${resume.location_col == '충남'}">selected</c:if>>충남</option>
                                        <option value="전북" <c:if test="${resume.location_col == '전북'}">selected</c:if>>전북</option>
                                        <option value="전남" <c:if test="${resume.location_col == '전남'}">selected</c:if>>전남</option>
                                        <option value="경북" <c:if test="${resume.location_col == '경북'}">selected</c:if>>경북</option>
                                        <option value="경남" <c:if test="${resume.location_col == '경남'}">selected</c:if>>경남</option>
                                        <option value="해외" <c:if test="${resume.location_col == '해외'}">selected</c:if>>해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="Career">
                <fieldset class="career <c:if test='${not empty resume.companyTitle}'>career-full</c:if>">
                    <legend class="career_Lv">경력</legend>
                    <c:if test="${empty resume.companyTitle}">
                        <label class="careerYorN">경력이 있을 경우 선택해주세요.</label>
                        <label for="CareerY">
                            <input type="checkbox" id="CareerY" name="career_present" />
                            <span></span>&nbsp;
                        </label>
                    </c:if>
                    <div class="career1" style="display: <c:if test='${empty resume.companyTitle}'>none</c:if>;">
                        <fieldset class="company_title">
                            <legend>회사명</legend>
                            <input type="text" class="com_title" name="companyTitle" value="${resume.companyTitle}">
                        </fieldset>
                        <fieldset class="enter_com">
                            <legend>입사년월</legend>
                            <input type="date" name="startDateWork" value="<fmt:formatDate value='${resume.startDateWork}' pattern='yyyy-MM-dd'/>">
                        </fieldset>
                        <fieldset class="retire_com">
                            <legend>퇴사년월</legend>
                            <input type="date" name="endDateWork" value="<fmt:formatDate value='${resume.endDateWork}' pattern='yyyy-MM-dd'/>">
                        </fieldset>
                        <fieldset class="input-group">
                            <legend>근무현황</legend>
                            <select name="careerStatus" class="career_status">
                                <option value="">근무현황</option>
                                <option value="재직중" <c:if test="${resume.careerStatus == '재직중'}">selected</c:if>>재직중</option>
                                <option value="퇴사" <c:if test="${resume.careerStatus == '퇴사'}">selected</c:if>>퇴사</option>
                                <option value="퇴사예정" <c:if test="${resume.careerStatus == '퇴사예정'}">selected</c:if>>퇴사예정</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="career2" style="display: <c:if test='${empty resume.companyTitle}'>none</c:if>;">
                        <fieldset class="job">
                            <legend>직무</legend>
                            <input type="text" class="job_name" name="work" value="${resume.work}">
                        </fieldset>
                        <fieldset class="department">
                            <legend>근무부서</legend>
                            <input type="text" class="department_name" name="department" value="${resume.department}">
                        </fieldset>
                        <fieldset class="position">
                            <legend>직급/직책</legend>
                            <input type="text" class="position_name" name="position" value="${resume.position}">
                        </fieldset>
                    </div>
                    <div class="career3" style="display: <c:if test='${empty resume.companyTitle}'>none</c:if>;">
                        <fieldset class="job_content">
                            <legend>담당업무</legend>
                            <textarea name="jobContent" id="j_content">${resume.jobContent}</textarea>
                        </fieldset>
                    </div>
                </fieldset>
            </div>
            
            
            <!-- 스킬 -->
            <div id="Skill">
                <fieldset class="skill">
                    <legend class="skill_name">스킬</legend>
                    <div id="sk_title1">
                        <fieldset class="skill_title">
                            <!-- 입력 필드에 id 추가 -->
                            <input type="text" id="skillInput" name="skillName" placeholder="툴/직무역량/소프트스킬을 입력해주세요.">
                        </fieldset>
                        <!-- 버튼에 onclick 이벤트 핸들러 추가 -->
                        <button type="button" class="addSkillButton" onclick="addSkill()">추가하기</button>
                    </div>
                    <div id="sk_title2" style="display: ${empty resume.skillName ? 'none' : 'block'}; height: ${empty resume.skillName ? '175px' : '225px'};">
                        <div id="MYsk">
                            <h1>나의 스킬</h1>
                            <div id="skillList">
                                <c:forEach var="skill" items="${fn:split(resume.skillName, ',')}">
                                    <div class="myskill1">#${skill} <span class="delete-icon" onclick="removeSkill(this)">❌</span></div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>                    
                </fieldset>
            </div>

            <!-- 경험/활동/교육 -->
            <div id="Experience">
                <fieldset class="experience">
                    <legend class="exp">경험/활동/교육</legend>
                    <div class="exp1">
                        <fieldset class="activity">
                            <legend>활동구분선택</legend>
                            <select name="activityType" class="select_activity">
                                <option value="">없음</option>
                                <option value="교내활동" <c:if test="${resume.activityType == '교내활동'}">selected</c:if>>교내활동</option>
                                <option value="인턴" <c:if test="${resume.activityType == '인턴'}">selected</c:if>>인턴</option>
                                <option value="자원봉사" <c:if test="${resume.activityType == '자원봉사'}">selected</c:if>>자원봉사</option>
                                <option value="동아리" <c:if test="${resume.activityType == '동아리'}">selected</c:if>>동아리</option>
                                <option value="아르바이트" <c:if test="${resume.activityType == '아르바이트'}">selected</c:if>>아르바이트</option>
                                <option value="사회활동" <c:if test="${resume.activityType == '사회활동'}">selected</c:if>>사회활동</option>
                                <option value="수행과제" <c:if test="${resume.activityType == '수행과제'}">selected</c:if>>수행과제</option>
                                <option value="해외연수" <c:if test="${resume.activityType == '해외연수'}">selected</c:if>>해외연수</option>
                                <option value="교육이수내역" <c:if test="${resume.activityType == '교육이수내역'}">selected</c:if>>교육이수내역</option>
                            </select>
                        </fieldset>
                        <fieldset class="place">
                            <legend class="place_name">기관/장소</legend>
                            <input type="text" name="organizationName" value="${resume.organizationName}">
                        </fieldset>
                        <fieldset class="start_date">
                            <legend>시작년월</legend>
                            <input type="date" name="startDateAct" value="<fmt:formatDate value='${resume.startDateAct}' pattern='yyyy-MM-dd'/>">
                        </fieldset>
                        <fieldset class="finish_date">
                            <legend>종료년월</legend>
                            <input type="date" name="endDateAct" value="<fmt:formatDate value='${resume.endDateAct}' pattern='yyyy-MM-dd'/>">
                        </fieldset>
                    </div>
                    <div class="exp2">
                        <fieldset class="exp_content">
                            <legend>활동설명</legend>
                            <textarea name="description" id="e_content" placeholder="경험/활동 상세내용 입력">${empty resume.description ? '' : resume.description}</textarea>
                        </fieldset>
                    </div>                    
                </fieldset>
            </div>

            <!-- 자격/어학/수상 섹션 -->
            <div class="awards">
                <fieldset class="select_awards">
                    <legend class="awa">자격/어학/수상</legend>
                    <div class="AWARDS">
                        <fieldset class="select_inner">
                            <legend>구분</legend>
                            <select name="category" id="sortation">
                                <option value="">구분*</option>
                                <option value="certificate" <c:if test="${resume.category == '자격증/면허증'}">selected</c:if>>자격증/면허증</option>
                                <option value="language" <c:if test="${resume.category == '어학시험'}">selected</c:if>>어학시험</option>
                                <option value="award_details" <c:if test="${resume.category == '수상내역/공모전'}">selected</c:if>>수상내역/공모전</option>
                            </select>
                        </fieldset>
                    </div>
                    
                     <!-- 자격증/면허증 정보 -->
                     <div class="awards2" id="certificateFields" style="display: none;">
                        <fieldset class="certi_title">
                            <legend>자격증명</legend>
                            <input type="text" name="qualificationName[]">
                        </fieldset>
                        <fieldset class="institution">
                            <legend>발행처/기관</legend>
                            <input type="text" name="issuingAgency[]">
                        </fieldset>
                        <fieldset class="pass_status">
                            <legend>합격구분</legend>
                            <select name="passStatus[]" class="pass_menu">
                                <option value="">합격구분*</option>
                                <option value="1차합격">1차합격</option>
                                <option value="2차합격">2차합격</option>
                                <option value="필기합격">필기합격</option>
                                <option value="실기합격">실기합격</option>
                                <option value="최종합격">최종합격</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="awards3" id="certificateDate" style="display: none;">
                        <fieldset class="pass_date">
                            <legend>시험일자</legend>
                            <input type="date" class="pass" name="testDate_cer[]">
                        </fieldset>
                        <button type="button" class="addQualificationButton">추가하기</button>
                    </div>
                    <!-- 어학시험 정보 -->
                    <div class="Language" id="languageFields" style="display: none;">
                        <div class="Lang">
                            <div class="language1">
                                <fieldset class="lang_title">
                                    <legend>어학시험명</legend>
                                    <input type="text" name="languageName[]">
                                </fieldset>
                                <fieldset class="level">
                                    <legend>급수</legend>
                                    <select name="proficiencyLevel[]" class="certi_level">
                                        <option value="">급수 선택</option>
                                        <option value="1">1급</option>
                                        <option value="2">2급</option>
                                        <option value="3">3급</option>
                                        <option value="4">4급</option>
                                        <option value="5">5급</option>
                                        <option value="6">6급</option>
                                        <option value="7">7급</option>
                                        <option value="8">8급</option>
                                        <option value="9">9급</option>
                                        <option value="10">10급</option>
                                        <option value="11">11급</option>
                                        <option value="12">12급</option>
                                        <option value="13">13급</option>
                                        <option value="14">14급</option>
                                        <option value="15">15급</option>
                                    </select>
                                </fieldset>
                                <fieldset class="lang_category">
                                    <legend>언어</legend>
                                    <select name="languageType[]" class="lang_cate">
                                        <option value="">언어 선택</option>
                                        <option value="영어">영어</option>
                                        <option value="일본어">일본어</option>
                                        <option value="중국어">중국어</option>
                                        <option value="독일어">독일어</option>
                                        <option value="불어">불어</option>
                                        <option value="스페인어">스페인어</option>
                                        <option value="러시아어">러시아어</option>
                                        <option value="이탈리아어">이탈리아어</option>
                                        <option value="한국어">한국어</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </fieldset>
                            </div>
                            <div class="language2" id="languageDate1">
                                <fieldset class="get_date">
                                    <legend>취득일</legend>
                                    <input type="date" class="get" name="issueDate[]">
                                </fieldset>
                                <button type="button" class="addLanguageButton">추가하기</button>
                            </div>
                        </div>
                    </div>
                    <!-- 수상/공모전 정보 -->
                    <div class="Contest" id="awardDetailsFields">
                        <div class="contest1">
                            <fieldset class="contest_title">
                                <legend>수상/공모전명</legend>
                                <input type="text" name="awardName[]">
                            </fieldset>
                            <fieldset class="contest_place">
                                <legend>주최기관</legend>
                                <input type="text" name="organizer[]">
                            </fieldset>
                            <fieldset class="acquire_date">
                                <legend>취득일</legend>
                                <input type="date" class="acquire" name="awardDate[]">
                            </fieldset>
                        </div>
                        <div class="contest2">
                            <button type="button" class="addAwardButton">추가하기</button>
                        </div>
                    </div>
                    
                    <!-- 자격증 리스트 -->
                      <!-- 삭제된 자격증 ID를 저장할 숨겨진 필드 -->
    <input type="hidden" name="deletedQualifications" id="deletedQualifications" value="" />
    <div class="result-list-certificate">
        <!-- 자격증 리스트 아이템들이 여기에 추가됩니다. -->
        <c:forEach var="certificate" items="${resume.certificates}">
        <div class="list-item" data-id="${certificate.certificateId}">
            <div class="item-content">
                <strong>${certificate.qualificationName}</strong> | ${certificate.passStatus} | 
                <fmt:formatDate value="${certificate.testDate_cer}" pattern="yyyy.MM.dd"/>
                <div class="institution">발행처: ${certificate.issuingAgency}</div>
            </div>
            <div class="actions">
                <button type="button" class="delete" onclick="removeCertificate(${certificate.certificateId})">삭제</button>
            </div>
            <!-- Hidden Inputs -->
            <input type="hidden" name="qualificationName[]" value="${certificate.qualificationName}">
            <input type="hidden" name="issuingAgency[]" value="${certificate.issuingAgency}">
            <input type="hidden" name="passStatus[]" value="${certificate.passStatus}">
            <input type="hidden" name="testDate_cer[]" value="${certificate.testDate_cer}">
        </div>
    </c:forEach>

</div>

<!-- 어학시험 리스트 -->
<div class="result-list-language">
    <!-- 어학시험 리스트 아이템들이 여기에 추가됩니다. -->
    <c:forEach var="languageTest" items="${resume.languageTests}">
        <div class="list-item" data-id="${languageTest.languageTestId}">
            <div class="item-content">
                <strong>${languageTest.languageName}</strong> | ${languageTest.proficiencyLevel}급 | ${languageTest.languageType} |
                <fmt:formatDate value="${languageTest.issueDate}" pattern="yyyy.MM.dd"/>
            </div>
            <div class="actions">
                <button type="button" class="delete" onclick="removeLanguageTest(${languageTest.languageTestId})">삭제</button>
            </div>
            <!-- Hidden Inputs -->
            <input type="hidden" name="languageName[]" value="${languageTest.languageName}">
            <input type="hidden" name="proficiencyLevel[]" value="${languageTest.proficiencyLevel}">
            <input type="hidden" name="languageType[]" value="${languageTest.languageType}">
            <input type="hidden" name="issueDate[]" value="${languageTest.issueDate}">
        </div>
    </c:forEach>
</div>

<!-- 수상내역 리스트 -->
<div class="result-list-awards">
    <!-- 수상내역 리스트 아이템들이 여기에 추가됩니다. -->
    <c:forEach var="award" items="${resume.awards}">
        <div class="list-item" data-id="${award.awardId}">
            <div class="item-content">
                <strong>${award.awardName}</strong> | 
                <fmt:formatDate value="${award.awardDate}" pattern="yyyy.MM.dd"/> | 주최기관: ${award.organizer}
            </div>
            <div class="actions">
                <button type="button" class="delete" onclick="removeAward(${award.awardId})">삭제</button>
            </div>
            <!-- Hidden Inputs -->
            <input type="hidden" name="awardName[]" value="${award.awardName}">
            <input type="hidden" name="organizer[]" value="${award.organizer}">
            <input type="hidden" name="awardDate[]" value="${award.awardDate}">
        </div>
    </c:forEach>
</div>

            </div>

            <!-- 취업우대사항 -->
            <div class="Preferential">
                <fieldset class="preferential">
                    <legend class="pre_title">취업우대사항</legend>
                    <div class="pre1">
                        <fieldset class="pre_content">
                            <legend>보훈사유</legend>
                            <input type="text" name="veteranReason" value="${resume.veteranReason}" placeholder="보훈사유 입력">
                        </fieldset>
                    </div>
                    <div class="pre2">
                        <fieldset class="mil_sub">
                            <legend>병역대상</legend>
                            <select name="serviceStatus" id="military_status" onchange="toggleMilitaryFields()">
                                <option value="대상아님" <c:if test="${resume.serviceStatus == '대상아님'}">selected</c:if>>대상아님</option>
                                <option value="미필" <c:if test="${resume.serviceStatus == '미필'}">selected</c:if>>미필</option>
                                <option value="군필" <c:if test="${resume.serviceStatus == '군필'}">selected</c:if>>군필</option>
                                <option value="면제" <c:if test="${resume.serviceStatus == '면제'}">selected</c:if>>면제</option>
                                <option value="복무중" <c:if test="${resume.serviceStatus == '복무중'}">selected</c:if>>복무중</option>
                            </select>
                        </fieldset>
                        <!-- 미필 사유 -->
                        <div class="unfulfilled" id="unfulfilledFields" style="display: ${resume.serviceStatus == '미필' ? 'flex' : 'none'};">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="unfulfilledReason" value="${resume.unfulfilledReason}" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <!-- 면제 사유 -->
                        <div class="EXEMPTED" id="exemptedFields" style="display: ${resume.serviceStatus == '면제' ? 'flex' : 'none'};">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="exemptionReason" value="${resume.exemptionReason}" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <!-- 군필 상세 -->
                        <div class="fulfilled" id="fulfilledFields" style="display: ${resume.serviceStatus == '군필' ? 'flex' : 'none'};">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="date" name="enlistmentDate_ful" value="<fmt:formatDate value='${resume.enlistmentDate_ful}' pattern='yyyy-MM-dd'/>">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="date" name="dischargeDate_ful" value="<fmt:formatDate value='${resume.dischargeDate_ful}' pattern='yyyy-MM-dd'/>">
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch_ful">
                                    <option value=""<c:if test="${resume.militaryBranch_ful == '군별선택'}">selected</c:if>>군별선택</option>
                                    <option value="육군" <c:if test="${resume.militaryBranch_ful == '육군'}">selected</c:if>>육군</option>
                                    <option value="해군" <c:if test="${resume.militaryBranch_ful == '해군'}">selected</c:if>>해군</option>
                                    <option value="공군" <c:if test="${resume.militaryBranch_ful == '공군'}">selected</c:if>>공군</option>
                                    <option value="해병" <c:if test="${resume.militaryBranch_ful == '해병'}">selected</c:if>>해병</option>
                                    <option value="의경" <c:if test="${resume.militaryBranch_ful == '의경'}">selected</c:if>>의경</option>
                                    <option value="전경" <c:if test="${resume.militaryBranch_ful == '전경'}">selected</c:if>>전경</option>
                                    <option value="기타" <c:if test="${resume.militaryBranch_ful == '기타'}">selected</c:if>>기타</option>
                                    <option value="사회복무요원" <c:if test="${resume.militaryBranch_ful == '사회복무요원'}">selected</c:if>>사회복무요원</option>
                                    <option value="의무소방" <c:if test="${resume.militaryBranch_ful == '의무소방'}">selected</c:if>>의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ful">
                                    <option value="" <c:if test="${resume.rank_ful == '계급선택'}">selected</c:if>>계급선택</option>
                                    <option value="이병" <c:if test="${resume.rank_ful == '이병'}">selected</c:if>>이병</option>
                                    <option value="일병" <c:if test="${resume.rank_ful == '일병'}">selected</c:if>>일병</option>
                                    <option value="상병" <c:if test="${resume.rank_ful == '상병'}">selected</c:if>>상병</option>
                                    <option value="병장" <c:if test="${resume.rank_ful == '병장'}">selected</c:if>>병장</option>
                                    <option value="하사" <c:if test="${resume.rank_ful == '하사'}">selected</c:if>>하사</option>
                                    <option value="중사" <c:if test="${resume.rank_ful == '중사'}">selected</c:if>>중사</option>
                                    <option value="상사" <c:if test="${resume.rank_ful == '상사'}">selected</c:if>>상사</option>
                                    <option value="원사" <c:if test="${resume.rank_ful == '원사'}">selected</c:if>>원사</option>
                                    <option value="준위" <c:if test="${resume.rank_ful == '준위'}">selected</c:if>>준위</option>
                                    <option value="소위" <c:if test="${resume.rank_ful == '소위'}">selected</c:if>>소위</option>
                                    <option value="중위" <c:if test="${resume.rank_ful == '중위'}">selected</c:if>>중위</option>
                                    <option value="대위" <c:if test="${resume.rank_ful == '대위'}">selected</c:if>>대위</option>
                                    <option value="소령" <c:if test="${resume.rank_ful == '소령'}">selected</c:if>>소령</option>
                                    <option value="중령" <c:if test="${resume.rank_ful == '중령'}">selected</c:if>>중령</option>
                                    <option value="대령" <c:if test="${resume.rank_ful == '대령'}">selected</c:if>>대령</option>
                                    <option value="준장" <c:if test="${resume.rank_ful == '준장'}">selected</c:if>>준장</option>
                                    <option value="소장" <c:if test="${resume.rank_ful == '소장'}">selected</c:if>>소장</option>
                                    <option value="중장" <c:if test="${resume.rank_ful == '중장'}">selected</c:if>>중장</option>
                                    <option value="대장" <c:if test="${resume.rank_ful == '대장'}">selected</c:if>>대장</option>
                                    <option value="기타" <c:if test="${resume.rank_ful == '기타'}">selected</c:if>>기타</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>전역사유 선택</legend>
                                <select name="dischargeReason_ful" id="discharge_reason">
                                    <option value="">전역사유</option>
                                    <option value="만기전역" <c:if test="${resume.dischargeReason_ful == '만기전역'}">selected</c:if>>만기전역</option>
                                    <option value="의가사전역" <c:if test="${resume.dischargeReason_ful == '의가사전역'}">selected</c:if>>의가사전역</option>
                                    <option value="의병전역" <c:if test="${resume.dischargeReason_ful == '의병전역'}">selected</c:if>>의병전역</option>
                                    <option value="소집해제" <c:if test="${resume.dischargeReason_ful == '소집해제'}">selected</c:if>>소집해제</option>
                                    <option value="불명예전역" <c:if test="${resume.dischargeReason_ful == '불명예전역'}">selected</c:if>>불명예전역</option>
                                    <option value="상이전역" <c:if test="${resume.dischargeReason_ful == '상이전역'}">selected</c:if>>상이전역</option>
                                    <option value="기타" <c:if test="${resume.dischargeReason_ful == '기타'}">selected</c:if>>기타</option>
                                </select>
                            </fieldset>
                        </div>
                        <!-- 복무중 상세 -->
                        <div class="serving" id="servingFields" style="display: ${resume.serviceStatus == '복무중' ? 'flex' : 'none'};">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="date" name="enlistmentDate_ser" value="<fmt:formatDate value='${resume.enlistmentDate_ser}' pattern='yyyy-MM-dd'/>">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="date" name="dischargeDate_ser" value="<fmt:formatDate value='${resume.dischargeDate_ser}' pattern='yyyy-MM-dd'/>" readonly>
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch_ser">
                                    <option value=""<c:if test="${resume.militaryBranch_ser == '군별선택'}">selected</c:if>>군별선택</option>
                                    <option value="육군" <c:if test="${resume.militaryBranch_ser == '육군'}">selected</c:if>>육군</option>
                                    <option value="해군" <c:if test="${resume.militaryBranch_ser == '해군'}">selected</c:if>>해군</option>
                                    <option value="공군" <c:if test="${resume.militaryBranch_ser == '공군'}">selected</c:if>>공군</option>
                                    <option value="해병" <c:if test="${resume.militaryBranch_ser == '해병'}">selected</c:if>>해병</option>
                                    <option value="의경" <c:if test="${resume.militaryBranch_ser == '의경'}">selected</c:if>>의경</option>
                                    <option value="전경" <c:if test="${resume.militaryBranch_ser == '전경'}">selected</c:if>>전경</option>
                                    <option value="기타" <c:if test="${resume.militaryBranch_ser == '기타'}">selected</c:if>>기타</option>
                                    <option value="사회복무요원" <c:if test="${resume.militaryBranch_ser == '사회복무요원'}">selected</c:if>>사회복무요원</option>
                                    <option value="의무소방" <c:if test="${resume.militaryBranch_ser == '의무소방'}">selected</c:if>>의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ser">
                                    <option value="" <c:if test="${resume.rank_ser == '계급선택'}">selected</c:if>>계급선택</option>
                                    <option value="이병" <c:if test="${resume.rank_ser == '이병'}">selected</c:if>>이병</option>
                                    <option value="일병" <c:if test="${resume.rank_ser == '일병'}">selected</c:if>>일병</option>
                                    <option value="상병" <c:if test="${resume.rank_ser == '상병'}">selected</c:if>>상병</option>
                                    <option value="병장" <c:if test="${resume.rank_ser == '병장'}">selected</c:if>>병장</option>
                                    <option value="하사" <c:if test="${resume.rank_ser == '하사'}">selected</c:if>>하사</option>
                                    <option value="중사" <c:if test="${resume.rank_ser == '중사'}">selected</c:if>>중사</option>
                                    <option value="상사" <c:if test="${resume.rank_ser == '상사'}">selected</c:if>>상사</option>
                                    <option value="원사" <c:if test="${resume.rank_ser == '원사'}">selected</c:if>>원사</option>
                                    <option value="준위" <c:if test="${resume.rank_ser == '준위'}">selected</c:if>>준위</option>
                                    <option value="소위" <c:if test="${resume.rank_ser == '소위'}">selected</c:if>>소위</option>
                                    <option value="중위" <c:if test="${resume.rank_ser == '중위'}">selected</c:if>>중위</option>
                                    <option value="대위" <c:if test="${resume.rank_ser == '대위'}">selected</c:if>>대위</option>
                                    <option value="소령" <c:if test="${resume.rank_ser == '소령'}">selected</c:if>>소령</option>
                                    <option value="중령" <c:if test="${resume.rank_ser == '중령'}">selected</c:if>>중령</option>
                                    <option value="대령" <c:if test="${resume.rank_ser == '대령'}">selected</c:if>>대령</option>
                                    <option value="준장" <c:if test="${resume.rank_ser == '준장'}">selected</c:if>>준장</option>
                                    <option value="소장" <c:if test="${resume.rank_ser == '소장'}">selected</c:if>>소장</option>
                                    <option value="중장" <c:if test="${resume.rank_ser == '중장'}">selected</c:if>>중장</option>
                                    <option value="대장" <c:if test="${resume.rank_ser == '대장'}">selected</c:if>>대장</option>
                                    <option value="기타" <c:if test="${resume.rank_ser == '기타'}">selected</c:if>>기타</option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                </fieldset>
            </div>

            <!-- 제출 버튼 -->
            <div class="btn_select">
                <button type="submit" class="final_save">수정 완료</button>
            </div>
        </form>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
