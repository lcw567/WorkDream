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
                <h1>이력서 제목</h1> 
                <input type="text" name="resumeTitle" value="${resume.resumeTitle}" placeholder="이력서의 제목을 입력해주세요." required>
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
                                    <option value="M" <c:if test="${resume.userGender == 'M'}">selected</c:if>>남</option>
                                    <option value="F" <c:if test="${resume.userGender == 'F'}">selected</c:if>>여</option>
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
                                    <option value="element" <c:if test="${resume.educationLevel == 'element'}">selected</c:if>>초등학교</option>
                                    <option value="middle" <c:if test="${resume.educationLevel == 'middle'}">selected</c:if>>중학교</option>
                                    <option value="high" <c:if test="${resume.educationLevel == 'high'}">selected</c:if>>고등학교</option>
                                    <option value="college" <c:if test="${resume.educationLevel == 'college'}">selected</c:if>>대학교/대학원 이상 졸업</option>
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
                                        <option value="graduate" <c:if test="${resume.graduationStatus_el == 'graduate'}">selected</c:if>>졸업</option>
                                        <option value="withdraw" <c:if test="${resume.graduationStatus_el == 'withdraw'}">selected</c:if>>중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>중입 검정고시(초졸)</label>
                                    <label for="middle_exam">
                                        <input type="checkbox" id="middle_exam" name="examPassed_el" value="Y" <c:if test="${resume.examPassed_el == 'Y'}">checked</c:if>/>
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
                                        <option value="">지역선택</option>
                                        <option value="seoul" <c:if test="${resume.location_el == 'seoul'}">selected</c:if>>서울</option>
                                        <option value="busan" <c:if test="${resume.location_el == 'busan'}">selected</c:if>>부산</option>
                                        <option value="daegu" <c:if test="${resume.location_el == 'daegu'}">selected</c:if>>대구</option>
                                        <option value="incheon" <c:if test="${resume.location_el == 'incheon'}">selected</c:if>>인천</option>
                                        <option value="gwangju" <c:if test="${resume.location_el == 'gwangju'}">selected</c:if>>광주</option>
                                        <option value="daejeon" <c:if test="${resume.location_el == 'daejeon'}">selected</c:if>>대전</option>
                                        <option value="ulsan" <c:if test="${resume.location_el == 'ulsan'}">selected</c:if>>울산</option>
                                        <option value="sejong" <c:if test="${resume.location_el == 'sejong'}">selected</c:if>>세종</option>
                                        <option value="jeju" <c:if test="${resume.location_el == 'jeju'}">selected</c:if>>제주</option>
                                        <option value="gangwon" <c:if test="${resume.location_el == 'gangwon'}">selected</c:if>>강원</option>
                                        <option value="gyeonggi" <c:if test="${resume.location_el == 'gyeonggi'}">selected</c:if>>경기</option>
                                        <option value="chungbuk" <c:if test="${resume.location_el == 'chungbuk'}">selected</c:if>>충북</option>
                                        <option value="chungnam" <c:if test="${resume.location_el == 'chungnam'}">selected</c:if>>충남</option>
                                        <option value="jeonbuk" <c:if test="${resume.location_el == 'jeonbuk'}">selected</c:if>>전북</option>
                                        <option value="jeonnam" <c:if test="${resume.location_el == 'jeonnam'}">selected</c:if>>전남</option>
                                        <option value="gyeongbuk" <c:if test="${resume.location_el == 'gyeongbuk'}">selected</c:if>>경북</option>
                                        <option value="gyeongnam" <c:if test="${resume.location_el == 'gyeongnam'}">selected</c:if>>경남</option>
                                        <option value="overseas" <c:if test="${resume.location_el == 'overseas'}">selected</c:if>>해외</option>
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
                                        <option value="graduate" <c:if test="${resume.graduationStatus_mi == 'graduate'}">selected</c:if>>졸업</option>
                                        <option value="withdraw" <c:if test="${resume.graduationStatus_mi == 'withdraw'}">selected</c:if>>중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>고입 검정고시(중졸)</label>
                                    <label for="high_exam">
                                        <input type="checkbox" id="high_exam" name="examPassed_mi" value="Y" <c:if test="${resume.examPassed_mi eq 'Y'}">checked</c:if>/>
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
                                        <option value="" <c:if test="${resume.location_mi == ''}">selected</c:if>>지역선택</option>
                                        <option value="seoul" <c:if test="${resume.location_mi == 'seoul'}">selected</c:if>>서울</option>
                                        <option value="busan" <c:if test="${resume.location_mi == 'busan'}">selected</c:if>>부산</option>
                                        <option value="daegu" <c:if test="${resume.location_mi == 'daegu'}">selected</c:if>>대구</option>
                                        <option value="incheon" <c:if test="${resume.location_mi == 'incheon'}">selected</c:if>>인천</option>
                                        <option value="gwangju" <c:if test="${resume.location_mi == 'gwangju'}">selected</c:if>>광주</option>
                                        <option value="daejeon" <c:if test="${resume.location_mi == 'daejeon'}">selected</c:if>>대전</option>
                                        <option value="ulsan" <c:if test="${resume.location_mi == 'ulsan'}">selected</c:if>>울산</option>
                                        <option value="sejong" <c:if test="${resume.location_mi == 'sejong'}">selected</c:if>>세종</option>
                                        <option value="jeju" <c:if test="${resume.location_mi == 'jeju'}">selected</c:if>>제주</option>
                                        <option value="gangwon" <c:if test="${resume.location_mi == 'gangwon'}">selected</c:if>>강원</option>
                                        <option value="gyeonggi" <c:if test="${resume.location_mi == 'gyeonggi'}">selected</c:if>>경기</option>
                                        <option value="chungbuk" <c:if test="${resume.location_mi == 'chungbuk'}">selected</c:if>>충북</option>
                                        <option value="chungnam" <c:if test="${resume.location_mi == 'chungnam'}">selected</c:if>>충남</option>
                                        <option value="jeonbuk" <c:if test="${resume.location_mi == 'jeonbuk'}">selected</c:if>>전북</option>
                                        <option value="jeonnam" <c:if test="${resume.location_mi == 'jeonnam'}">selected</c:if>>전남</option>
                                        <option value="gyeongbuk" <c:if test="${resume.location_mi == 'gyeongbuk'}">selected</c:if>>경북</option>
                                        <option value="gyeongnam" <c:if test="${resume.location_mi == 'gyeongnam'}">selected</c:if>>경남</option>
                                        <option value="overseas" <c:if test="${resume.location_mi == 'overseas'}">selected</c:if>>해외</option>
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
                                        <option value="graduate" <c:if test="${resume.graduationStatus_hi == 'graduate'}">selected</c:if>>졸업</option>
                                        <option value="attending" <c:if test="${resume.graduationStatus_hi == 'attending'}">selected</c:if>>재학중</option>
                                        <option value="withdraw" <c:if test="${resume.graduationStatus_hi == 'withdraw'}">selected</c:if>>중퇴</option>
                                        <option value="graduating" <c:if test="${resume.graduationStatus_hi == 'graduating'}">selected</c:if>>졸업예정</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>대입 검정고시</label>
                                    <label for="college_exam">
                                        <input type="checkbox" id="college_exam" name="examPassed_hi" value="Y" <c:if test="${resume.examPassed_hi == 'Y'}">checked</c:if>/>
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
                                        <option value="" <c:if test="${resume.location_hi == ''}">selected</c:if>>지역선택</option>
                                        <option value="seoul" <c:if test="${resume.location_hi == 'seoul'}">selected</c:if>>서울</option>
                                        <option value="busan" <c:if test="${resume.location_hi == 'busan'}">selected</c:if>>부산</option>
                                        <option value="daegu" <c:if test="${resume.location_hi == 'daegu'}">selected</c:if>>대구</option>
                                        <option value="incheon" <c:if test="${resume.location_hi == 'incheon'}">selected</c:if>>인천</option>
                                        <option value="gwangju" <c:if test="${resume.location_hi == 'gwangju'}">selected</c:if>>광주</option>
                                        <option value="daejeon" <c:if test="${resume.location_hi == 'daejeon'}">selected</c:if>>대전</option>
                                        <option value="ulsan" <c:if test="${resume.location_hi == 'ulsan'}">selected</c:if>>울산</option>
                                        <option value="sejong" <c:if test="${resume.location_hi == 'sejong'}">selected</c:if>>세종</option>
                                        <option value="jeju" <c:if test="${resume.location_hi == 'jeju'}">selected</c:if>>제주</option>
                                        <option value="gangwon" <c:if test="${resume.location_hi == 'gangwon'}">selected</c:if>>강원</option>
                                        <option value="gyeonggi" <c:if test="${resume.location_hi == 'gyeonggi'}">selected</c:if>>경기</option>
                                        <option value="chungbuk" <c:if test="${resume.location_hi == 'chungbuk'}">selected</c:if>>충북</option>
                                        <option value="chungnam" <c:if test="${resume.location_hi == 'chungnam'}">selected</c:if>>충남</option>
                                        <option value="jeonbuk" <c:if test="${resume.location_hi == 'jeonbuk'}">selected</c:if>>전북</option>
                                        <option value="jeonnam" <c:if test="${resume.location_hi == 'jeonnam'}">selected</c:if>>전남</option>
                                        <option value="gyeongbuk" <c:if test="${resume.location_hi == 'gyeongbuk'}">selected</c:if>>경북</option>
                                        <option value="gyeongnam" <c:if test="${resume.location_hi == 'gyeongnam'}">selected</c:if>>경남</option>
                                        <option value="overseas" <c:if test="${resume.location_hi == 'overseas'}">selected</c:if>>해외</option>
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
                                        <option value="2year" <c:if test="${resume.degree_col == '2year'}">selected</c:if>>2년제</option>
                                        <option value="3year" <c:if test="${resume.degree_col == '3year'}">selected</c:if>>3년제</option>
                                        <option value="4year" <c:if test="${resume.degree_col == '4year'}">selected</c:if>>4년제</option>
                                        <option value="master" <c:if test="${resume.degree_col == 'master'}">selected</c:if>>대학원(석사)</option>
                                        <option value="dr" <c:if test="${resume.degree_col == 'dr'}">selected</c:if>>대학원(박사)</option>
                                    </select>
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_col" class="status">
                                        <option value="">졸업 여부</option>
                                        <option value="graduate" <c:if test="${resume.graduationStatus_col == 'graduate'}">selected</c:if>>졸업</option>
                                        <option value="attending" <c:if test="${resume.graduationStatus_col == 'attending'}">selected</c:if>>재학중</option>
                                        <option value="absence" <c:if test="${resume.graduationStatus_col == 'absence'}">selected</c:if>>휴학중</option>
                                        <option value="withdraw" <c:if test="${resume.graduationStatus_col == 'withdraw'}">selected</c:if>>중퇴</option>
                                        <option value="dropping" <c:if test="${resume.graduationStatus_col == 'dropping'}">selected</c:if>>자퇴</option>
                                        <option value="expected" <c:if test="${resume.graduationStatus_col == 'expected'}">selected</c:if>>졸업예정</option>
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
                                        <option value="seoul" <c:if test="${resume.location_col == 'seoul'}">selected</c:if>>서울</option>
                                        <option value="busan" <c:if test="${resume.location_col == 'busan'}">selected</c:if>>부산</option>
                                        <option value="daegu" <c:if test="${resume.location_col == 'daegu'}">selected</c:if>>대구</option>
                                        <option value="incheon" <c:if test="${resume.location_col == 'incheon'}">selected</c:if>>인천</option>
                                        <option value="gwangju" <c:if test="${resume.location_col == 'gwangju'}">selected</c:if>>광주</option>
                                        <option value="daejeon" <c:if test="${resume.location_col == 'daejeon'}">selected</c:if>>대전</option>
                                        <option value="ulsan" <c:if test="${resume.location_col == 'ulsan'}">selected</c:if>>울산</option>
                                        <option value="sejong" <c:if test="${resume.location_col == 'sejong'}">selected</c:if>>세종</option>
                                        <option value="jeju" <c:if test="${resume.location_col == 'jeju'}">selected</c:if>>제주</option>
                                        <option value="gangwon" <c:if test="${resume.location_col == 'gangwon'}">selected</c:if>>강원</option>
                                        <option value="gyeonggi" <c:if test="${resume.location_col == 'gyeonggi'}">selected</c:if>>경기</option>
                                        <option value="chungbuk" <c:if test="${resume.location_col == 'chungbuk'}">selected</c:if>>충북</option>
                                        <option value="chungnam" <c:if test="${resume.location_col == 'chungnam'}">selected</c:if>>충남</option>
                                        <option value="jeonbuk" <c:if test="${resume.location_col == 'jeonbuk'}">selected</c:if>>전북</option>
                                        <option value="jeonnam" <c:if test="${resume.location_col == 'jeonnam'}">selected</c:if>>전남</option>
                                        <option value="gyeongbuk" <c:if test="${resume.location_col == 'gyeongbuk'}">selected</c:if>>경북</option>
                                        <option value="gyeongnam" <c:if test="${resume.location_col == 'gyeongnam'}">selected</c:if>>경남</option>
                                        <option value="overseas" <c:if test="${resume.location_col == 'overseas'}">selected</c:if>>해외</option>
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
                                <option value="Y" <c:if test="${resume.careerStatus == 'Y'}">selected</c:if>>재직중</option>
                                <option value="N" <c:if test="${resume.careerStatus == 'N'}">selected</c:if>>퇴사</option>
                                <option value="P" <c:if test="${resume.careerStatus == 'P'}">selected</c:if>>퇴사예정</option>
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
                            <input type="text" name="skillName" placeholder="툴/직무역량/소프트스킬을 입력해주세요.">
                        </fieldset>
                        <button type="button" class="addSkillButton">추가하기</button>
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
                                <option value="working" <c:if test="${resume.activityType == 'working'}">selected</c:if>>교내활동</option>
                                <option value="intern" <c:if test="${resume.activityType == 'intern'}">selected</c:if>>인턴</option>
                                <option value="volunteer" <c:if test="${resume.activityType == 'volunteer'}">selected</c:if>>자원봉사</option>
                                <option value="club" <c:if test="${resume.activityType == 'club'}">selected</c:if>>동아리</option>
                                <option value="parttime" <c:if test="${resume.activityType == 'parttime'}">selected</c:if>>아르바이트</option>
                                <option value="social" <c:if test="${resume.activityType == 'social'}">selected</c:if>>사회활동</option>
                                <option value="project" <c:if test="${resume.activityType == 'project'}">selected</c:if>>수행과제</option>
                                <option value="overseas" <c:if test="${resume.activityType == 'overseas'}">selected</c:if>>해외연수</option>
                                <option value="education" <c:if test="${resume.activityType == 'education'}">selected</c:if>>교육이수내역</option>
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
                                <option value="certificate" <c:if test="${resume.category == 'certificate'}">selected</c:if>>자격증/면허증</option>
                                <option value="language" <c:if test="${resume.category == 'language'}">selected</c:if>>어학시험</option>
                                <option value="award_details" <c:if test="${resume.category == 'award_details'}">selected</c:if>>수상내역/공모전</option>
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
                                <option value="1pass">1차합격</option>
                                <option value="2pass">2차합격</option>
                                <option value="writtenpass">필기합격</option>
                                <option value="practicepass">실기합격</option>
                                <option value="finalpass">최종합격</option>
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
                                <option value="not" <c:if test="${resume.serviceStatus == 'not'}">selected</c:if>>대상아님</option>
                                <option value="unfulfilled" <c:if test="${resume.serviceStatus == 'unfulfilled'}">selected</c:if>>미필</option>
                                <option value="fulfilled" <c:if test="${resume.serviceStatus == 'fulfilled'}">selected</c:if>>군필</option>
                                <option value="exempted" <c:if test="${resume.serviceStatus == 'exempted'}">selected</c:if>>면제</option>
                                <option value="serving" <c:if test="${resume.serviceStatus == 'serving'}">selected</c:if>>복무중</option>
                            </select>
                        </fieldset>
                        <!-- 미필 사유 -->
                        <div class="unfulfilled" id="unfulfilledFields" style="display: ${resume.serviceStatus == 'unfulfilled' ? 'flex' : 'none'};">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="unfulfilledReason" value="${resume.unfulfilledReason}" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <!-- 면제 사유 -->
                        <div class="EXEMPTED" id="exemptedFields" style="display: ${resume.serviceStatus == 'exempted' ? 'flex' : 'none'};">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="exemptionReason" value="${resume.exemptionReason}" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <!-- 군필 상세 -->
                        <div class="fulfilled" id="fulfilledFields" style="display: ${resume.serviceStatus == 'fulfilled' ? 'flex' : 'none'};">
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
                                    <option value=""<c:if test="${resume.militaryBranch_ful == ''}">selected</c:if>>군별선택</option>
                                    <option value="1" <c:if test="${resume.militaryBranch_ful == 'army'}">selected</c:if>>육군</option>
                                    <option value="2" <c:if test="${resume.militaryBranch_ful == 'navy'}">selected</c:if>>해군</option>
                                    <option value="3" <c:if test="${resume.militaryBranch_ful == 'airforce'}">selected</c:if>>공군</option>
                                    <option value="4" <c:if test="${resume.militaryBranch_ful == 'Marine'}">selected</c:if>>해병</option>
                                    <option value="5" <c:if test="${resume.militaryBranch_ful == 'policeman'}">selected</c:if>>의경</option>
                                    <option value="6" <c:if test="${resume.militaryBranch_ful == 'combatpolice'}">selected</c:if>>전경</option>
                                    <option value="7" <c:if test="${resume.militaryBranch_ful == 'etc'}">selected</c:if>>기타</option>
                                    <option value="8" <c:if test="${resume.militaryBranch_ful == 'socialserviceworker'}">selected</c:if>>사회복무요원</option>
                                    <option value="9" <c:if test="${resume.militaryBranch_ful == 'firefighting'}">selected</c:if>>의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ful">
                                    <option value="" <c:if test="${resume.rank_ful == ''}">selected</c:if>>군별선택</option>
                                    <option value="1" <c:if test="${resume.rank_ful == '1'}">selected</c:if>>이병</option>
                                    <option value="2" <c:if test="${resume.rank_ful == '2'}">selected</c:if>>일병</option>
                                    <option value="3" <c:if test="${resume.rank_ful == '3'}">selected</c:if>>상병</option>
                                    <option value="4" <c:if test="${resume.rank_ful == '4'}">selected</c:if>>병장</option>
                                    <option value="5" <c:if test="${resume.rank_ful == '5'}">selected</c:if>>하사</option>
                                    <option value="6" <c:if test="${resume.rank_ful == '6'}">selected</c:if>>중사</option>
                                    <option value="7" <c:if test="${resume.rank_ful == '7'}">selected</c:if>>상사</option>
                                    <option value="8" <c:if test="${resume.rank_ful == '8'}">selected</c:if>>원사</option>
                                    <option value="9" <c:if test="${resume.rank_ful == '9'}">selected</c:if>>준위</option>
                                    <option value="10" <c:if test="${resume.rank_ful == '10'}">selected</c:if>>소위</option>
                                    <option value="11" <c:if test="${resume.rank_ful == '11'}">selected</c:if>>중위</option>
                                    <option value="12" <c:if test="${resume.rank_ful == '12'}">selected</c:if>>대위</option>
                                    <option value="13" <c:if test="${resume.rank_ful == '13'}">selected</c:if>>소령</option>
                                    <option value="14" <c:if test="${resume.rank_ful == '14'}">selected</c:if>>중령</option>
                                    <option value="15" <c:if test="${resume.rank_ful == '15'}">selected</c:if>>대령</option>
                                    <option value="16" <c:if test="${resume.rank_ful == '16'}">selected</c:if>>준장</option>
                                    <option value="17" <c:if test="${resume.rank_ful == '17'}">selected</c:if>>소장</option>
                                    <option value="18" <c:if test="${resume.rank_ful == '18'}">selected</c:if>>중장</option>
                                    <option value="19" <c:if test="${resume.rank_ful == '19'}">selected</c:if>>대장</option>
                                    <option value="20" <c:if test="${resume.rank_ful == '20'}">selected</c:if>>기타</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>전역사유 선택</legend>
                                <select name="dischargeReason_ful" id="discharge_reason">
                                    <option value="">전역사유</option>
                                    <option value="1" <c:if test="${resume.dischargeReason_ful == '1'}">selected</c:if>>만기전역</option>
                                    <option value="2" <c:if test="${resume.dischargeReason_ful == '2'}">selected</c:if>>의가사전역</option>
                                    <option value="3" <c:if test="${resume.dischargeReason_ful == '3'}">selected</c:if>>의병전역</option>
                                    <option value="4" <c:if test="${resume.dischargeReason_ful == '4'}">selected</c:if>>소집해제</option>
                                    <option value="5" <c:if test="${resume.dischargeReason_ful == '5'}">selected</c:if>>불명예전역</option>
                                    <option value="6" <c:if test="${resume.dischargeReason_ful == '6'}">selected</c:if>>상이전역</option>
                                    <option value="7" <c:if test="${resume.dischargeReason_ful == '7'}">selected</c:if>>기타</option>
                                </select>
                            </fieldset>
                        </div>
                        <!-- 복무중 상세 -->
                        <div class="serving" id="servingFields" style="display: ${resume.serviceStatus == 'serving' ? 'flex' : 'none'};">
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
                                    <option value=""<c:if test="${resume.militaryBranch_ser == ''}">selected</c:if>>군별선택</option>
                                    <option value="1" <c:if test="${resume.militaryBranch_ser == 'army'}">selected</c:if>>육군</option>
                                    <option value="2" <c:if test="${resume.militaryBranch_ser == 'navy'}">selected</c:if>>해군</option>
                                    <option value="3" <c:if test="${resume.militaryBranch_ser == 'airforce'}">selected</c:if>>공군</option>
                                    <option value="4" <c:if test="${resume.militaryBranch_ser == 'Marine'}">selected</c:if>>해병</option>
                                    <option value="5" <c:if test="${resume.militaryBranch_ser == 'policeman'}">selected</c:if>>의경</option>
                                    <option value="6" <c:if test="${resume.militaryBranch_ser == 'combatpolice'}">selected</c:if>>전경</option>
                                    <option value="7" <c:if test="${resume.militaryBranch_ser == 'etc'}">selected</c:if>>기타</option>
                                    <option value="8" <c:if test="${resume.militaryBranch_ser == 'socialserviceworker'}">selected</c:if>>사회복무요원</option>
                                    <option value="9" <c:if test="${resume.militaryBranch_ser == 'firefighting'}">selected</c:if>>의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ser">
                                    <option value="" <c:if test="${resume.rank_ser == ''}">selected</c:if>>군별선택</option>
                                    <option value="1" <c:if test="${resume.rank_ser == '1'}">selected</c:if>>이병</option>
                                    <option value="2" <c:if test="${resume.rank_ser == '2'}">selected</c:if>>일병</option>
                                    <option value="3" <c:if test="${resume.rank_ser == '3'}">selected</c:if>>상병</option>
                                    <option value="4" <c:if test="${resume.rank_ser == '4'}">selected</c:if>>병장</option>
                                    <option value="5" <c:if test="${resume.rank_ser == '5'}">selected</c:if>>하사</option>
                                    <option value="6" <c:if test="${resume.rank_ser == '6'}">selected</c:if>>중사</option>
                                    <option value="7" <c:if test="${resume.rank_ser == '7'}">selected</c:if>>상사</option>
                                    <option value="8" <c:if test="${resume.rank_ser == '8'}">selected</c:if>>원사</option>
                                    <option value="9" <c:if test="${resume.rank_ser == '9'}">selected</c:if>>준위</option>
                                    <option value="10" <c:if test="${resume.rank_ser == '10'}">selected</c:if>>소위</option>
                                    <option value="11" <c:if test="${resume.rank_ser == '11'}">selected</c:if>>중위</option>
                                    <option value="12" <c:if test="${resume.rank_ser == '12'}">selected</c:if>>대위</option>
                                    <option value="13" <c:if test="${resume.rank_ser == '13'}">selected</c:if>>소령</option>
                                    <option value="14" <c:if test="${resume.rank_ser == '14'}">selected</c:if>>중령</option>
                                    <option value="15" <c:if test="${resume.rank_ser == '15'}">selected</c:if>>대령</option>
                                    <option value="16" <c:if test="${resume.rank_ser == '16'}">selected</c:if>>준장</option>
                                    <option value="17" <c:if test="${resume.rank_ser == '17'}">selected</c:if>>소장</option>
                                    <option value="18" <c:if test="${resume.rank_ser == '18'}">selected</c:if>>중장</option>
                                    <option value="19" <c:if test="${resume.rank_ser == '19'}">selected</c:if>>대장</option>
                                    <option value="20" <c:if test="${resume.rank_ser == '20'}">selected</c:if>>기타</option>
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
        
        <div class="">
            <button type="button" class="preview">미리 보기</button>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
