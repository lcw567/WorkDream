<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>워크드림</title>
    <link rel="icon" href="${pageContext.request.contextPath}/img/logo_icon.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/enrollresume.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <!-- contextPath를 JavaScript 변수로 정의 -->
    <script type="text/javascript">
        var contextPath = '${pageContext.request.contextPath}';
    </script>
    <script src="${pageContext.request.contextPath}/js/dynamicFields.js" defer></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<script src="${pageContext.request.contextPath}/js/enrollresume.js" defer></script>
<body>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <div id="inner">
        <form id="resumeForm" action="insert.re" method="post" enctype="multipart/form-data">
            <div class="resume_title">
                <h1>이력서 제목</h1> 
                <input type="text" name="resumeTitle" placeholder="이력서의 제목을 입력해주세요." required>
                <div class="resumeStatus">
                    <label class="resumeYorN">이력서 공개 여부</label>
                    <input type="hidden" name="resumeStatusHidden" value="N"/>
                    <label for="resumeY">
                        <input type="checkbox" id="resumeY" name="resumeStatus" value="Y"/>
                        <span></span>&nbsp;
                    </label>
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
                                <input type="text" name="userName" required>
                            </fieldset>
                            <fieldset class="gender">
                                <select name="userGender" id="selectgender" required>
                                    <option value="남자">남</option>
                                    <option value="여자">여</option>
                                </select>
                            </fieldset>
                            <fieldset class="birthday">
                                <legend class="userbirth">생년월일*</legend>
                                <input type="date" name="userBirth" required>
                            </fieldset>
                        </div>
                        <div id="basic2">  
                            <fieldset class="email">
                                <legend class="useremail">이메일*</legend>
                                <input type="email" name="userEmail" required>
                            </fieldset>
                            <button type="button" class="email_check">인증</button>
                        </div>
                        <div id="basic3">  
                            <fieldset class="phone">
                                <legend class="userphone">전화번호*</legend>
                                <input type="text" name="userPhone" required>
                            </fieldset>
                            <button type="button" class="phone_check">인증</button>
                        </div>
                        <div id="basic4">
                            <fieldset class="address">
                                <legend class="useraddress">주소*</legend>
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="userAddress" required>
                            </fieldset>
                            <input type="button" class="addressNum" name="usernumberaddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
                            <fieldset class="dtaddress1">
                                <legend class="roadAddress">도로명주소*</legend>
                                <input type="text" id="roadAddress" name="userRoadAddress" placeholder="도로명주소" required>
                            </fieldset>
                            <fieldset class="dtaddress2">
                                <legend class="detailAddress">상세주소*</legend>
                                <input type="text" id="detailAddress" name="userDetailAddress" placeholder="상세주소" required>
                            </fieldset>
                        </div>
                        <div id="basic5">
                            <img src="${pageContext.request.contextPath}/img/file.png" class="profile_img" alt="">
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
                                <select name="educationLevel" id="selectedu" onchange="displayEducationFields()">
                                    <option value="">학력 구분 선택*</option>
                                    <option value="초등학교">초등학교</option>
                                    <option value="중학교">중학교</option>
                                    <option value="고등학교">고등학교</option>
                                    <option value="대학교/대학원 이상 졸업">대학교/대학원 이상 졸업</option>
                                </select>
                            </fieldset>
                        </div>
                        
                        <!-- 초등학교 정보 -->
                        <div id="elementaryFields" style="display: none;">    
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_el" class="element_name" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_el" class="status" >
                                        <option value="">졸업 여부</option>
                                        <option value="졸업">졸업</option>
                                        <option value="중퇴">중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>중입 검정고시(초졸)</label>
                                    <label for="middle_exam">
                                        <input type="checkbox" id="middle_exam" name="examPassed_el" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_el" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_el" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_el" class="select_lo" >
                                        <option value="">지역 선택</option>
                                        <option value="서울">서울</option>
                                        <option value="부산">부산</option>
                                        <option value="대구">대구</option>
                                        <option value="인천">인천</option>
                                        <option value="광주">광주</option>
                                        <option value="대전">대전</option>
                                        <option value="울산">울산</option>
                                        <option value="세종">세종</option>
                                        <option value="제주">제주</option>
                                        <option value="강원">강원</option>
                                        <option value="경기">경기</option>
                                        <option value="충북">충북</option>
                                        <option value="충남">충남</option>
                                        <option value="전북">전북</option>
                                        <option value="전남">전남</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="해외">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 중학교 정보 -->
                        <div id="middleSchoolFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_mi" class="middle_name" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_mi" class="status" >
                                        <option value="">졸업 여부</option>
                                        <option value="졸업">졸업</option>
                                        <option value="중퇴">중퇴</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>고입 검정고시(중졸)</label>
                                    <label for="high_exam">
                                        <input type="checkbox" id="high_exam" name="examPassed_mi" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_mi" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_mi" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_mi" class="select_lo" >
                                        <option value="">지역 선택</option>
                                        <option value="서울">서울</option>
                                        <option value="부산">부산</option>
                                        <option value="대구">대구</option>
                                        <option value="인천">인천</option>
                                        <option value="광주">광주</option>
                                        <option value="대전">대전</option>
                                        <option value="울산">울산</option>
                                        <option value="세종">세종</option>
                                        <option value="제주">제주</option>
                                        <option value="강원">강원</option>
                                        <option value="경기">경기</option>
                                        <option value="충북">충북</option>
                                        <option value="충남">충남</option>
                                        <option value="전북">전북</option>
                                        <option value="전남">전남</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="해외">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 고등학교 정보 -->
                        <div id="highSchoolFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_hi" class="high_name" >
                                </fieldset>
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_hi" class="status" >
                                        <option value="">졸업 여부</option>
                                        <option value="졸업">졸업</option>
                                        <option value="재학중">재학중</option>
                                        <option value="중퇴">중퇴</option>
                                        <option value="졸업예정">졸업예정</option>
                                    </select>
                                </fieldset>
                                <div class="exam">
                                    <label>대입 검정고시</label>
                                    <label for="college_exam">
                                        <input type="checkbox" id="college_exam" name="examPassed_hi" value="Y"/>
                                        <span></span>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_hi" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_hi" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_hi" class="select_lo" >
                                        <option value="">지역 선택</option>
                                        <option value="서울">서울</option>
                                        <option value="부산">부산</option>
                                        <option value="대구">대구</option>
                                        <option value="인천">인천</option>
                                        <option value="광주">광주</option>
                                        <option value="대전">대전</option>
                                        <option value="울산">울산</option>
                                        <option value="세종">세종</option>
                                        <option value="제주">제주</option>
                                        <option value="강원">강원</option>
                                        <option value="경기">경기</option>
                                        <option value="충북">충북</option>
                                        <option value="충남">충남</option>
                                        <option value="전북">전북</option>
                                        <option value="전남">전남</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="해외">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                        
                        <!-- 대학교 정보 -->
                        <div id="collegeFields" style="display: none;">
                            <div class="form-group1">
                                <fieldset class="input-group">
                                    <legend>학교명 *</legend>
                                    <input type="text" name="academicName_col" class="college_name" >
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>전공 *</legend>
                                    <input type="text" name="majorName_col" class="major_name" >
                                </fieldset>
                                    
                                <fieldset class="input-group">
                                    <legend>학제 *</legend>
                                    <select name="degree_col" class="degree" >
                                        <option value="">학제</option>
                                        <option value="2년제">2년제</option>
                                        <option value="3년제">3년제</option>
                                        <option value="4년제">4년제</option>
                                        <option value="대학원(석사)">대학원(석사)</option>
                                        <option value="대학원(박사)">대학원(박사)</option>
                                    </select>
                                </fieldset>
                
                                <fieldset class="input-group">
                                    <legend>졸업 여부 *</legend>
                                    <select name="graduationStatus_col" class="status" >
                                        <option value="">졸업 여부</option>
                                        <option value="졸업">졸업</option>
                                        <option value="재학중">재학중</option>
                                        <option value="휴학중">휴학중</option>
                                        <option value="중퇴">중퇴</option>
                                        <option value="자퇴">자퇴</option>
                                        <option value="졸업예정">졸업예정</option>
                                    </select>
                                </fieldset>
                            </div>
                            <div class="form-group2">
                                <fieldset class="input-group">
                                    <legend>입학 년월</legend>
                                    <input type="date" name="enterDate_col" class="enter_date" >
                                </fieldset>
                                
                                <fieldset class="input-group">
                                    <legend>졸업 년월</legend>
                                    <input type="date" name="graduationDate_col" class="graduation_date" >
                                </fieldset>
        
                                <fieldset class="input-group">
                                    <legend>지역 선택</legend>
                                    <select name="location_col" class="select_lo" >
                                        <option value="">지역 선택</option>
                                        <option value="서울">서울</option>
                                        <option value="부산">부산</option>
                                        <option value="대구">대구</option>
                                        <option value="인천">인천</option>
                                        <option value="광주">광주</option>
                                        <option value="대전">대전</option>
                                        <option value="울산">울산</option>
                                        <option value="세종">세종</option>
                                        <option value="제주">제주</option>
                                        <option value="강원">강원</option>
                                        <option value="경기">경기</option>
                                        <option value="충북">충북</option>
                                        <option value="충남">충남</option>
                                        <option value="전북">전북</option>
                                        <option value="전남">전남</option>
                                        <option value="경북">경북</option>
                                        <option value="경남">경남</option>
                                        <option value="해외">해외</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </div>
        
            <!-- 경력 -->
            <div class="Career">
                <fieldset class="career">
                    <legend class="career_Lv">경력</legend>
                    <label class="careerYorN">경력이 있을 경우 선택해주세요.</label>
                    <label for="CareerY">
                        <input type="checkbox" id="CareerY" name="career_present"/>
                        <span></span>&nbsp;
                    </label>
                    <div class="career1">
                        <fieldset class="company_title">
                            <legend>회사명</legend>
                            <input type="text" class="com_title" name="companyTitle" >
                        </fieldset>
                        <fieldset class="enter_com">
                            <legend>입사년월</legend>
                            <input type="date" name="startDateWork" >
                        </fieldset>
                        <fieldset class="retire_com">
                            <legend>퇴사년월</legend>
                            <input type="date" name="endDateWork">
                        </fieldset>
                        <fieldset class="input-group">
                            <legend>근무현황</legend>
                            <select name="careerStatus" class="career_status" >
                                <option value="">근무현황</option>
                                <option value="재직중">재직중</option>
                                <option value="퇴사">퇴사</option>
                                <option value="퇴사예정">퇴사예정</option>
                            </select>
                        </fieldset>
                    </div>
                    <div class="career2">
                        <fieldset class="job">
                            <legend>직무</legend>
                            <input type="text" class="job_name" name="work" >
                        </fieldset>
                        <fieldset class="department">
                            <legend>근무부서</legend>
                            <input type="text" class="department_name" name="department" >
                        </fieldset>
                        <fieldset class="position">
                            <legend>직급/직책</legend>
                            <input type="text" class="position_name" name="position" >
                        </fieldset>
                    </div>
                    <div class="career3">
                        <fieldset class="job_content">
                            <legend>담당업무</legend>
                            <textarea name="jobContent" id="j_content" placeholder="담당업무를 입력해주세요.
            
            - 진행한 업무를 다 적기보다는 경력사항 별로 중요합니다!
            
            - 담당한 업무 내용을 요약해서 작성해보세요!
            
            - 경력별 프로젝트 내용을 적을 경우, 역할/팀구성/기여도/성과를 기준으로 요약해서 작성해보세요!" ></textarea>
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
                    <div id="sk_title2" style="display: none;">
                        <div id="MYsk">
                            <h1>나의 스킬</h1>
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
                                <option value="교내활동">교내활동</option>
                                <option value="인턴">인턴</option>
                                <option value="자원봉사">자원봉사</option>
                                <option value="동아리">동아리</option>
                                <option value="아르바이트">아르바이트</option>
                                <option value="사회활동">사회활동</option>
                                <option value="수행과제">수행과제</option>
                                <option value="해외연수">해외연수</option>
                                <option value="교육이수내역">교육이수내역</option>
                            </select>
                        </fieldset>
                        <fieldset class="place">
                            <legend class="place_name">기관/장소</legend>
                            <input type="text" name="organizationName" >
                        </fieldset>
                        <fieldset class="start_date">
                            <legend>시작년월</legend>
                            <input type="date" name="startDateAct" >
                        </fieldset>
                        <fieldset class="finish_date">
                            <legend>종료년월</legend>
                            <input type="date" name="endDateAct">
                        </fieldset>
                    </div>
                    <div class="exp2">
                        <fieldset class="exp_content">
                            <legend>활동설명</legend>
                            <textarea name="description" id="e_content" placeholder="경험/활동 상세내용 입력" ></textarea>
                        </fieldset>
                    </div>
                </fieldset>
            </div>
        
            <div class="awards">
                <fieldset class="select_awards">
                    <legend class="awa">자격/어학/수상</legend>
                    <div class="AWARDS">
                        <fieldset class="select_inner">
                            <legend>구분</legend>
                            <select name="category" id="sortation">
                                <option value="">구분*</option>
                                <option value="자격증/면허증">자격증/면허증</option>
                                <option value="어학시험">어학시험</option>
                                <option value="수상내역/공모전">수상내역/공모전</option>
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
                                        <option value="1급">1급</option>
                                        <option value="2급">2급</option>
                                        <option value="3급">3급</option>
                                        <option value="4급">4급</option>
                                        <option value="5급">5급</option>
                                        <option value="6급">6급</option>
                                        <option value="7급">7급</option>
                                        <option value="8급">8급</option>
                                        <option value="9급">9급</option>
                                        <option value="10급">10급</option>
                                        <option value="11급">11급</option>
                                        <option value="12급">12급</option>
                                        <option value="13급">13급</option>
                                        <option value="14급">14급</option>
                                        <option value="15급">15급</option>
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
                    <div class="result-list-certificate">
                        <!-- 자격증 리스트 아이템들이 추가됩니다. -->
                    </div>
                    <div class="result-list-language">
                        <!-- 어학시험 리스트 아이템들이 추가됩니다. -->
                    </div>
                    <div class="result-list-awards">
                        <!-- 수상내역 리스트 아이템들이 추가됩니다. -->
                    </div>
                </fieldset>
            </div>
        
            <!-- 취업우대사항 -->
            <div class="Preferential">
                <fieldset class="preferential">
                    <legend class="pre_title">취업우대사항</legend>
                    <div class="pre1">
                        <fieldset class="pre_content">
                            <legend>보훈사유</legend>
                            <input type="text" name="veteranReason" placeholder="보훈사유 입력">
                        </fieldset>
                    </div>
                    <div class="pre2">
                        <fieldset class="mil_sub">
                            <legend>병역대상</legend>
                            <select name="serviceStatus" id="military_status">
                                <option value="대상아님">대상아님</option>
                                <option value="미필">미필</option>
                                <option value="군필">군필</option>
                                <option value="면제">면제</option>
                                <option value="복무중">복무중</option>
                            </select>
                        </fieldset>
                        <div class="unfulfilled" id="unfulfilledFields" style="display: none;">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="unfulfilledReason" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <div class="EXEMPTED" id="exemptedFields" style="display: none;">
                            <fieldset class="exempted">
                                <legend>사유 입력</legend>
                                <input type="text" name="exemptionReason" placeholder="사유 입력">
                            </fieldset>
                        </div>
                        <div class="fulfilled" id="fulfilledFields" style="display: none;">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="date" name="enlistmentDate_ful">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="date" name="dischargeDate_ful">
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch_ful">
                                    <option value="">군별선택</option>
                                    <option value="육군">육군</option>
                                    <option value="해군">해군</option>
                                    <option value="공군">공군</option>
                                    <option value="해병">해병</option>
                                    <option value="의경">의경</option>
                                    <option value="전경">전경</option>
                                    <option value="기타">기타</option>
                                    <option value="사회복무요원">사회복무요원</option>
                                    <option value="의무소방">의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ful">
                                    <option value="">계급선택</option>
                                    <option value="이병">이병</option>
                                    <option value="일병">일병</option>
                                    <option value="상병">상병</option>
                                    <option value="병장">병장</option>
                                    <option value="하사">하사</option>
                                    <option value="중사">중사</option>
                                    <option value="상사">상사</option>
                                    <option value="원사">원사</option>
                                    <option value="준위">준위</option>
                                    <option value="소위">소위</option>
                                    <option value="중위">중위</option>
                                    <option value="대위">대위</option>
                                    <option value="소령">소령</option>
                                    <option value="중령">중령</option>
                                    <option value="대령">대령</option>
                                    <option value="준장">준장</option>
                                    <option value="소장">소장</option>
                                    <option value="중장">중장</option>
                                    <option value="대장">대장</option>
                                    <option value="기타">기타</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>전역사유 선택</legend>
                                <select name="dischargeReason_ful" id="discharge_reason">
                                    <option value="">전역사유</option>
                                    <option value="만기전역">만기전역</option>
                                    <option value="의가사전역">의가사전역</option>
                                    <option value="의병전역">의병전역</option>
                                    <option value="소집해제">소집해제</option>
                                    <option value="불명예전역">불명예전역</option>
                                    <option value="상이전역">상이전역</option>
                                    <option value="기타">기타</option>
                                </select>
                            </fieldset>
                        </div>
                        <div class="serving" id="servingFields" style="display: none;">
                            <fieldset>
                                <legend>입대일</legend>
                                <input type="date" name="enlistmentDate_ser">
                            </fieldset>
                            <fieldset>
                                <legend>전역일</legend>
                                <input type="date" name="dischargeDate_ser" readonly>
                            </fieldset>
                            <fieldset>
                                <legend>군별선택</legend>
                                <select name="militaryBranch_ser">
                                    <option value="">군별선택</option>
                                    <option value="육군">육군</option>
                                    <option value="해군">해군</option>
                                    <option value="공군">공군</option>
                                    <option value="해병">해병</option>
                                    <option value="의경">의경</option>
                                    <option value="전경">전경</option>
                                    <option value="기타">기타</option>
                                    <option value="사회복무요원">사회복무요원</option>
                                    <option value="의무소방">의무소방</option>
                                </select>
                            </fieldset>
                            <fieldset>
                                <legend>계급선택</legend>
                                <select name="rank_ser">
                                    <option value="">계급선택</option>
                                    <option value="이병">이병</option>
                                    <option value="일병">일병</option>
                                    <option value="상병">상병</option>
                                    <option value="병장">병장</option>
                                    <option value="하사">하사</option>
                                    <option value="중사">중사</option>
                                    <option value="상사">상사</option>
                                    <option value="원사">원사</option>
                                    <option value="준위">준위</option>
                                    <option value="소위">소위</option>
                                    <option value="중위">중위</option>
                                    <option value="대위">대위</option>
                                    <option value="소령">소령</option>
                                    <option value="중령">중령</option>
                                    <option value="대령">대령</option>
                                    <option value="준장">준장</option>
                                    <option value="소장">소장</option>
                                    <option value="중장">중장</option>
                                    <option value="대장">대장</option>
                                    <option value="기타">기타</option>
                                </select>
                            </fieldset>
                        </div>
                    </div>
                </fieldset>
            </div>
            <!-- 포트폴리오 섹션 -->
            <div class="Portfolio">
                <fieldset class="portfolio">
                    <legend class="por_title">포트폴리오</legend>
                    <div class="input_port">
                        <div class="selected_port">
                            <!-- 선택된 포트폴리오가 여기 표시됩니다 -->
                        </div>
                        <div class="btn_port">
                            <button type="button" class="btn btn-primary select_port">불러오기</button>
                        </div>
                    </div>
                </fieldset>
            </div>
            
            <!-- 선택된 포트폴리오의 ID를 저장할 hidden input 컨테이너 -->
            <div id="selectedPortfolios">
                <!-- JavaScript에서 동적으로 hidden input이 추가됩니다 -->
            </div>
            
            <!-- 이력서 등록 버튼 -->
            <button type="submit" class="btn btn-success">이력서 등록</button>
        </form>

        <!-- 포트폴리오 목록을 표시하는 모달 -->
        <div class="modal" id="portfolioModal" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">포트폴리오 선택</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="portfolioForm">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="resumePortfolios" value="2002" id="portfolio2002">
                                <label class="form-check-label" for="portfolio2002">
                                    포트폴리오 제목 1
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="resumePortfolios" value="2003" id="portfolio2003">
                                <label class="form-check-label" for="portfolio2003">
                                    포트폴리오 제목 2
                                </label>
                            </div>
                            <!-- 추가 포트폴리오 항목들 -->
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="selectPortfolioButton">선택</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </div>
            </div>
        </div>


            <!-- 제출 버튼 -->
            <div class="btn_select">
                <button type="submit" class="final_save">작성 완료</button>
            </div>
        </form>
    </div>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
